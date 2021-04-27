from django.forms import ModelForm
from .models import *

class UpdateForm(ModelForm):
    class Meta:
        model=Post
        fields='__all__'

class UpdateAngajat(ModelForm):
    class Meta:
        model=Angajat
        fields='__all__'

class UpdateCabinet(ModelForm):
    class Meta:
        model=Cabinet
        fields='__all__'

class UpdateSectie(ModelForm):
    class Meta:
        model=Sectie
        fields='__all__'

class UpdateMedic(ModelForm):
    class Meta:
        model=Medic
        fields='__all__'

class UpdateMedicament(ModelForm):
    class Meta:
        model=Medicament
        fields='__all__'

class UpdateProceduraMedicala(ModelForm):
    class Meta:
        model=ProceduraMedicala
        fields='__all__'

class UpdatePacient(ModelForm):
    class Meta:
        model=Pacient
        fields='__all__'

class UpdateTratament(ModelForm):
    class Meta:
        model=Tratament
        fields='__all__'

class UpdateInternare(ModelForm):
    class Meta:
        model=Internare
        fields='__all__'

class UpdateListaMedicamente(ModelForm):
    class Meta:
        model=ListaMedicamente
        fields='__all__'

class UpdateConsultatie(ModelForm):
    class Meta:
        model=Consultatie
        fields='__all__'

class UpdateProceduriInternare(ModelForm):
    class Meta:
        model=ProceduriInternare
        fields='__all__'

class CreateForViewCompus(ModelForm):
    class Meta:
        model=view_compus
        fields=['id_angajat','id_post','nume','prenume','telefon','email','salariu','data_angajarii']
class UpdateForViewCompus(ModelForm):
    class Meta:
        model=view_compus
        fields=['prenume']