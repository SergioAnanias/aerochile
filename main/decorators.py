from django.shortcuts import render, HttpResponse, redirect
def loginauth(func):
    def wrapper(request, **kwargs):
        if not 'user' in request.session or not request.session['user']:
            return redirect("/login")
        return func(request, **kwargs)
    return wrapper