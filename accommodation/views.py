#!/usr/bin/env python
import os
import datetime
from django.http import Http404
from django.shortcuts import render, redirect
from django.utils import timezone
from django.db.models import Count
from django.contrib.auth.decorators import login_required
from geopy import geocoders
from geopy.geocoders import GoogleV3
from accommodation.forms import PropertyCreationForm, PropertyImageForm, ReservationForm, PropertyChangeForm, SearchForm
from accommodation.models import Accommodation, AccommodationImage, Reservation



# Create your views here.
def index_view(request):
    #get top ten accommodation e images
    top10 = Accommodation.objects.filter(reservation__accommodation__in=Accommodation.objects.all(), visible=True).annotate(n_res=Count('reservation')).order_by('-n_res').distinct()[:10]
    top10image = AccommodationImage.objects.filter(accommodation_id__in=top10.values('id')).values('accommodation_id', 'image').order_by('id')

    #search accommmodations and get images
    if request.method=="POST":
        searchForm = SearchForm(request.POST)
        if searchForm.is_valid():
            services = searchForm.cleaned_data['service']
            services = services.split(",")
            inDate = searchForm.cleaned_data['inDate']
            outDate = searchForm.cleaned_data['outDate']
            reservedAccommodation = Reservation.objects.filter(checkin__lt=inDate, checkout__gt=inDate).values('accommodation_id').distinct()
            reservedAccommodation1 = Reservation.objects.filter(checkin__lt=outDate, checkout__gt=outDate).values('accommodation_id').distinct()
            reservedAccommodation2 = Reservation.objects.filter(checkin__gte=inDate, checkout__lte=outDate).values('accommodation_id').distinct()
            reservedAccommodation3 = Reservation.objects.filter(checkin__lt=inDate, checkout__gt=outDate).values('accommodation_id').distinct()
            reservedAccommodation = (reservedAccommodation | reservedAccommodation1 | reservedAccommodation2 | reservedAccommodation3).distinct()

            searchResult = Accommodation.objects.exclude(id__in=reservedAccommodation).order_by('price')

            if len(services) and services[0] != '':
                for result in searchResult:
                    for service in services:
                        if service not in result.services:
                            searchResult = searchResult.exclude(id=result.id)
            else:
                searchResult = searchResult

            searchResultImage = AccommodationImage.objects.filter(accommodation_id__in=searchResult.values('id')).values('accommodation_id', 'image').order_by('id')
            return render(request, 'accommodation/index.html', {'searchForm':searchForm, 'searchResult':searchResult, 'searchResultImage':searchResultImage, 'top10':top10, 'top10image':top10image})  
    else:
        searchForm = SearchForm()      
        return render(request,'accommodation/index.html', {'searchForm':searchForm, 'top10':top10, 'top10image':top10image})

def getCoord(address):
    #insert correct API_KEY
    API_KEY = os.getenv("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    g = GoogleV3(api_key=API_KEY)

    coord=(0.0,0.0)
    try:
        location = g.geocode(address, timeout=15)
        coord = (location.latitude, location.longitude)
    except Exception as e:
        print('Impossible resolve:', e)
    return coord

#@login_required(redirect_field_name='accommodation:property')
def property_view(request):
    if not request.user.id == None:        
        if request.method == 'POST':
            form = PropertyCreationForm(request.POST)
            if form.is_valid():
                coord = getCoord(str(request.POST.get('country', '')+", "+request.POST.get('city', '')+", "+request.POST.get('postal_code', '')+", "+request.POST.get('address', '')))
                accommodation = form.save(commit=False)
                accommodation.seller = request.user
                accommodation.latitude = coord[0]
                accommodation.longitude = coord[1]
                accommodation.publication_date = timezone.now()
                accommodation.save()
                request.session['property_id'] = accommodation.pk
                return redirect('accommodation:imageUploader')
        else:
            form = PropertyCreationForm()
            property_list = Accommodation.objects.filter(seller=request.user)
            args = {'form':form, 'property_list':property_list}
            return render(request, 'accommodation/property.html', args)
    else:
        return render(request, 'accommodation/property.html')

def imageUploader_view(request):
    if request.method == 'POST':
        imgForm = PropertyImageForm(request.POST, request.FILES)
        if "exit" not in request.POST:
            if imgForm.is_valid():
                img = imgForm.save(commit=False)
                img.accommodation_id = request.session.get('property_id')
                img = imgForm.save()
            if "uploadNext" in request.POST:
                return redirect('accommodation:imageUploader')
            if "uploadExit" in request.POST:
                del request.session['property_id']
                return redirect('accommodation:property')
        else:
            del request.session['property_id']
            return redirect('accommodation:property')

    else:
        imgForm = PropertyImageForm()
        return render(request, 'accommodation/imageUploader.html', {'imgForm':imgForm,})


def getAvailableDateList(pk,reservationList):
    dateRanges = reservationList.values('checkin','checkout')
    dateList=[]
    for dateRange in dateRanges:
        days = (dateRange.get("checkout")-dateRange.get("checkin")).days
        for day in range(0,days):
            dateList.append(str(dateRange.get("checkin")+datetime.timedelta(days = day)))
    return dateList 


def propertyDetailed_view(request, pk):
    reservationForm = ReservationForm()
    try:
        propertyDetailed = Accommodation.objects.get(pk=pk)
    except Accommodation.DoesNotExist:
        raise Http404('This property does not exist')
    try:
        propertyImages = AccommodationImage.objects.filter(accommodation=pk).values('image')
    except AccommodationImage.DoesNotExist:
        print("No image found!")

    reservationList = Reservation.objects.filter(accommodation_id=pk, checkin__gte=datetime.date.today()).order_by('checkin')
    dateList = getAvailableDateList(pk,reservationList)

    if request.method == 'POST':
        modifyPropertyForm = PropertyChangeForm(request.POST, instance=propertyDetailed)
        if modifyPropertyForm.is_valid():
            modifyPropertyForm.save()

    modifyPropertyForm = PropertyChangeForm(instance=propertyDetailed)

    args =  {'propertyDetailed': propertyDetailed, 'propertyImages': propertyImages, 'reservationForm': reservationForm, 'modifyPropertyForm': modifyPropertyForm, 'dateList':dateList, 'reservationList':reservationList}
    return render(request, 'accommodation/propertyDetailed.html', args)

def reservation_view(request):
    if not request.user.id == None:
        if request.method == "POST":
            print(request.META.get('HTTP_REFERER'))

            reservationForm = ReservationForm(request.POST)
            if reservationForm.is_valid():
                reservation = reservationForm.save(commit=False)

                accommodation_id = request.META.get('HTTP_REFERER').strip('/').split('/')[-1]
                reservation.accommodation_id = accommodation_id
                reservation.user_id = request.user.id
                price = Accommodation.objects.get(pk=accommodation_id).price
                days = abs((reservation.checkout-reservation.checkin).days)
                reservation.total_price = price*days                
                reservation.paid = True
                reservation.save()

        newRes = Reservation.objects.filter(user=request.user, checkin__gte=datetime.date.today())
        oldRes = Reservation.objects.filter(user=request.user, checkin__lt=datetime.date.today())
        return render(request, 'accommodation/reservation.html', {'newReservations': newRes, 'oldReservations': oldRes})
    else:
        return render(request, 'accommodation/reservation.html')


def deleteReservation_view(request, pk):
    reservation = Reservation.objects.get(pk=pk)
    if request.user == reservation.user:
        if request.method == "POST":
            try:
                reservation.delete()
            except Reservation.DoesNotExist:
                raise Http404('This property does not exist')
            return redirect('accommodation:reservation')
        else:
            return render(request, 'accommodation/deleteReservation.html', {'reservation':reservation})
    else:
        return render(request, 'error403.html')
    