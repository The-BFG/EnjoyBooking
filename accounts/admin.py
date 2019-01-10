#!/usr/bin/env python
from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .forms import *


class UserAdmin(BaseUserAdmin):
    # The forms to add and change user instances
    form = UserChangeForm
    add_form = UserCreationForm

    # The fields to be used in displaying the User model. These override the definitions on the base UserAdmin that reference specific fields on auth.User.
    list_display = ('email', 'first_name', 'last_name', 'birth_date', 'city', 'address', 'postal_code', 'phone', 'is_admin')
    list_filter = ('is_admin',)
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'birth_date', 'phone')}),
        ('Address', {'fields': ('city', 'address', 'postal_code')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
        ('Permissions', {'fields': ('is_admin',)}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'first_name', 'last_name', 'birth_date', 'city', 'address', 'postal_code', 'phone', 'password1', 'password2')}
        ),
    )
    search_fields = ('email','first_name','last_name')
    ordering = ('email','first_name','last_name','birth_date')
    filter_horizontal = ()

admin.site.register(CustomUser, UserAdmin)
admin.site.unregister(Group)
