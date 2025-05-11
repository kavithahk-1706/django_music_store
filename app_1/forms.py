from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser
from django.core.exceptions import ValidationError

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    class Meta: 
        model=CustomUser
        fields=['first_name','last_name','username','email','phone_number','address','password1','password2']
    def clean_email(self):
        email = self.cleaned_data['email']
        if CustomUser.objects.filter(email=email).exists():
            raise ValidationError("This email is already in use.")
        return email

from django import forms
from .models import Query

class QueryForm(forms.ModelForm):
    class Meta:
        model = Query
        fields = ['subject', 'message']
        widgets = {
            'subject': forms.TextInput(attrs={'class': 'input-field'}),
            'message': forms.Textarea(attrs={'class': 'textarea-field'}),
        }


