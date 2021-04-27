from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(Angajat)
admin.site.register(Post)
admin.site.register(Cabinet)
admin.site.register(Sectie)
admin.site.register(Medic)
admin.site.register(Medicament)
admin.site.register(Tratament)
admin.site.register(ProceduraMedicala)
admin.site.register(Pacient)
admin.site.register(Internare)
admin.site.register(ListaMedicamente)
admin.site.register(Consultatie)
admin.site.register(ProceduriInternare)