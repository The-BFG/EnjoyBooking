#!/usr/bin/env python
from django.contrib import admin
from accommodation.models import Accommodation, AccommodationImage, Reservation

# Register your models here.
admin.site.register(Accommodation)
admin.site.register(AccommodationImage)
admin.site.register(Reservation)
