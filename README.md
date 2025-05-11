
This is a Django-based e-commerce project that includes a user registration system with email verification, password reset functionality, and flexible login (username/email). The project uses MySQL as the database backend with Foreign Key constraints.
Features
- User Registration with Email Verification
- Password Reset Functionality
- Login with Username or Email
- MySQL Database with Foreign Key Constraints
Responsive design is not implemented yet — the UI currently works best on desktop. Mobile support will be added in future updates.



Project Structure
MyProject/
├── app_1/
│   ├── migrations/
│   ├── templates/
│   │   ├── register.html
│   │   ├── verify_email.html
│   └── models.py
├── static/
├── database/
│   └── your_database_dump.sql  
├── manage.py
├── settings.py
└── README.md



Setup Instructions
1. Clone the Repository
Download or clone the project repository to your local machine:
git clone https://github.com/kavithahk-1706/django_music_store.git
cd MyProject


2. Install Dependencies
Make sure you have Python and pip installed. Use the following command to install all required Python libraries:
pip install -r requirements.txt


Ensure the requirements.txt file includes all dependencies such as Django and mysqlclient.


3. Configure the Database
Update the DATABASES setting in settings.py to match your MySQL credentials:
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'your_database_name',
        'USER': 'your_mysql_user',
        'PASSWORD': 'your_mysql_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}



4. Import the Database
Locate the database dump file (your_database_dump.sql) in the database/ folder and import it into your MySQL database.
Command Line:
mysql -u your_mysql_user -p your_database_name < database/your_database_dump.sql



5. Run Migrations
Run Django migrations to ensure the database structure matches the models:
python manage.py makemigrations
python manage.py migrate



6. Run the Development Server
Start the Django development server:
python manage.py runserver


Visit the application in your browser at http://127.0.0.1:8000.

Usage
1. User Registration
- Navigate to the /register/ page to create a new account.
- Check your email for the verification link to activate your account.

2. Login
- Use either your username or email to log in.

3. Password Reset
- If you forget your password, use the "Forgot Password" link on the login page to receive a password reset email.


Notes
- Make sure you have a working SMTP configuration in settings.py for email functionality.
- Example for Gmail:EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'your_email@gmail.com'
EMAIL_HOST_PASSWORD = 'your_email_password'




Feel free to fork this repository and submit pull requests for new features or bug fixes.


This project is open-source and free to use.


