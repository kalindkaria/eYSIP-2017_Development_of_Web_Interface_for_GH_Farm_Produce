# Django


This folder contains the entire project. The various sub-folders and files are explained below:

> manage.py

The file that is used to manage over the entire django app. It has various possible calls. Some examples:
```
# run the development server on HOST:PORT
python3 manage.py runserver [HOST]:[PORT]

# Make database migrations after changing the models
python3 manage.py makemigrations

# apply the maigrations to database
python3 manage.py migrate

# create a super user for admin
python3 manage.py createsuperuser

# create a new app
python3 manage.py startapp app_name
```

> ghfarm

This folder contains the main Django Project. It has the major files control the entire project.

* settings.py
  This file contains the major settings such which database backend to use, database passwords, password hashers, email settings, allowed hostnames, etc.

* urls.py
  This file maps the various possible urls to the various views. To change anything on the website you can trace the corresponding view from here.

* wsgi.py
  This is the file used for deployment on production servers. Mostly there should not be a need to change it.

> farmapp
> machine
> predict

These are the folders for the three apps of this project. Each folder has following files:

* models.py
  This where the actual database model is defined.

* views.py
  This is where the various view functions are defined

* forms.py
  This is where the various forms used in the views are defined

* admin.py
  This where the models are registered on the admin site.

* migrations/
  This folder holds the various database migrations required for the app.

> templates

This is the folder where all the templates for the project reside. To modify any page find the template rendered for that view and then modify it over here.

> static

This is the folder that contains all the static files used for rendering the HTML. It contains all the js, css, cropimages, icons, etc. used by Bootstrap, datepickers, datatables, admin interface, etc.

> media

This folder contains the files for download. The analytics files for download are created and stored here.

> images (in gitignore, needs to be created)

This folder contains all the images recieved from the smart weighing machine for different produce.

> autotrain (in gitignore, needs to be created)

This folder seperates all the images into seperate folders as per crop shortnames for retraining of the prediction model.

> checkpoints/
> inception/
> veg
> cache.py, nostradamus.py, inception.py, dataset.py, download.py, veg.pkl

All files required for the prediction module.

> reqirement.txt

This file contains all the python3 requirements of the project. To install type
```
pip3 install -r requirements.txt
```
