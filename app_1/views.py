from django.shortcuts import render, redirect, get_object_or_404
from .models import Products, Cart, CartItem, Order, OrderItem, Wishlist, WishlistItem, Review, FAQ
from collections import defaultdict
from datetime import datetime
from .forms import CustomUserCreationForm
from django.core.mail import EmailMessage
from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.sites.shortcuts import get_current_site
from .email_backend import account_activation_token  # Import the token generator
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_decode
from django.utils.encoding import force_str
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth import get_user_model
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from django.contrib.auth import update_session_auth_hash
from .forms import QueryForm
from django.conf import settings
import logging
from smtplib import SMTPException
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect
import socket

def product_list(request):
    categories = Products.objects.values_list('category', flat=True).distinct()
    products = Products.objects.all()
    categories_with_banner = ["Tabla", "Mridangam", "Veena", "Sitar", "Flute"]
    return render(request, 'app_1/product_list.html', {
        'products': products,
        'categories': categories,
        'categories_with_banner': categories_with_banner,  # Pass the list to the template
    })

def home(request):
    qlpo = Products.objects.all()
    categories = {}
    categories_with_banner = ["Tabla", "Mridangam", "Veena", "Sitar", "Flute"]
    # Populate categories dictionary with the first image per category
    for p in qlpo:
        if p.category not in categories:  # If the category is not yet populated with an image
            categories[p.category] = p.image_url  # Save the first image URL

    selected_categories = ['Veena', 'Condenser Microphone', 'Mridangam', 'Acoustic Guitar']
    products = Products.objects.filter(category__in=selected_categories)

    categorized_products = defaultdict(list)

    # Categorize products and limit to the first 3 products per category
    for product in products:
        if len(categorized_products[product.category]) < 3:  # Only add up to 3 products per category
            categorized_products[product.category].append(product)

    current_year = datetime.now().year

    # Merging both contexts into a single dictionary
    context = {
        'categories': dict(categorized_products),  # For filtered products by category
        'category_images': categories,  # First image of each category (now a single URL)
        'current_year': current_year,
        'categories_with_banner': categories_with_banner
    }

    return render(request, 'app_1/index.html', context)


# REGISTER USER AND SEND EMAIL
def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)

        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False  # Don’t activate yet

            try:
                user.save()  #  SAVE FIRST, so user.pk isn't None
                current_site = get_current_site(request)
                uid = urlsafe_base64_encode(force_bytes(user.pk))
                token = default_token_generator.make_token(user)

                mail_subject = 'Activate your account'
                message = render_to_string('app_1/email_verification.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': uid,
                    'token': token,
                })
                to_email = form.cleaned_data.get('email')
                email = EmailMessage(mail_subject, message, to=[to_email])
                email.send()

            except (SMTPException, socket.gaierror, socket.timeout):
                user.delete()  # Rollback if email fails
                messages.error(request, "Couldn't send verification email. Try again.")
                return redirect('register')

            return redirect('verification_sent')
        else:
            messages.error(request, "Fix the form errors and try again.")
    else:
        form = CustomUserCreationForm()

    return render(request, 'app_1/register.html', {'form': form})

# SHOW VERIFICATION SENT PAGE
def verification_sent(request):
    return render(request, 'app_1/verification_sent.html')

# RESEND VERIFICATION LINK
def resend_verification(request):
    if request.method == 'POST':
        email = request.POST.get('email')

        try:
            user = get_user_model().objects.get(email=email)
            if user.is_active:
                messages.info(request, "Account already activated.")
                return redirect('login')

            uid = urlsafe_base64_encode(force_bytes(user.pk))
            token = default_token_generator.make_token(user)

            subject = "Activate Your Account"
            message = render_to_string('app_1/email_verification.html', {
                'user': user,
                'domain': get_current_site(request).domain,
                'uid': uid,
                'token': token,
            })

            send_mail(subject, message, 'noreply@yourdomain.com', [email])
            messages.success(request, "New verification link sent.")
            return redirect('verification_sent')

        except get_user_model().DoesNotExist:
            messages.error(request, "This email is not registered.")
            return redirect('resend_verification')
        except (SMTPException, socket.gaierror, socket.timeout):
            messages.error(request, "Email sending failed. Check your internet.")
            return redirect('resend_verification')

    return render(request, 'app_1/resend_verification.html')

# ACTIVATE ACCOUNT
def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = get_user_model().objects.get(pk=uid)

        if default_token_generator.check_token(user, token):
            user.is_active = True
            user.save()
            messages.success(request, "Your account has been activated!")
            return redirect('login')
        else:
            messages.error(request, "Activation link is invalid or expired.")
            return redirect('resend_verification')

    except get_user_model().DoesNotExist:
        messages.error(request, "User doesn't exist.")
        return redirect('resend_verification')
    except Exception as e:
        messages.error(request, f"Something went wrong: {str(e)}")
        return redirect('resend_verification')

def custom_logout(request):
    logout(request)
    return redirect('home')


def product_detail(request, product_id):
    product = get_object_or_404(Products, id=product_id)

    categories_with_banner = ["Tabla", "Mridangam", "Veena", "Sitar", "Flute"]

    recommendations = Products.objects.filter(category=product.category).exclude(id=product.id)[:4]
    reviews = product.reviews.all().order_by('-created_at')
    
    return render(request, 'app_1/product_detail.html', {
        'product': product, 
        'recommendations': recommendations,
        'reviews': reviews,
        'categories_with_banner': categories_with_banner
    })



@login_required
def add_to_cart(request, product_id):
    product = get_object_or_404(Products, id=product_id)
    quantity = int(request.POST.get('qty', 1))


    if quantity > product.stock:
        quantity = product.stock  # don't let 'em order more than what's there

    cart, _ = Cart.objects.get_or_create(user=request.user)

    cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)
    if not created:
        cart_item.quantity += quantity
    else:
        cart_item.quantity = quantity
    cart_item.save()

    return redirect('view_cart')


@login_required
def view_cart(request):
    cart, _ = Cart.objects.get_or_create(user=request.user)
    cart_items = cart.cart_items.select_related('product')
    for item in cart_items:
        item.total_price = item.product.price * item.quantity
    total = sum(item.total_price for item in cart_items)


    

    return render(request, 'app_1/cart.html', {
        'cart_items': cart_items,
        'total': total
    })


@login_required
def update_cart_item(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    
    if request.method == 'POST':
        try:
            quantity = int(request.POST.get('quantity'))

            if quantity <= 0:
                cart_item.delete()
            else:
                # Cap quantity to product stock
                if quantity > cart_item.product.stock:
                    quantity = cart_item.product.stock
                
                cart_item.quantity = quantity
                cart_item.save()
        except (ValueError, TypeError):
            pass 

    return redirect('view_cart')



@login_required
def remove_cart_item(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    cart_item.delete()
    return redirect('view_cart')

import random

@login_required
def checkout(request):
    product_id = request.GET.get('product_id')
    qty = int(request.GET.get('qty', 1))  # 👈 get the damn quantity or default to 1
    items = []

    if product_id:
        product = get_object_or_404(Products, id=product_id)
        items.append({
            'product': product,
            'quantity': qty,  # 👈 use the real quantity here
            'subtotal': product.price * qty
        })

        total_price = product.price * qty
        print("product_id:", product_id)
        print("items:", items)
        print("request.method:", request.method)

    else:
        cart, _ = Cart.objects.get_or_create(user=request.user)
        cart_items = CartItem.objects.filter(cart=cart)
        for item in cart_items:
            items.append({
                'product': item.product,
                'quantity': item.quantity,
                'subtotal': item.quantity * item.product.price
            })

        total_price = sum(item.product.price * item.quantity for item in cart_items)

    order_result = None
    if request.method == 'POST':
        payment_method = request.POST.get('payment_method')
        address = request.POST.get('address') or request.user.address

        order = Order.objects.create(
            user=request.user,
            address=address,
            payment_method=payment_method,
            status='Pending',
            total_price=total_price
        )

        for i in items:
            OrderItem.objects.create(
                order=order,
                product=i['product'],
                quantity=i['quantity'],
            )

            i['product'].stock -= i['quantity']
            i['product'].save()

        if payment_method == 'COD':
            order.payment_status = random.choice(['Pending', 'Paid'])
            order.status = random.choice(['Confirmed', 'Shipped', 'Delivered'])
            order.save()
            order_result = 'success'

        else:
            success = random.random() <= 0.8

            if success:
                order.payment_status = 'Paid'
                order.status = random.choice(['Confirmed', 'Shipped', 'Delivered'])
                order_result = 'success'

                if not product_id:
                    CartItem.objects.filter(cart=cart).delete()
            else:
                order.payment_status = 'Failed'
                order.reason = random.choice([
                    'The server is busy. Please try again later.',
                    'There was a server issue. Please try again.',
                    'There was a network issue. Please check your connectivity and try again.',
                    'Something went wrong. Please try again.'
                ])
                request.session['reason'] = order.reason
                order.status = 'Failed'
                order_result = 'failure'

                for item in order.order_items.all():
                    item.product.stock += item.quantity
                    item.product.save()
            order.save()

        return redirect('order_result', result=order_result)

    return render(request, 'app_1/checkout.html', {
        'items': items,
        'total_price': total_price
    })

@login_required
def order_result(request, result):
    reason = request.session.pop('reason', None)
    product_id = request.session.pop('buy_now_product_id', None)

    context = {
        'result': result,
        'reason': reason,
        'retry_url': None
    }

    if result == 'failure':
        if product_id:
            context['retry_url'] = reverse('product_detail', args=[product_id])
        else:
            context['retry_url'] = reverse('checkout')
        

    return render(request, 'app_1/order_result.html', context)



@login_required
def order_history(request):
    orders = Order.objects.filter(user=request.user).order_by('-order_date')
    return render(request, 'app_1/order_history.html', {'orders': orders})

@login_required
def cancel_order(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    if order.status in ['Confirmed', 'Shipped']:
        order.status = 'Cancelled'
        order.save()

        # Restock items
        for item in order.order_items.all():
            item.product.stock += item.quantity
            item.product.save()

    return redirect('order_history')


@login_required
def return_order(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    if order.status == 'Delivered':
        order.status = 'Processing Return'
        order.save()
    return redirect('order_history')



@login_required
def settings_view(request):
    user = request.user
    if request.method == 'POST':
        try:
            user.first_name = request.POST.get('first_name')
            user.last_name = request.POST.get('last_name')
            user.username = request.POST.get('username')
            user.email = request.POST.get('email')
            user.address = request.POST.get('address')
            user.phone_number = request.POST.get('phone_number')

            new_password = request.POST.get('password')
            if new_password:
                user.set_password(new_password)

            user.save()
            update_session_auth_hash(request, user)
            messages.success(request, 'Profile updated successfully!')
        except Exception as e:
            print(f"Error updating profile: {e}")
            messages.error(request, 'Something went wrong while updating your profile.')
        
        return redirect('settings')

    return render(request, 'app_1/settings.html', {'user': user})


def about(request):
    return render(request,'app_1/about.html')



logger = logging.getLogger(__name__)



def contact_view(request):
    if request.method == 'POST':
        if not(request.user.is_authenticated):
            return redirect('login')
        form = QueryForm(request.POST)
        if form.is_valid():
            query = form.save(commit=False)
            query.user = request.user
            query.save()

            # Email sending logic
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            from_email = request.user.email
            to_email = [settings.EMAIL_HOST_USER]

            user_name = f"{request.user.first_name} {request.user.last_name}"
            user_email = request.user.email
            full_message = f"Query from {user_name} ({user_email}):\n\n{message}"

            try:
                send_mail(subject, full_message, from_email, to_email, fail_silently=False)
                messages.success(request, "Thanks for reaching out to us! We'll get back to you as soon as we can.")
                return redirect('contact')
            except (SMTPException, socket.gaierror, socket.timeout) as e:
                print(f"SMTP error occurred: {e}")  # Outputs the error to your terminal
                messages.error(request, "Oops! Something went wrong while sending your query.")
        else:
            messages.error(request, 'Oops! Something went wrong.')
    else:
        form = QueryForm()

    return render(request, 'app_1/contact.html', {'form': form})



@login_required
def submit_review(request, product_id):
    if request.method == 'POST':
        product = get_object_or_404(Products, pk=product_id)
        rating = int(request.POST.get('rating'))
        comment = request.POST.get('comment')
        
        Review.objects.create(
            product=product,
            user=request.user,
            rating=rating,
            comment=comment
        )
        return redirect('product_detail', product_id=product.id)




@login_required
def delete_account(request):
    if request.method == 'POST':
        user = request.user
        logout(request)  # log them out before deleting
        user.delete()
        return redirect('home')  # or your login page
    return redirect('settings')  # just in case someone tries GET

# views.py


def faqs(request):
    faqs = FAQ.objects.all()
    return render(request, 'app_1/faqs.html', {'faqs': faqs})



def custom_login_view(request):
    if request.method == "POST":
        username_or_email = request.POST.get('username_or_email')
        password = request.POST.get('password')

        # Authenticate using custom backend
        user = authenticate(request, username=username_or_email, password=password)

        if user is not None:
            login(request, user)
            return HttpResponseRedirect('/')  # Redirect to homepage or dashboard
        else:
            messages.error(request, "Invalid credentials")
            return redirect('login')  # Redirect back to login page if authentication fails

    return render(request, 'app_1/login.html')  # Adjust path if needed



CustomUser = get_user_model()




@login_required
def add_to_wishlist(request, product_id):
    product = get_object_or_404(Products, id=product_id)
    
    # Get or create the user's wishlist
    wishlist, created = Wishlist.objects.get_or_create(user=request.user)
    
    # Check if the product is already in the wishlist
    existing_item = WishlistItem.objects.filter(wishlist=wishlist, product=product).first()

    if existing_item:
        # If the product is already in the wishlist, remove it
        existing_item.delete()
    else:
        # If the product is not in the wishlist, add it
        WishlistItem.objects.create(wishlist=wishlist, product=product)

    # Redirect to the product detail page to show updated button
    return redirect('wishlist')



@login_required
def wishlist(request):
    # Get the user's wishlist or create one if it doesn't exist
    wishlist, created = Wishlist.objects.get_or_create(user=request.user)

    # Get all the wishlist items
    wishlist_items = WishlistItem.objects.filter(wishlist=wishlist)

    if request.method == 'POST':
        # Handle the bulk action
        action = request.POST.get('action')
        selected_items = request.POST.getlist('wishlist_items')  # Make sure the name is 'wishlist_items' in the template
        
        if action == 'add_to_cart':
            # Add selected wishlist items to cart
            cart, created = Cart.objects.get_or_create(user=request.user)
            for item_id in selected_items:
                try:
                    wishlist_item = WishlistItem.objects.get(id=item_id)
                    # Create cart item
                    CartItem.objects.create(cart=cart, product=wishlist_item.product, quantity=1)
                    # Remove from wishlist
                    wishlist_item.delete()
                except WishlistItem.DoesNotExist:
                    continue  

            # Redirect to the cart page after adding to cart
            return redirect('view_cart') 
        
        elif action == 'remove_from_wishlist':
            # Remove selected items from the wishlist
            for item_id in selected_items:
                try:
                    wishlist_item = WishlistItem.objects.get(id=item_id)
                    wishlist_item.delete()
                except WishlistItem.DoesNotExist:
                    continue  # Skip the item if it doesn't exist

        # Redirect to the wishlist page after processing the bulk action
        return redirect('wishlist')

    # Context data to send to the template
    context = {
        'wishlist_items': wishlist_items,
    }

    return render(request, 'app_1/wishlist.html', context)
