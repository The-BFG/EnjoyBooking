from django import forms
from django.contrib.auth.forms import ReadOnlyPasswordHashField

from .models import CustomUser


class UserCreationForm(forms.ModelForm):
    #A form for creating new users. Includes all the required fields, plus a repeated password.
    password1 = forms.CharField(label='*Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='*Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['email', 'first_name', 'last_name', 'birth_date', 'city', 'address', 'postal_code', 'avatar', 'phone']# 'date_joined', 'last_login'
        
        labels = {
            'email': ('*Email'),
            'first_name': ('*Name'),
            'last_name': ('*Surname'),
            'birth_date': ('Date of Birth'),
            'postal_code': ('Postal Code'),
            'avatar': ('Profile picture'),
            'phone': ('Phone Number'),
            'last_login': ('Last login'),
            'date_joined': ('Date joined'),
        }

    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def clean_avatar(self):
        avatar = self.cleaned_data.get('avatar')
        # try:
        #     w, h = get_image_dimensions(avatar)
        #     #validate dimensions
        #     max_width = max_height = 1920
        #     if w > max_width or h > max_height:
        #         raise forms.ValidationError(u'Please use an image that is %s x %s pixels or smaller.' % (max_width, max_height))

        #     #validate content type
        #     main, sub = avatar.content_type.split('/')
        #     if not (main == 'image' and sub in ['jpeg', 'pjpeg', 'gif', 'png']):
        #         raise forms.ValidationError(u'Please use a JPEG, GIF or PNG image.')

        #     #validate file size
        #     if len(avatar) > (20 * 1024):
        #         raise forms.ValidationError(u'Avatar file size may not exceed 20k.')

        # except AttributeError:
        #     """
        #     Handles case when we are updating the user profile
        #     and do not supply a new avatar
        #     """
        #     raise forms.ValidationError(u'Please load an image')

        return avatar

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        user.set_password(self.cleaned_data.get("password1"))
        if commit:
            user.save()
        return user

class UserChangeForm(forms.ModelForm):
    #A form for updating users. Includes all the fields on the user, but replaces the password field with admin's password hash display field.
    password = ReadOnlyPasswordHashField()

    class Meta:
        model = CustomUser
        fields = ('email', 'password', 'first_name', 'last_name', 'birth_date', 'city', 'address', 'postal_code', 'avatar', 'phone', 'is_active', 'is_admin')

    def clean_password(self):
        # Regardless of what the user provides, return the initial value. This is done here, rather than on the field, because the
        # field does not have access to the initial value
        return self.initial["password"]

class EditProfileForm(forms.ModelForm):  
    class Meta: 
        model = CustomUser
        fields = (
            'email',
            'first_name',
            'last_name',
            'birth_date',
            'city',
            'address',
            'postal_code',
            'phone',
        )

class ChangeAvatarForm(forms.ModelForm):
    class Meta:
        model = CustomUser
        fields = ['avatar']
        labels = {'avatar': ('Select profile picture'), }
