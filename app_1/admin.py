from django.contrib import admin
from .models import CustomUser, Products, Cart, CartItem, Order, OrderItem, Query, Review, FAQ

admin.site.register(CustomUser)
admin.site.register(Products)
admin.site.register(Cart)
admin.site.register(CartItem)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Query)
admin.site.register(Review)
admin.site.register(FAQ)

# Register your models here.
