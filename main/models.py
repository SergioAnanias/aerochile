from django.db import models
import bcrypt
import re
from datetime import datetime, date

class UserManager(models.Manager):
    def validator(self, postData):
        errors={}
        if len(postData["first_name"]) < 3:
            errors["first_name"]="Su nombre debe contener al menos 3 caracteres"
        if len(postData["last_name"]) < 3:
            errors["last_name"]="Su apellido debe tener al menos 3 caracteres"
        # Valida si el campo esta vacio o no
        if len(postData["email"])>0:
            EMAIL_REGEX=re.compile(r'[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+')
        # Valida si el email sigue una expresión regular
            if not re.match(EMAIL_REGEX, postData["email"]):
                errors["email"]="Email no valido"
        # Valida si el correo existe o no
            if len(User.objects.filter(email=postData["email"])) > 0:
                errors["exists"]= "El correo ya existe"
        # Valida la longitud de la contraseña
        if len(postData["password"]) == 0 or len(postData["password"]) < 5:
            errors["passwordlen"]= "La contraseña debe tener al menos 5 caracteres"
        #Valida si las constraseñas coinciden
        elif postData["password"] != postData["cpassword"]:
            errors["password"] = "Las contraseñas no coinciden"
    #Valida si la fecha no esta nula, es una fecha valida, y ademas si es que la fecha esta en pasado
        return errors
    #Valida la información del login
    def loginvalidator(self, postData):
        errors={}
        if len(User.objects.filter(email=postData["email"])) == 0:
            errors['notfound']= "Not valid login"
        else:
            pw1= User.objects.get(email=postData["email"]).password
            if not bcrypt.checkpw(postData['password'].encode(), pw1.encode()):
                errors['password']="Not valid login"
        return errors

class TravelManager(models.Manager):
    def validator(self, postData):
        errors={}
        if len(Travel.objects.filter(code=postData["code"])) > 0:
            errors["code"]= "El codigo ya existe"
        if datetime.strptime(postData["flightdate"], "%Y-%m-%d") < datetime.now():
            errors["flightdate"] = "La fecha debe ser futura para agendar un vuelo"
        if postData["origin"] == postData["destination"]:
            errors["origin"] = "El origen y el destino deben ser distintos"
        if postData["origin"] != Plane.objects.get(enrollment=postData["enrollment"]).current_city:
            errors["enrollment"] = "El Avión no se encuentra disponible en la ciudad de origen"
        if len(Travel.objects.filter(planes=postData["enrollment"]))>0:
            if Travel.objects.filter(planes=postData["enrollment"]).last().scheduled == True:
                errors["plane"] = "El avión ya se encuentra agendado"
        return errors

class PassengerManager(models.Manager):
    def validator(self, postData, code):
        errors={}
        travel = Travel.objects.get(code=code)
        if postData["vaccine"] == "Other" and postData["othervaccine"] == "":
            errors["vaccine"] = "Debe ingresar una vacuna valida"
        if len(Passenger.objects.filter(travel=travel.id)) > 140:
            errors["capacity"]="La capacidad del avión esta a tope"
        if travel.completed:
            errors["completed"]="El vuelo ha sido completado"
        return errors


class Vaccine(models.Model):
    name = models.CharField(max_length=45)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class User(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    dateborn = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects= UserManager()
    def __str__(self):
        return f"{self.first_name} {self.last_name}"
    def __repr__(self):
        return f"{self.first_name} {self.last_name}"

class Plane(models.Model):
    model = models.CharField(max_length=45)
    enrollment = models.CharField(max_length=45, unique=True)
    current_city = models.CharField(max_length=45, default="SCL")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Travel(models.Model):
    code = models.CharField(max_length=45, unique=True)
    origin = models.CharField(max_length=45)
    flightdate = models.DateTimeField()
    destination = models.CharField(max_length=45)
    scheduled = models.BooleanField(default=True)
    completed = models.BooleanField(default=False)
    planes = models.ForeignKey('Plane', related_name='planes', on_delete=models.SET_NULL, blank=True,null=True)
    objects= TravelManager()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Passenger(models.Model):
    name = models.CharField(max_length=100)
    rut = models.CharField(max_length=10)
    birthday = models.DateTimeField()
    travel = models.ForeignKey('Travel', related_name='travels', on_delete=models.SET_NULL, blank=True,null=True)
    vaccine = models.ForeignKey('Vaccine', related_name="vaccine", on_delete=models.SET_NULL, blank=True,null=True)
    objects = PassengerManager()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
