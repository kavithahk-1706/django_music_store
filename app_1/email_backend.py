from django.contrib.auth.backends import BaseBackend
from django.contrib.auth import get_user_model
from django.contrib.auth.tokens import PasswordResetTokenGenerator
import re

class EmailOrUsernameBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        User = get_user_model()
        
        try:
            if re.match(r"[^@]+@[^@]+\.[^@]+", username):
                user = User.objects.get(email=username)
            else:
                user = User.objects.get(username=username)
        except User.DoesNotExist:
            return None

        if user.check_password(password):
            return user
        return None

    def get_user(self, user_id):
        User = get_user_model()
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None


class EmailVerificationTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return (
            str(user.pk) + str(timestamp) + str(user.is_active)
        )

account_activation_token = EmailVerificationTokenGenerator()