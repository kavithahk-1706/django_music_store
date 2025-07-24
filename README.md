# Django Music Store (Harmony Hub)

This is a Django-based e-commerce project that includes user registration with email verification, password reset functionality, and flexible login options (username/email). The project uses MySQL as the database backend with Foreign Key constraints.

## Features

* User Registration with Email Verification
* Password Reset Functionality
* Login with Username or Email
* MySQL Database with Foreign Key Constraints

**Note:** Responsive design is not implemented yet. The UI currently works best on desktop. Mobile support will be added in future updates.

## Setup Instructions

### 1. Clone the Repository

Download or clone the project repository to your local machine:

```bash
git clone https://github.com/kavithahk-1706/django_music_store.git
cd django_music_store
```

### 2. Install Dependencies

Make sure you have Python and pip installed. Use the following command to install all required Python libraries:

```bash
pip install -r requirements.txt
```

Ensure the `requirements.txt` file includes all dependencies such as Django and `mysqlclient`.

### 3. Configure the Database

Update the `DATABASES` setting in `settings.py` to match your MySQL credentials:

```python
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
```

### 4. Import the Database

Locate the database dump file in the `database/` folder and import it into your MySQL database:

```bash
mysql -u your_mysql_user -p your_database_name < database/backup.sql
```

### 5. Run Migrations

Run Django migrations to ensure the database structure matches the models:

```bash
python manage.py makemigrations
python manage.py migrate
```

### 6. Run the Development Server

Start the Django development server:

```bash
python manage.py runserver
```

Visit the application in your browser at `http://127.0.0.1:8000`.

## Usage

### 1. User Registration

* Navigate to the `/register/` page to create a new account.
* Check your email for the verification link to activate your account.

### 2. Login

* Use either your username or email to log in.

### 3. Password Reset

* If you forget your password, use the "Forgot Password" link on the login page to receive a password reset email.

## Notes

* Make sure you have a working SMTP configuration in your `settings.py` or `.env` file for email functionality.
* Email verification and password reset depend on using proper SMTP credentials.
* If you're using Gmail, you'll need to set up an app password and store it in your `.env` file.

Example for `.env`:

```env
EMAIL_BACKEND=django.core.mail.backends.smtp.EmailBackend
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=your_email@gmail.com
EMAIL_HOST_PASSWORD=your_app_password
```

Do not commit your `.env` file to version control. Make sure `.gitignore` includes it.

## Contributing

Feel free to fork this repository and submit pull requests for new features or bug fixes.

This project is open-source and free to use.
