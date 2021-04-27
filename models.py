
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from dbview.models import DbView
from view_table.models import ViewTable
from django.db import connection


class Angajat(models.Model):
    id_angajat = models.CharField(primary_key=True, max_length=4)
    id_manager = models.ForeignKey('self', on_delete=models.SET_NULL, db_column='id_manager', blank=True, null=True)
    id_post = models.ForeignKey('Post', db_column='id_post', on_delete=models.CASCADE)
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)
    telefon = models.CharField(unique=True, max_length=10)
    email = models.CharField(unique=True, max_length=100)
    salariu = models.PositiveIntegerField()
    data_angajarii = models.DateField()
    def __str__(self):
        return self.id_angajat
    class Meta:
        managed = False
        db_table = 'angajat'



class Cabinet(models.Model):
    id_cabinet = models.CharField(primary_key=True, max_length=6)
    specializare_cabinet = models.CharField(unique=True, max_length=30)
    nr_cabinet = models.PositiveIntegerField(unique=True)
    etaj = models.PositiveIntegerField()
    def __str__(self):
        return self.specializare_cabinet

    class Meta:
        managed = False
        db_table = 'cabinet'


class Consultatie(models.Model):
    id_consultatie=models.AutoField(primary_key=True)
    cod_parafa = models.OneToOneField('Medic', on_delete=models.CASCADE, db_column='cod_parafa')
    cnp = models.ForeignKey('Pacient', on_delete=models.CASCADE, db_column='cnp')
    id_tratament = models.ForeignKey('Tratament', on_delete=models.CASCADE, db_column='id_tratament')

    class Meta:
        managed = False
        db_table = 'consultatie'
        unique_together = (('cod_parafa', 'cnp', 'id_tratament'), ('id_tratament', 'cod_parafa'), ('id_tratament', 'cnp'),)



class Internare(models.Model):
    id_internare = models.AutoField(primary_key=True)
    cnp = models.ForeignKey('Pacient', on_delete=models.CASCADE, db_column='cnp')
    data_internare = models.DateField()
    data_externare = models.DateField(blank=True, null=True)
    salon = models.PositiveIntegerField()
    etaj_salon = models.PositiveIntegerField()
    def __str__(self):
        return str(self.id_internare)
    class Meta:
        managed = False
        db_table = 'internare'


class ListaMedicamente(models.Model):
    id_lista = models.AutoField(primary_key=True)
    id_tratament = models.ForeignKey('Tratament', on_delete=models.CASCADE, db_column='id_tratament')
    id_medicament = models.OneToOneField('Medicament',on_delete=models.CASCADE, db_column='id_medicament')
    doza = models.FloatField()
    odata_la = models.PositiveIntegerField()
    data_incepere = models.DateField()
    data_intrerupere = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lista_medicamente'
        unique_together = (('id_medicament', 'id_tratament'),)


class Medic(models.Model):
    cod_parafa = models.CharField(primary_key=True, max_length=6)
    id_angajat = models.OneToOneField(Angajat, on_delete=models.CASCADE, db_column='id_angajat')
    id_sectie = models.ForeignKey('Sectie', on_delete=models.CASCADE, db_column='id_sectie')
    id_cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE, db_column='id_cabinet', blank=True, null=True)
    specializare = models.CharField(max_length=55)
    grad_profesional = models.CharField(max_length=10)
    def __str__(self):
        return self.cod_parafa
    class Meta:
        managed = False
        db_table = 'medic'


class Medicament(models.Model):
    id_medicament = models.AutoField(primary_key=True)
    nume_medicament = models.CharField(max_length=30)
    firma = models.CharField(max_length=30)
    unitate_masura = models.CharField(max_length=10)
    cantitate = models.FloatField()
    def __str__(self):
        return str(self.id_medicament)
    class Meta:
        managed = False
        db_table = 'medicament'


class Pacient(models.Model):
    cnp = models.CharField(primary_key=True, max_length=13)
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)
    telefon = models.CharField(max_length=10, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    data_nasterii = models.DateField()
    nr_asigurare = models.CharField(max_length=20, blank=True, null=True)
    parola_cont = models.CharField(max_length=6, blank=True, null=True)
    def __str__(self):
        return self.cnp
    class Meta:
        managed = False
        db_table = 'pacient'


class Post(models.Model):
    id_post = models.AutoField(primary_key=True)
    nume_post = models.CharField(unique=True, max_length=30)

    def __str__(self):
        return self.nume_post

    class Meta:
        managed = False
        db_table = 'post'

    


class ProceduraMedicala(models.Model):
    id_procedura = models.AutoField(primary_key=True)
    nume_procedura = models.CharField(unique=True, max_length=150)
    pret = models.PositiveIntegerField()
    def __str__(self):
        return self.nume_procedura
    class Meta:
        managed = False
        db_table = 'procedura_medicala'


class ProceduriInternare(models.Model):
    id_proc_int = models.AutoField(primary_key=True)
    cod_parafa = models.ForeignKey(Medic, on_delete=models.CASCADE, db_column='cod_parafa')
    id_procedura = models.ForeignKey(ProceduraMedicala, on_delete=models.CASCADE, db_column='id_procedura')
    id_internare = models.ForeignKey(Internare, on_delete=models.CASCADE, db_column='id_internare')
    data_incepere_procedura = models.DateTimeField()
    data_terminare_procedura = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'proceduri_internare'
        unique_together = (('cod_parafa', 'data_incepere_procedura'),)


class Sectie(models.Model):
    id_sectie = models.CharField(primary_key=True, max_length=6)
    nume_sectie = models.CharField(unique=True, max_length=30)
    nr_paturi = models.PositiveIntegerField()
    def __str__(self):
        return self.nume_sectie
    class Meta:
        managed = False
        db_table = 'sectie'


class Tratament(models.Model):
    id_tratament = models.AutoField(primary_key=True)
    data_prescriere = models.DateField()
    diagnostic = models.CharField(max_length=70)
    def __str__(self):
        return str(self.id_tratament)
    class Meta:
        managed = False
        db_table = 'tratament'

class view_compus(ViewTable):
    id_angajat = models.CharField(primary_key=True, max_length=4)
    id_post = models.PositiveIntegerField()
    nume_post = models.CharField(unique=True, max_length=30)
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)
    telefon = models.CharField(unique=True, max_length=10)
    email = models.CharField(unique=True, max_length=100)
    salariu = models.PositiveIntegerField()
    data_angajarii = models.DateField()
    @classmethod
    def get_query(cls):
        return 'select id_angajat,angajat.id_post,nume_post,nume,prenume,telefon,email,salariu,data_angajarii \
        from angajat \
        join post on post.id_post=angajat.id_post \
        where lower(nume_post) like "m%"'

class view_complex(ViewTable):
    id_post = models.PositiveIntegerField()
    salariu_maxim=models.PositiveIntegerField()
    @classmethod
    def get_query(cls):
        return 'select id_post,max(salariu) \
        from angajat \
        group by(id_post)'