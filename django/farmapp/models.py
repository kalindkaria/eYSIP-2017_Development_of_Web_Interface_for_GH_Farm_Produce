from django.db import models
import datetime
# Create your models here.
class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    def __str__(self):
        return str(self.cart_id)
    class Meta:
        verbose_name_plural = "cart"

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField()
    first_name= models.CharField(max_length=100,null=True)
    last_name= models.CharField(max_length=100,null=True)
    password = models.CharField(max_length=20)
    address_line1 = models.CharField(max_length=100)
    address_line2 = models.CharField(max_length=100,null=True)
    state = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    pin_code = models.CharField(max_length=20)
    user_type = models.CharField(max_length=20)
    last_cart = models.ForeignKey(Cart,null=True,on_delete=models.CASCADE)
    contact = models.TextField()
    def __str__(self):
        return self.email
    class Meta:
        verbose_name_plural = "users"

class Crop(models.Model):
    crop_id = models.AutoField(primary_key=True)
    local_name = models.CharField(max_length=100,null=True)
    english_name = models.CharField(max_length=100,null=True)
    short_name = models.CharField(max_length=11,null=False,default='Unknown')
    scientific_name = models.CharField(max_length=100,null=True)
    shelf_life = models.FloatField()
    imagepath = models.CharField(max_length=100,null=True)
    availability = models.FloatField(default=0)
    price = models.FloatField()
    def __str__(self):
        return self.english_name
    class Meta:
        verbose_name_plural = "crops"

class Machine(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE,null=True)
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

class Trough(models.Model):
    trough_id = models.AutoField(primary_key=True)
    machine_id = models.ForeignKey(Machine,on_delete=models.CASCADE)
    def __str__(self):
        return str(self.machine_id)
    class Meta:
        verbose_name_plural = "troughs"

class Produce(models.Model):
    machine_id = models.ForeignKey(Machine,on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    trough_id = models.ForeignKey(Trough,on_delete=models.CASCADE)
    image = models.CharField(max_length=255)
    weight = models.FloatField()
    timestamp = models.DateTimeField()
    date_of_produce = models.DateTimeField()
    date_of_expiry = models.DateTimeField()
    status = models.FloatField()
    def __str__(self):
        # user = Machine.objects.get(machine_id = self.machine_id.machine_id)
        return str(self.machine_id.user_id.first_name +" - "+ self.crop_id.english_name)
    class Meta:
        verbose_name_plural = "produce"

class Inventory(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    weight = models.FloatField()
    minimum = models.FloatField(default=0)
    maximum = models.FloatField(default=0)
    def __str__(self):
        return str(self.user_id)
    class Meta:
        verbose_name_plural = "inventories"

class Cart_session(models.Model):
    cart_id = models.ForeignKey(Cart,on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    time = models.DateTimeField(default=datetime.datetime.now())
    def __str__(self):
        return str(self.cart_id)
    class Meta:
        verbose_name_plural = "cart sessions"

class Order(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='Consumer')
    cart_id = models.ForeignKey(Cart_session, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    seller = models.ForeignKey(User, on_delete=models.CASCADE,related_name='Producer')
    weight = models.FloatField(default=0)
    delivery_date = models.DateTimeField()
    def __str__(self):
        return str(self.user_id+"-"+self.seller+"-"+self.delivery_date)
    class Meta:
        verbose_name_plural = "orders"
