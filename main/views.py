from django.shortcuts import render, HttpResponse, redirect
from .models import *
from django.contrib import messages
from django.http import JsonResponse
import bcrypt
from .decorators import loginauth

# Decorador de login
@loginauth
def index(request):
#Primero verifica si el usuario esta en la sesión, si no está lo manda al login, y si esta renderiza el index
    context={
        "usuario": User.objects.get(id=request.session['user']),
        "travels": Travel.objects.all()
    }
    return render(request, 'index.html', context)

def login(request):
#Render pantalla de login
    if not 'user' in request.session or not request.session['user']:
        return render(request, "login.html")
    return redirect("/")

def registerForm(request):
    if not 'user' in request.session or not request.session['user']:
        return render(request, "register.html")
#Render formulario de registro
    return redirect("/")

def register(request):
    if not 'user' in request.session or not request.session['user']:
        if request.method == "POST":
            errors = User.objects.validator(request.POST)
        # En caso de que se devuelvan errores del validador, se guardan con messages y se redirecciona al formulario de registro para mostrarlos
            if len(errors) > 0:
                for k, v in errors.items():
                    messages.error(request, v)
                return redirect("/register")
        #hashea la pw
            pwhash = bcrypt.hashpw(request.POST["password"].encode(), bcrypt.gensalt()).decode()
        # Se crea el usuario
            nuevo_usuario = User.objects.create(
                first_name=request.POST["first_name"],
                last_name=request.POST["last_name"],
                email=request.POST["email"],
                password=pwhash,
                dateborn=request.POST["dateborn"],
            )
        # Se logea el usuario
            request.session['user'] = nuevo_usuario.id
            messages.success(request, "Registered in successfully")
        # Luego de crear el registro redirecciona al index
            return redirect("/")
    else:
        return redirect("/")

@loginauth
# Limpia el request.session borrando todo lo de la session y redireccionando al login
def logout(request):
    request.session.flush()
    return redirect("/login")

def logged(request):
    errors = User.objects.loginvalidator(request.POST)
    if len(errors)> 0:
        for k, v in errors.items():
            messages.error(request, v)
        return redirect("/login")
    request.session['user'] = User.objects.get(email=request.POST["email"]).id
    messages.success(request, "Logged in successfully")
    return redirect("/")

@loginauth
def viewflight(request, code):
    travel = Travel.objects.get(code=code)
    context = {
        "usuario": User.objects.get(id=request.session['user']),
        "flight": travel,
        "passangers": Passenger.objects.filter(travel_id=travel.id)
        }
    return render(request, "viewflight.html", context)

@loginauth
def newflight(request):
    context={
        "usuario": User.objects.get(id=request.session['user']),
        "planes": Plane.objects.all()
    }
    return render(request, "newflight.html", context)

@loginauth
def addflight(request):
    print(request.POST)
    errors = Travel.objects.validator(request.POST)
    if len(errors)> 0:
        for k, v in errors.items():
            messages.error(request, v)
        return redirect("/flights/new")
    Travel.objects.create(
        code=request.POST["code"],
        origin=request.POST["origin"],
        destination=request.POST["destination"],
        scheduled=True,
        flightdate=request.POST["flightdate"],
        planes = Plane.objects.get(enrollment=request.POST["enrollment"]),
    )    
    return redirect("/")

@loginauth
def completed(request, code):
    travel = Travel.objects.get(code=code)
    travel.scheduled=False
    travel.completed=True
    travel.planes.current_city = travel.destination
    travel.save()
    plane = travel.planes
    plane.current_city = travel.destination
    plane.save()
    print(plane)
    print(plane.current_city)
    return redirect("/")

@loginauth
def newpassenger(request, code):
    context={
        "travel":Travel.objects.get(code=code),
        "usuario": User.objects.get(id=request.session['user']),
    }
    return render(request, "newpassenger.html",context)

@loginauth
def addpassenger(request, code):
    print(request.POST)
    errors = Passenger.objects.validator(request.POST, code)
    if len(errors)> 0:
        for k, v in errors.items():
            messages.error(request, v)
        return redirect("/flights/" + code +"/newpassenger")
    travel = Travel.objects.get(code=code)

    if request.POST["vaccine"]== "Other":
        if len(Vaccine.objects.filter(name=request.POST["othervaccine"])) > 0:
            vaccine = Vaccine.objects.get(name=request.POST["othervaccine"])
        else:
            vaccine = Vaccine.objects.create(name=request.POST["othervaccine"])
    else:
        if len(Vaccine.objects.filter(name=request.POST["vaccine"])) > 0:
            vaccine = Vaccine.objects.get(name=request.POST["vaccine"])
        else:
            vaccine = Vaccine.objects.create(name=request.POST["vaccine"])
    passenger = Passenger.objects.create(
        name=request.POST["name"],
        rut=request.POST["rut"],
        birthday=request.POST["birthday"],
        travel= travel,
        vaccine=vaccine
    )
    return redirect("/flights/" + code)