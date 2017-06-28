from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
import django
from django.conf import settings

# Create your models here.
class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)

    def __str__(self):
        return str(self.cart_id)

    class Meta:
        verbose_name_plural = "cart"


class MyUserManager(BaseUserManager):
    def create_user(self, email, first_name, last_name, contact, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            contact=contact
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, first_name, last_name, contact, password):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
            first_name=first_name,
            last_name=last_name,
            contact=contact
        )
        user.is_admin = True
        user.save(using=self._db)
        return user



class User(AbstractBaseUser):
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=100, null=True)
    last_name = models.CharField(max_length=100, null=True)
    address_line1 = models.CharField(null=True, blank=True, max_length=100)
    address_line2 = models.CharField(max_length=100, null=True, blank=True, )
    state = models.CharField(max_length=100, null=True, blank=True, )
    country = models.CharField(max_length=100, null=True, blank=True, )
    pin_code = models.CharField(max_length=20, null=True, blank=True, )
    user_type = models.CharField(max_length=20, default="Consumer" )
    last_cart = models.ForeignKey(Cart, null=True, blank=True, on_delete=models.CASCADE)
    contact = models.CharField(max_length=15)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name','last_name','contact']

    class Meta:
        verbose_name_plural = "users"

    def __str__(self):
        return self.email

    def get_full_name(self):
        # The user is identified by their email address
        return self.email

    def get_short_name(self):
        # The user is identified by their email address
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


class Crop(models.Model):
    crop_id = models.AutoField(primary_key=True)
    local_name = models.CharField(max_length=100, null=True)
    english_name = models.CharField(max_length=100, null=True)
    short_name = models.CharField(max_length=11, null=False, default='Unknown')
    scientific_name = models.CharField(max_length=100, null=True)
    shelf_life = models.IntegerField(default=48)
    imagepath = models.CharField(max_length=100, null=True)
    availability = models.FloatField(default=0)
    price = models.FloatField()

    def __str__(self):
        return self.english_name

    class Meta:
        verbose_name_plural = "crops"


class Machine(models.Model):
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True)
    machine_id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=20)
    location = models.CharField(max_length=255)
    date_of_manufacture = models.DateTimeField()
    version = models.CharField(max_length=20)
    last_login = models.DateTimeField()

    def __str__(self):
        return str(self.machine_id)

    class Meta:
        verbose_name_plural = "machines"


class Produce(models.Model):
    machine_id = models.ForeignKey(Machine, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    farm_id =models.IntegerField()
    image = models.CharField(max_length=255)
    show_image = models.BooleanField(default=True)
    weight = models.FloatField()
    timestamp = models.DateTimeField()
    date_of_produce = models.DateTimeField()
    date_of_expiry = models.DateTimeField()
    sold = models.FloatField(default=0)
    wasted = models.FloatField(default=0)

    def __str__(self):
        # user = Machine.objects.get(machine_id = self.machine_id.machine_id)
        return str(self.machine_id.user_id.first_name + " - " + self.crop_id.english_name)

    class Meta:
        verbose_name_plural = "produce"


class Inventory(models.Model):
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    weight = models.FloatField()
    sold = models.FloatField(default=0)
    wasted = models.FloatField(default=0)
    minimum = models.FloatField(default=50)
    maximum = models.FloatField(default=600)
    price = models.FloatField(default=0.0)
    shelf_life = models.IntegerField(default=48)

    def __str__(self):
        return str(self.user_id.first_name + "-" + self.crop_id.english_name)

    class Meta:
        verbose_name_plural = "inventories"


class Cart_session(models.Model):
    cart_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.cart_id)

    class Meta:
        verbose_name_plural = "cart sessions"


class Order(models.Model):
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='Consumer')
    cart_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    seller = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='Producer')
    weight = models.FloatField(default=0)
    time = models.DateTimeField(default=django.utils.timezone.now)
    delivery_date = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=20, default="pending")

    def __str__(self):
        return str(self.user_id.first_name + "-" + self.seller.first_name + "-" + self.crop_id.english_name)

    class Meta:
        verbose_name_plural = "orders"


class Alert(models.Model):
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    message = models.TextField()
    type = models.CharField(max_length=20,default="unknown")
    timestamp = models.DateTimeField(default=django.utils.timezone.now)

    def __str__(self):
        return str(self.user_id.first_name)

class Review(models.Model):
    user_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='user_id')
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,related_name='customer')
    cart_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    rating = models.FloatField(default=0)
    review = models.TextField()
    timestamp = models.DateTimeField(default=django.utils.timezone.now)
