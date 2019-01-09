#!/usr/bin/env python
from django.db import models
from django.utils import timezone
from django_mysql.models import ListCharField
from accounts.models import CustomUser

# Create your models here.
class Accommodation(models.Model):
    seller = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    country = models.CharField(max_length=85)
    city = models.CharField(max_length=85)
    address = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=10)
    latitude = models.DecimalField(max_digits=19, decimal_places=15, default=0, null=True, blank=True)
    longitude = models.DecimalField(max_digits=19, decimal_places=15, default=0, null=True, blank=True)
    publication_date = models.DateTimeField(default=timezone.now)
    beds = models.PositiveSmallIntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.TextField(max_length=500)
    services = ListCharField(
        base_field=models.CharField(max_length=50),
        size=40,
        max_length=(40*51))
    visible = models.BooleanField(default=True)
    def __str__(self):
        return self.name

def getAccImageName(instance, filename):
    return "accommodationImage/%s/%s" % (instance.accommodation_id, filename)

class AccommodationImage(models.Model):
    accommodation = models.ForeignKey(Accommodation, on_delete=models.CASCADE, null=True, blank=True)
    image = models.ImageField(upload_to=getAccImageName, verbose_name='Image')

class Reservation(models.Model):
    accommodation = models.ForeignKey(Accommodation, on_delete=models.CASCADE)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    checkin = models.DateField()
    checkout = models.DateField()
    paid = models.BooleanField()
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
