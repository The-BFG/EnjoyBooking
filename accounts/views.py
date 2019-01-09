#!/usr/bin/env python
from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.models import update_last_login
from .forms import UserCreationForm, EditProfileForm, ChangeAvatarForm


# Create your views here.
def signup_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save()
            login(request, user)
            update_last_login(None, user)
            return redirect('accommodation:index')
    else:
        form = UserCreationForm()
    return render(request, 'accounts/signup.html', {'form':form})     

def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            update_last_login(None, user)
            return redirect('accommodation:index')
    else:
        form = AuthenticationForm()
    return render(request, 'accounts/login.html', {'form':form})

def logout_view(request):
    if request.method == 'POST':
        logout(request)
        return redirect('accommodation:index')

def profile_view(request):
    if request.method == 'POST':
        if "saveProfile" in request.POST:
            profile_data_form = EditProfileForm(request.POST, instance=request.user)
            if profile_data_form.is_valid():
                profile_data_form.save()
                return redirect('accounts:profile')
        if "uploadAvatar" in request.POST:
            avatar_form = ChangeAvatarForm(request.POST, request.FILES, instance=request.user)
            if avatar_form.is_valid():
                avatar_form.save()
                return redirect('accounts:profile')
    else:
        avatar_form = ChangeAvatarForm(instance=request.user)
        profile_data_form = EditProfileForm(instance=request.user)
        return render(request, 'accounts/profile.html', {"avatar_form":avatar_form, "profile_data_form":profile_data_form})
    