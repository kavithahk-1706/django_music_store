from django.db import models
from django.contrib.auth.models import AbstractUser

class Products(models.Model):
    name=models.CharField(max_length=255)
    category=models.CharField(max_length=255)
    price=models.DecimalField(max_digits=10,decimal_places=2)
    image_url=models.CharField(max_length=255)
    description=models.TextField()
    stock=models.IntegerField()

    def __str__(self):
        return self.name

from django import forms

from django.core.validators import RegexValidator
class CustomUser(AbstractUser):
   

    phone_regex = RegexValidator(regex=r'^\d{10}$', message="Phone number must be 10 digits.")
    

    address=models.TextField(blank=True,null=True)
    phone_number = models.CharField(validators=[phone_regex], max_length=10)
    email = models.EmailField(unique=True)


class Cart(models.Model):
    user=models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Cart - {self.user.username}"
    
class CartItem(models.Model):
    cart=models.ForeignKey(Cart, on_delete=models.CASCADE, related_name='cart_items')
    product=models.ForeignKey(Products, on_delete=models.CASCADE)
    quantity=models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.quantity} x {self.product.name} in {self.cart.user.username}'s cart"
    
class Order(models.Model):
    user=models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    order_date=models.DateTimeField(auto_now_add=True)
    total_price=models.DecimalField(max_digits=10,decimal_places=2)

    STATUS_CHOICES=[
        ('pending', 'Pending'),
        ('processing', 'Processing'),
        ('shipped', 'Shipped'),
        ('delivered', 'Delivered'),
        ('cancelled', 'Cancelled'),
        ('returned','Returned')
    ]

    status=models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    address=models.TextField()
    payment_method = models.CharField(max_length=20, choices=[('COD', 'Cash on Delivery'), ('Online', 'Online Payment')], default='COD')
    reason=models.TextField(default='Something went wrong. Please try again.')
    def __str__(self):
        return f"Order {self.id} by {self.user.username}"
    

class OrderItem(models.Model):
    order=models.ForeignKey(Order,on_delete=models.CASCADE, related_name='order_items')
    product=models.ForeignKey(Products,on_delete=models.CASCADE)
    quantity=models.PositiveIntegerField()
    
class Query(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    subject = models.CharField(max_length=255)
    message = models.TextField()
    submitted_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Query by {self.user.username} - {self.subject[:20]}"


class Review(models.Model):
    product = models.ForeignKey('Products', on_delete=models.CASCADE, related_name='reviews')
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    rating = models.IntegerField(default=5)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.product.name} ({self.rating}★)"

# models.py
class FAQ(models.Model):
    question = models.CharField(max_length=255)
    answer = models.TextField()

    def __str__(self):
        return self.question


class Wishlist(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Wishlist - {self.user.username}"

class WishlistItem(models.Model):
    wishlist = models.ForeignKey(Wishlist, on_delete=models.CASCADE, related_name='wishlist_items')
    product = models.ForeignKey(Products, on_delete=models.CASCADE)
    added_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.product.name} in {self.wishlist.user.username}'s wishlist"
