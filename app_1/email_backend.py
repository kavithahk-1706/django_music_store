import ssl
from django.core.mail.backends.smtp import EmailBackend

class CustomEmailBackend(EmailBackend):
    def open(self):
        if self.connection is None:
            # Initialize the SMTP connection directly
            self.connection = self.connection_class(self.host, self.port)  # Correct way to get the SMTP connection
            self.connection.starttls(context=ssl._create_unverified_context())  # Start TLS with custom SSL context
            self.connection.login(self.username, self.password)  # Login with your credentials
        return self.connection is not None
    
from django.contrib.auth.backends import BaseBackend
from django.contrib.auth import get_user_model
import re

class EmailOrUsernameBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        User = get_user_model()  # Get the custom user model
        
        try:
            # Check if input is an email
            if re.match(r"[^@]+@[^@]+\.[^@]+", username):
                user = User.objects.get(email=username)
            else:
                user = User.objects.get(username=username)
        except User.DoesNotExist:
            return None  # User not found

        if user.check_password(password):
            return user
        return None

    def get_user(self, user_id):
        User = get_user_model()  # Get the custom user model
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None


# utils.py or wherever you want
from django.contrib.auth.tokens import PasswordResetTokenGenerator

class EmailVerificationTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return (
            str(user.pk) + str(timestamp) + str(user.is_active)
        )

account_activation_token = EmailVerificationTokenGenerator()
