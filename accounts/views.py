#!/usr/bin/env python
from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.models import update_last_login
from .forms import UserCreationForm, EditProfileForm, ChangeAvatarForm, AvatarForm
from accounts.models import Avatar


# Create your views here.
def signup_view(request):
    if request.method == 'POST':
        userForm = UserCreationForm(request.POST, prefix='userForm')
        avatarForm = AvatarForm(request.POST, request.FILES, prefix='avatarForm')
        if userForm.is_valid():
            user = userForm.save()
            login(request, user)
            update_last_login(None, user)
            avatar = avatarForm.save(commit=False)
            avatar.user = user
            avatar.save()
            return redirect('accommodation:index')
    else:
        userForm = UserCreationForm(prefix='userForm')
        avatarForm = AvatarForm(prefix='avatarForm')
    return render(request, 'accounts/signup.html', {'userForm':userForm, 'avatarForm':avatarForm})

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
            avatar_form = ChangeAvatarForm(request.POST, request.FILES)
            if avatar_form.is_valid():
                avatar = avatar_form.save(commit=False)
                avatar.user = request.user
                avatar.save()
                return redirect('accounts:profile')
    else:
        avatar = Avatar.objects.filter(user=request.user).order_by('-id')[0]
        print(avatar)
        avatar_form = ChangeAvatarForm(instance=avatar)
        profile_data_form = EditProfileForm(instance=request.user)
        return render(request, 'accounts/profile.html', {"avatar_form":avatar_form, "profile_data_form":profile_data_form, 'avatar':avatar})
    