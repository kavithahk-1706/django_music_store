"""
URL configuration for harmony_hub project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app_1 import views
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home,name='home'),
    path('products/', views.product_list,name="products"),
    path('register/',views.register, name='register'),
    path('login/', views.custom_login_view, name='login'),
    path('logout/', views.custom_logout,name='logout'),
    path('product/<int:product_id>/', views.product_detail, name='product_detail'),
    path('cart/', views.view_cart, name='view_cart'),
    path('cart/add/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/update/<int:item_id>/', views.update_cart_item, name='update_cart_item'),  
    path('cart/remove/<int:item_id>/', views.remove_cart_item, name='remove_cart_item'),
    path('checkout/', views.checkout, name='checkout'),
    path('order_result/<str:result>/', views.order_result, name='order_result'),
    path('order_history/', views.order_history, name='order_history'),
    path('cancel_order/<int:order_id>/', views.cancel_order, name='cancel_order'),
    path('return_order/<int:order_id>/', views.return_order, name='return_order'),
    path('settings/', views.settings_view, name='settings'),
    path('about/',views.about,name='about'),
    path('contact/', views.contact_view,name='contact'),
    path('product/<int:product_id>/review/', views.submit_review, name='submit_review'),
    path('password-reset/', auth_views.PasswordResetView.as_view(template_name='app_1/password_reset.html'), name='password_reset'),
    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='app_1/password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='app_1/password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='app_1/password_reset_complete.html'), name='password_reset_complete'),
    path('delete-account/', views.delete_account, name='delete_account'),
    path('faqs/', views.faqs, name='faqs'),
    path('activate/<uidb64>/<token>/', views.activate, name='activate'),
    path('verification-sent/', views.verification_sent, name='verification_sent'),
    path('resend_verification/', views.resend_verification, name='resend_verification'),
    path('account/activate/<uidb64>/<token>/', views.activate, name='activate'),
    path('add_to_wishlist/<int:product_id>/', views.add_to_wishlist, name='add_to_wishlist'),
    path('wishlist/', views.wishlist, name='wishlist'),


    






    
]
