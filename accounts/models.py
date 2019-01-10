from django.db import models
from django.utils import timezone
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser
from django.core.validators import RegexValidator
import os
from django.conf import settings

# Create your models here.
class CustomUserManager(BaseUserManager):
    def create_user(self, email, password, first_name=None, last_name=None, birth_date=None, city=None, address=None, postal_code=None, phone=None):
        if not email:
            raise ValueError('Users must have an email address')

        now = timezone.now()
        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            birth_date=birth_date,
            city=city,
            address=address,
            postal_code=postal_code,
            phone=phone,
            last_login=now,
            date_joined=now,
            )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, first_name=None, last_name=None, birth_date=None, city=None, address=None, postal_code=None, phone=None):
        user = self.create_user(
            email,
            password=password,
            first_name=first_name,
            last_name=last_name,
            birth_date=birth_date,
            city=city,
            address=address,
            postal_code=postal_code,
            phone=phone
        )
        user.is_admin = True
        user.save(using=self._db)
        return user
    
phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")

    
class CustomUser(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    birth_date = models.DateField(default=None, null=True, blank=True)
    city = models.CharField(max_length=85, default=None, null=True, blank=True)
    address = models.CharField(max_length=100, default=None, null=True, blank=True)
    postal_code = models.CharField(max_length=10, default=None, null=True, blank=True)
    phone = models.CharField(validators=[phone_regex], default=None, max_length=17, null=True, blank=True)
    date_joined = models.DateTimeField(default=timezone.now)
    last_login = models.DateTimeField(default=timezone.now)

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name']

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin
        

def getImagePath(instance, filename):
    print(instance.user_id)
    return "profileImage/%s/%s" % (instance.user_id, filename)

class Avatar(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True, blank=True)
    avatar = models.ImageField(upload_to=getImagePath, default=os.path.join(settings.STATIC_URL, 'image/defaultProfile.png'), null=True, blank=True)
