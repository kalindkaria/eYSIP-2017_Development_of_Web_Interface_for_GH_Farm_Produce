from django.db import models

# Create your models here.
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
    contact = models.TextField()
    def __str__(self):
        return self.email

class Crop(models.Model):
    crop_id = models.AutoField(primary_key=True)
    local_name = models.CharField(max_length=100,null=True)
    english_name = models.CharField(max_length=100,null=True)
    scientific_name = models.CharField(max_length=100,null=True)
    shelf_life = models.FloatField()
    imagepath = models.CharField(max_length=100,null=True)
    price = models.FloatField()
    def __str__(self):
        return self.english_name

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

# class Producer(models.Model):
#     machine_id = models.ForeignKey(Machine,on_delete=models.CASCADE)
#     user_id = models.ForeignKey(User,on_delete=models.CASCADE)
#     def __str__(self):
#         return self.user_id


class Trough(models.Model):
    trough_id = models.AutoField(primary_key=True)
    machine_id = models.ForeignKey(Machine,on_delete=models.CASCADE)
    def __str__(self):
        return str(self.machine_id)

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

class Inventory(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    weight = models.FloatField()


class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    crop_id = models.ForeignKey(Crop, on_delete=models.CASCADE)
    weight = models.FloatField()
    time = models.DateTimeField()

class Order(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='Consumer')
    cart_id = models.ForeignKey(Cart, on_delete=models.CASCADE)
    seller = models.ForeignKey(User, on_delete=models.CASCADE,related_name='Producer')
    delivery_date = models.DateTimeField()