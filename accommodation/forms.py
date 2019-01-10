from django import forms
from accommodation.models import Accommodation, Reservation, AccommodationImage

class PropertyCreationForm(forms.ModelForm):
    class Meta():
        model = Accommodation
        fields = ['name', 'country', 'city', 'address', 'postal_code', 'beds', 'price', 'services', 'description', 'visible']
        labels = {
            'postal_code': ('Postal code'),
        }
        widgets = {
            'services': forms.TextInput(attrs={'placeholder': 'Service1,Service2,...',})
        }

class PropertyChangeForm(forms.ModelForm):
    class Meta():
        model = Accommodation
        fields = ['name', 'country', 'city', 'address', 'postal_code', 'beds', 'price', 'services', 'description', 'visible']
        labels = {
            'postal_code': ('Postal code'),
        }

class PropertyImageForm(forms.ModelForm):
    class Meta:
        model = AccommodationImage
        fields = ('image', )

class ReservationForm(forms.ModelForm):
    class Meta():
        model = Reservation
        fields = ('checkin', 'checkout',)


class SearchForm(forms.Form):
    service = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={'placeholder': 'wifi,spa,cucina,...'}))
    inDate = forms.DateField(required=True)
    outDate = forms.DateField(required=True)