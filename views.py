from django.shortcuts import render,redirect,get_object_or_404
from django.http import HttpResponse
from django.db import connection
from .models import *
from .form import *
from .filters import *

# Create your views here.

def home(request):
    return render(request,'app1/actualhomepage.html',)

def post(request):
    posturi=Post.objects.all()
    return render(request,'app1/post.html',{'posturi':posturi})

def updatepost(request,pk):
    job=get_object_or_404(Post, pk=pk)
    form=UpdateForm(instance=job) 
    if request.method=='POST' : 
        form=UpdateForm(request.POST,instance=job)
        if form.is_valid():
            form.save()
            return redirect('/post/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletepost(request,pk):
    job=get_object_or_404(Post, pk=pk)
    if request.method=="POST":
        job.delete()
        return redirect('/post/')

    context={'item':job}
    return render(request,'app1/delete_post.html',context)

def angajat(request):
    angajati=Angajat.objects.all()
    return render(request,'app1/angajat.html',{'angajati':angajati})

def updateangajat(request,pk):
    ang=get_object_or_404(Angajat, pk=pk)
    form=UpdateAngajat(instance=ang) 
    if request.method=='POST' : 
        form=UpdateAngajat(request.POST,instance=ang)
        if form.is_valid():
            form.save()
            return redirect('/angajat/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deleteangajat(request,pk):
    ang=get_object_or_404(Angajat, pk=pk)
    if request.method=="POST":
        ang.delete()
        return redirect('/angajat/')

    context={'item':ang}
    return render(request,'app1/delete_post.html',context)

def cabinet(request):
    cabinete=Cabinet.objects.all()
    return render(request,'app1/cabinet.html',{'cabinete':cabinete})

def updatecabinet(request,pk):
    cab=get_object_or_404(Cabinet, pk=pk)
    form=UpdateCabinet(instance=cab) 
    if request.method=='POST' : 
        form=UpdateCabinet(request.POST,instance=cab)
        if form.is_valid():
            form.save()
            return redirect('/cabinet/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletecabinet(request,pk):
    cab=get_object_or_404(Cabinet, pk=pk)
    if request.method=="POST":
        cab.delete()
        return redirect('/cabinet/')

    context={'item':cab}
    return render(request,'app1/delete_post.html',context)

def sectie(request):
    sectii=Sectie.objects.all()
    return render(request,'app1/sectie.html',{'sectii':sectii})

def updatesectie(request,pk):
    sec=get_object_or_404(Sectie, pk=pk)
    form=UpdateSectie(instance=sec) 
    if request.method=='POST' : 
        form=UpdateSectie(request.POST,instance=sec)
        if form.is_valid():
            form.save()
            return redirect('/sectie/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletesectie(request,pk):
    sec=get_object_or_404(Sectie, pk=pk)
    if request.method=="POST":
        sec.delete()
        return redirect('/sectie/')

    context={'item':sec}
    return render(request,'app1/delete_post.html',context)



def medic(request):
    medici=Medic.objects.all()
    return render(request,'app1/medic.html',{'medici':medici})

def updatemedic(request,pk):
    med=get_object_or_404(Medic, pk=pk)
    form=UpdateMedic(instance=med) 
    if request.method=='POST' : 
        form=UpdateMedic(request.POST,instance=med)
        if form.is_valid():
            form.save()
            return redirect('/medic/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletemedic(request,pk):
    med=get_object_or_404(Medic, pk=pk)
    if request.method=="POST":
        med.delete()
        return redirect('/medic/')

    context={'item':med}
    return render(request,'app1/delete_post.html',context)



def medicament(request):
    medicamente=Medicament.objects.all()
    return render(request,'app1/medicament.html',{'medicamente':medicamente})

def updatemedicament(request,pk):
    meds=get_object_or_404(Medicament, pk=pk)
    form=UpdateMedicament(instance=meds) 
    if request.method=='POST' : 
        form=UpdateMedicament(request.POST,instance=meds)
        if form.is_valid():
            form.save()
            return redirect('/medicament/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletemedicament(request,pk):
    meds=get_object_or_404(Medicament, pk=pk)
    if request.method=="POST":
        meds.delete()
        return redirect('/medicament/')

    context={'item':meds}
    return render(request,'app1/delete_post.html',context)


def proceduramedicala(request):
    proceduri=ProceduraMedicala.objects.all()
    return render(request,'app1/proceduramedicala.html',{'proceduri':proceduri})

def updateproceduramedicala(request,pk):
    proc=get_object_or_404(ProceduraMedicala, pk=pk)
    form=UpdateProceduraMedicala(instance=proc) 
    if request.method=='POST' : 
        form=UpdateProceduraMedicala(request.POST,instance=proc)
        if form.is_valid():
            form.save()
            return redirect('/proceduramedicala/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deleteproceduramedicala(request,pk):
    proc=get_object_or_404(ProceduraMedicala, pk=pk)
    if request.method=="POST":
        proc.delete()
        return redirect('/proceduramedicala/')

    context={'item':proc}
    return render(request,'app1/delete_post.html',context)

def pacient(request):
    pacienti=Pacient.objects.all()
    return render(request,'app1/pacient.html',{'pacienti':pacienti})

def updatepacient(request,pk):
    pac=get_object_or_404(Pacient, pk=pk)
    form=UpdatePacient(instance=pac) 
    if request.method=='POST' : 
        form=UpdatePacient(request.POST,instance=pac)
        if form.is_valid():
            form.save()
            return redirect('/pacient/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletepacient(request,pk):
    pac=get_object_or_404(Pacient, pk=pk)
    if request.method=="POST":
        pac.delete()
        return redirect('/pacient/')

    context={'item':pac}
    return render(request,'app1/delete_post.html',context)

def tratament(request):
    tratamente=Tratament.objects.all()
    return render(request,'app1/tratament.html',{'tratamente':tratamente})

def updatetratament(request,pk):
    trat=get_object_or_404(Tratament, pk=pk)
    form=UpdateTratament(instance=trat) 
    if request.method=='POST' : 
        form=UpdateTratament(request.POST,instance=trat)
        if form.is_valid():
            form.save()
            return redirect('/tratament/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletetratament(request,pk):
    trat=get_object_or_404(Tratament, pk=pk)
    if request.method=="POST":
        trat.delete()
        return redirect('/tratament/')

    context={'item':trat}
    return render(request,'app1/delete_post.html',context)


def internare(request):
    internari=Internare.objects.all()
    return render(request,'app1/internare.html',{'internari':internari})

def updateinternare(request,pk):
    inte=get_object_or_404(Internare, pk=pk)
    form=UpdateInternare(instance=inte) 
    if request.method=='POST' : 
        form=UpdateInternare(request.POST,instance=inte)
        if form.is_valid():
            form.save()
            return redirect('/internare/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deleteinternare(request,pk):
    inte=get_object_or_404(Internare, pk=pk)
    if request.method=="POST":
        inte.delete()
        return redirect('/internare/')

    context={'item':inte}
    return render(request,'app1/delete_post.html',context)

def listamedicamente(request):
    liste=ListaMedicamente.objects.all()
    return render(request,'app1/listamedicamente.html',{'liste':liste})

def updatelistamedicamente(request,pk):
    lis=get_object_or_404(ListaMedicamente, pk=pk)
    form=UpdateListaMedicamente(instance=lis) 
    if request.method=='POST' : 
        form=UpdateListaMedicamente(request.POST,instance=lis)
        if form.is_valid():
            form.save()
            return redirect('/listamedicamente/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deletelistamedicamente(request,pk):
    lis=get_object_or_404(ListaMedicamente,pk=pk)
    if request.method=="POST":
        lis.delete()
        return redirect('/listamedicamente/')

    context={'item':lis}
    return render(request,'app1/delete_post.html',context)

def consultatie(request):
    consultatii=Consultatie.objects.all()
    return render(request,'app1/consultatie.html',{'consultatii':consultatii})

def updateconsultatie(request,pk):
    cons=get_object_or_404(Consultatie, pk=pk)
    form=UpdateConsultatie(instance=cons) 
    if request.method=='POST' : 
        form=UpdateConsultatie(request.POST,instance=cons)
        if form.is_valid():
            form.save()
            return redirect('/consultatie/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deleteconsultatie(request,pk):
    cons=get_object_or_404(Consultatie,pk=pk)
    if request.method=="POST":
        cons.delete()
        return redirect('/consultatie/')

    context={'item':cons}
    return render(request,'app1/delete_post.html',context)

def proceduriinternare(request):
    proceduriint=ProceduriInternare.objects.all()
    return render(request,'app1/proceduriinternare.html',{'proceduriint':proceduriint})

def updateproceduriinternare(request,pk):
    procint=get_object_or_404(ProceduriInternare, pk=pk)
    form=UpdateProceduriInternare(instance=procint) 
    if request.method=='POST' : 
        form=UpdateProceduriInternare(request.POST,instance=procint)
        if form.is_valid():
            form.save()
            return redirect('/proceduriinternare/')

    context={'form':form}
    return render(request,'app1/update_post.html',context)

def deleteproceduriinternare(request,pk):
    procint=get_object_or_404(ProceduriInternare, pk=pk)
    if request.method=="POST":
        procint.delete()
        return redirect('/proceduriinternare/')

    context={'item':procint}
    return render(request,'app1/delete_post.html',context)

def testc(request):
    medici=Medic.objects.all()
    filter=MedicFilter(request.GET,queryset=medici)
    medici=filter.qs
    context={'filter':filter,'medici':medici}
    return render(request,'app1/sub_c.html',context)

def sub_c(request):
    cursor=connection.cursor()
    cursor.execute("select angajat.id_angajat,medic.cod_parafa,angajat.nume,angajat.prenume,angajat.telefon,angajat.email,angajat.data_angajarii,\
        sectie.nume_sectie,medic.specializare,medic.grad_profesional,proceduri_internare.id_internare,procedura_medicala.nume_procedura,proceduri_internare.data_incepere_procedura\
        from angajat \
        join medic on medic.id_angajat=angajat.id_angajat \
        join sectie on medic.id_sectie=sectie.id_sectie  \
        join proceduri_internare on medic.cod_parafa=proceduri_internare.cod_parafa  \
        join procedura_medicala on procedura_medicala.id_procedura=proceduri_internare.id_procedura  \
        where lower(medic.grad_profesional)='specialist' and \
            lower(medic.id_sectie)<>'amb' and angajat.data_angajarii>str_to_date('01-JAN-2016','%d-%b-%Y') ")
    results=cursor.fetchall()
    context={'results':results}
    return render(request,'app1/testc.html',context)

def sub_d(request):
    cursor=connection.cursor()
    cursor.execute("select medic.id_cabinet,max(angajat.salariu),min(angajat.salariu),round(avg(angajat.salariu),2) \
        from angajat \
        join medic on medic.id_angajat=angajat.id_angajat \
        group by medic.id_cabinet \
        having lower(medic.id_cabinet)<>'orl' ")
    results=cursor.fetchall()
    context={'results':results}
    return render(request,'app1/sub_d.html',context)

def sub_e(request):
    angajati=Angajat.objects.all()
    medici=Medic.objects.all()
    consultatii=Consultatie.objects.all()
    proceduriint=ProceduriInternare.objects.all()
    context={'angajati':angajati,'medici':medici,'consultatii':consultatii,'proceduriint':proceduriint}
    return render(request,'app1/sub_e.html',context)

def deleteangajatdc(request,pk):
    ang=get_object_or_404(Angajat, pk=pk)
    if request.method=="POST":
        ang.delete()
        return redirect('/sub_e/')
    context={'item':ang}
    return render(request,'app1/delete_post.html',context)

def deletemedicdc(request,pk):
    med=get_object_or_404(Medic, pk=pk)
    if request.method=="POST":
        med.delete()
        return redirect('/sub_e/')

    context={'item':med}
    return render(request,'app1/delete_post.html',context)

def sub_f(request):
    cursor=connection.cursor()
    cursor.execute("create or replace view view_compus as(select id_angajat,angajat.id_post,nume_post,nume,prenume,telefon,email,salariu,data_angajarii \
        from angajat \
        join post on post.id_post=angajat.id_post \
        where lower(nume_post) like 'm%')")
    cursor.execute("create or replace view view_complex as(select id_post,max(salariu) \
        from angajat \
        group by(id_post) )")
    cursor.execute("select * from view_compus;")
    results1=cursor.fetchall()
    cursor.execute("select * from view_complex;")
    results2=cursor.fetchall()
    context={'results1':results1,'results2':results2}
    return render(request,'app1/sub_f.html',context)

def createForViewCompus(request):
    cursor=connection.cursor()
    cursor.execute("insert into view_compus(id_angajat,id_post,nume,prenume,telefon,email,salariu,data_angajarii) \
        values('7111','2','Badulescu','Raluca','0772206654','ralucabadulescu@hotmail.com','4800',str_to_date('14-DEC-2020','%d-%b-%Y'))")
    cursor.execute("commit;")
    return redirect('/sub_f/')

def updateForViewCompus(request):
    cursor=connection.cursor()
    cursor.execute("update view_compus set salariu='2300' where id_angajat='7111'")
    cursor.execute("commit;")
    return redirect('/sub_f/')

def deleteForViewCompus(request):
    cursor=connection.cursor()
    cursor.execute("delete from angajat where id_angajat='7111'")
    cursor.execute("commit;")
    return redirect('/sub_f/')