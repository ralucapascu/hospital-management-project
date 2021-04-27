import django_filters

from .models import *

class AngajatFilter(django_filters.FilterSet):
    class Meta:
        model=Angajat
        fields=[]

class MedicFilter(django_filters.FilterSet):
    class Meta:
        model= Medic
        fields=['grad_profesional','id_sectie']