create schema if not exists spital;
use spital;
drop trigger if exists `spital`.`medic_BEFORE_INSERT_AMB`;
drop trigger if exists `spital`.`medic_BEFORE_INSERT_ANG_MED`;
drop trigger if exists `spital`.`medic_BEFORE_DELETE_ANG`;
drop trigger if exists `spital`.`consultatie_BEFORE_INSERT_MED_AMB`;
drop trigger if exists `spital`.`proceduri_internare_BEFORE_INSERT_DATA_PROC`;
drop table if exists proceduri_internare;
drop table if exists consultatie;
drop table if exists lista_medicamente;
drop table if exists internare;
drop table if exists pacient;
drop table if exists procedura_medicala;
drop table if exists tratament;
drop table if exists medicament;
drop table if exists medic;
drop table if exists sectie;
drop table if exists cabinet;
drop table if exists angajat;
drop table if exists post;
drop database if exists GestActSpital;

create database GestActSpital;

create table post (
id_post int unsigned auto_increment,
nume_post varchar(30) not null,
constraint pk_post primary key(id_post),
constraint uq_nume_post unique (nume_post)
);

insert into post (nume_post) values('Manager medical');
insert into post (nume_post) values('Medic');
insert into post (nume_post) values('Asistent medical');
insert into post (nume_post) values('Brancardier');
insert into post (nume_post) values('Farmacist');
insert into post (nume_post) values('Statistician medical');
insert into post (nume_post) values('Sofer autosanitara');
insert into post (nume_post) values('Chimist');
insert into post (nume_post) values('Ingrijitoare');
insert into post (nume_post) values('Infirmiera');
commit;

create table angajat(
id_angajat varchar(4),
id_manager varchar(4),
id_post int unsigned not null,
nume varchar(20) not null,
prenume varchar(20) not null,
telefon varchar(10) not null,
email varchar(100) not null,
salariu int unsigned not null,
data_angajarii date not null,
constraint pk_angajat primary key(id_angajat),
constraint fk_manager foreign key(id_manager) references angajat(id_angajat) on delete set null,
constraint fk_post foreign key(id_post) references post(id_post) on delete cascade,
constraint uq_tel unique(telefon),
constraint uq_email unique(email),
constraint chk_length_id_ang check(length(id_angajat)=4),
constraint chk_digits_id_ang check(id_angajat regexp '^[0-9]+$'),
constraint chk_length_tel check(length(telefon)=10),
constraint chk_digits_tel check(telefon regexp '^[0-9]+$'),
constraint chk_format_tel check(telefon like '07%')
);

insert into angajat(id_angajat,id_post,telefon,nume,prenume,email,salariu,data_angajarii)
values('0000',1,'0784156937','Popescu','Dan','popescudan@gmail.com',12100,str_to_date('13-JAN-2009','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('0001',2,'0000','0760934557','Zimnicaru','Oana','zimnicaru_oana@gmail.com',5600,str_to_date('27-SEP-2005','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('0002',2,'0001','0723936592','Pascu','Raluca','ralucaioana2000@gmail.com',3700,str_to_date('12-NOV-2017','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('0003',2,'0000','0785668214','Badulescu','Robert','robertbadulescu@yahoo.com',3500,str_to_date('25-MAR-2019','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('0045',2,'0003','0773418663','Dociu','Mihnea','mihneadoc@gmail.com',3500,str_to_date('07-FEB-2019','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('0100',3,'0000','0784522196','Naparu','Ioana','naparuioana@hotmail.com',2700,str_to_date('05-AUG-2010','%d-%b-%Y'));
insert into angajat(id_angajat,id_post,id_manager,telefon,nume,prenume,email,salariu,data_angajarii)
values('1112',3,'0100','0774635008','Mihailescu','Alexandra','alexandramihailescu2000@gmail.com',2000,str_to_date('29-JUL-2019','%d-%b-%Y'));
insert into angajat
values('0004','0100',2,'Cicaldau','Tiberiu','0762631945','tiberiucicaldau@gmail.com',3780,str_to_date('21-JAN-2017','%d-%b-%Y'));
insert into angajat
values('0005','0100',2,'Grigore','Adina','0724837762','adinagrig@gmail.com',3600,str_to_date('09-MAY-2019','%d-%b-%Y'));
insert into angajat
values('0050','0000',2,'Codreanu','Mihai','0784631938','codreanumihai@hotmail.com',5000,str_to_date('13-JAN-2015','%d-%b-%Y'));
insert into angajat
values('0061','0050',2,'Joita','Andrei','0784592020','joitaandrei@gmail.com',3200,str_to_date('25-JUN-2017','%d-%b-%Y'));
insert into angajat
values('0062','0050',2,'Latlovevici','Catalina','0762201834','catalina_ltlvvc@gmail.com',3300,str_to_date('02-JAN-2017','%d-%b-%Y'));
insert into angajat
values('0084','0000',2,'Pelin','Alexandra','0772693458','alexandrapelin@gmail.com',5000,str_to_date('18-SEP-2018','%d-%b-%Y'));
insert into angajat
values('0098','0000',2,'Blagu','Cosmin','0772788492','blagucosmin@gmail.com',3200,str_to_date('27-APR-2019','%d-%b-%Y'));
insert into angajat
values('0215','0000',4,'Banateanu','Mihaela','0784641290','banateanumihaela@hotmail.com',2300,str_to_date('22-SEP-2015','%d-%b-%Y'));
insert into angajat
values('1234','0000',5,'Albu','Corina','0774636008','albu_corina@gmail.com',3400,str_to_date('23-JAN-2015','%d-%b-%Y'));
insert into angajat
values('3892','0000',6,'Dinu','Mihai','0784639977','dinumihai@hotmail.com',3800,str_to_date('30-NOV-2015','%d-%b-%Y'));
insert into angajat
values('5555','0000',7,'Frinaru','Diana','0765632308','dianafrinaru@hotmail.com',2800,str_to_date('20-JAN-2016','%d-%b-%Y'));
insert into angajat
values('3750','0000',8,'Mereu','Alexandra','0784442910','mereualexandra@gmail.com',3200,str_to_date('13-AUG-2018','%d-%b-%Y'));
insert into angajat
values('2690','0000',9,'Bolintineanu','Tudor','0785631209','tudorbolintineanu@hotmail.com',3200,str_to_date('04-FEB-2015','%d-%b-%Y'));
insert into angajat
values('0789','0000',10,'Popescu','Cristian','0762677103','cristipope@gmail.com',2900,str_to_date('28-JAN-2019','%d-%b-%Y'));
commit;

create table cabinet
(
id_cabinet varchar(6),
specializare_cabinet varchar(30) not null,
nr_cabinet int unsigned not null,
etaj int unsigned not null,
constraint pk_cabinet primary key(id_cabinet),
constraint uq_spec_cab unique(specializare_cabinet),
constraint uq_nr_cabinet unique(nr_cabinet),
constraint chk_length_id_cab check(length(id_cabinet)>=3 and length(id_cabinet)<=6),
constraint chk_nr_cabinet check(nr_cabinet>=1 and nr_cabinet <=99),
constraint chk_id_cab_upplit check (binary upper(id_cabinet)=binary id_cabinet)
);

insert into cabinet values('NEURO','Neurologie',10,3);
insert into cabinet values('CARDIO','Cardiologie',7,2);
insert into cabinet values('PED','Pediatrie',2,1);
insert into cabinet values('ORL','Otorinolaringologie',1,1);
insert into cabinet values('OFTA','Oftalmologie',11,3);
insert into cabinet values('ENDO','Endocrinologie',3,1);
insert into cabinet values('DERMA','Dermatologie',6,2);
insert into cabinet values('BLINF','Boli Infectioase',14,3);
insert into cabinet values('PSIHIA','Psihiatrie',5,1);
commit;

create table sectie
(
id_sectie varchar(6),
nume_sectie varchar(30) not null,
nr_paturi int unsigned not null default(0),
constraint pk_sectie primary key(id_sectie),
constraint uq_nume_sectie unique(nume_sectie),
constraint chk_length_id_sectie check(length(id_sectie)>=3 and length(id_sectie)<=6),
constraint chk_id_sec_upplit check (binary upper(id_sectie)=binary id_sectie)
);

insert into sectie(id_sectie,nume_sectie) values('AMB','Ambulatoriu');
insert into sectie values('URG','Urgente',20);
insert into sectie values('CHGEN1','Chirurgie Generala 1',20);
insert into sectie values('CHGEN2','Chirurgie Generala 2',121);
insert into sectie values('NEURO1','Neurologie 1',35);
insert into sectie values('NEURO2','Neurologie 2',60);
insert into sectie values('ORTO1','Ortopedie 1',22);
insert into sectie values('ORTO2','Ortopedie 2',24);
insert into sectie values('MEDIN1','Medicina Interna 1',120);
insert into sectie values('GINE','Obstretica-Ginecologie',45);
insert into sectie values('ATI','Anestezie si terapie intensiva',215);
commit;

create table medic
(
cod_parafa varchar(6),
id_angajat varchar(4) not null,
id_sectie varchar(6) not null,
id_cabinet varchar(6),
specializare varchar(55) not null,
grad_profesional varchar(10) not null,
constraint pk_medic primary key(cod_parafa),
constraint uq_id_angajat unique(id_angajat),
constraint chk_length_cod_prf check(length(cod_parafa)=6),
constraint fk_angajat foreign key(id_angajat) references angajat(id_angajat) on delete cascade,
constraint fk_sectie foreign key(id_sectie) references sectie(id_sectie) on delete cascade,
constraint fk_cabinet foreign key(id_cabinet) references cabinet(id_cabinet) on delete cascade
);

DELIMITER $$
use `spital`$$
create definer = current_user trigger `spital`.`medic_BEFORE_INSERT_AMB` before insert on `medic` for each row
if (new.id_sectie<>'AMB' and new.id_cabinet is not null) then
 set new.id_cabinet=NULL;
elseif(new.id_sectie='AMB'and new.id_cabinet is null) then
signal sqlstate '45000'
set message_text = 'Medicul face parte din sectia de ambulatoriu, deci precizati cabinetul in care lucreaza';
end if$$
DELIMITER ;

DELIMITER $$
use `spital`$$
create definer = current_user trigger `spital`.`medic_BEFORE_INSERT_ANG_MED` before insert on `medic` for each row
if (new.id_angajat not in(select ang.id_angajat from angajat ang join post using(id_post) where nume_post='Medic')) then
signal sqlstate '45000'
set message_text = 'Angajatul introdus nu este un medic!';
end if$$
DELIMITER ;

DELIMITER $$
use `spital`$$
create definer = current_user trigger `spital`.`medic_BEFORE_DELETE_ANG` before delete on `medic` for each row
begin
delete from angajat ang where ang.id_angajat=old.id_angajat;
end$$
DELIMITER ;

insert into medic values('101200','0001','AMB','CARDIO','Cardiologie','Specialist');
insert into medic values('230450','0002','AMB','CARDIO','Cardiologie','Rezident');
insert into medic values('667208','0084','AMB','DERMA','Dermatovenerologie','Specialist');
insert into medic values('264091','0098','AMB','OFTA','Oftalmologie','Specialist');
insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('201600','0003','NEURO1','Neurologie','Specialist');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('340200','0045','NEURO1','Neurologie','Primar');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('998356','0004','ORTO2','Ortopedie si traumatologie','Specialist');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('782399','0005','NEURO1','Neurologie','Primar');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('244628','0050','GINE','Obstetrica-ginecologie','Specialist');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('676388','0061','GINE','Obstetrica-ginecologie','Specialist');
 insert into medic(cod_parafa,id_angajat,id_sectie,specializare,grad_profesional)
 values('292874','0062','GINE','Obstetrica-ginecologie','Rezident');
 
commit;

create table medicament
(
id_medicament int unsigned auto_increment,
nume_medicament varchar(30) not null,
firma varchar(30) not null,
unitate_masura varchar(10) not null,
cantitate float not null,
constraint pk_medicament primary key(id_medicament)
);

insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Linex Complex','Sandoz','comprimate',14);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Urinal','Walmark','comprimate',20);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Magnerot','Worwag Pharma','comprimate',50);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Sindolor gel','Fiterman','g',100);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Aspacardin','Terapia','comprimate',30);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Otocalm','Pharco Impex','ml',10);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Tears Naturale','Alcon','ml',15);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Lacryvisc','Alcon','g',10);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Aciclovir','Egis','g',2);
insert into medicament(nume_medicament,firma,unitate_masura,cantitate)
values('Baneocin','Sandoz','g',20);
commit;

create table tratament
(
id_tratament int unsigned auto_increment,
data_prescriere date not null,
diagnostic varchar(70) not null,
constraint pk_tratament primary key(id_tratament)
);

insert into tratament(data_prescriere,diagnostic)
values (str_to_date('27-SEP-2020','%d-%b-%Y'),'Infectie urinara');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('28-SEP-2020','%d-%b-%Y'),'Cistita');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('30-NOV-2020','%d-%b-%Y'),'Incontinenta urinara');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('03-DEC-2020','%d-%b-%Y'),'Pericardita acuta');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('04-DEC-2020','%d-%b-%Y'),'Tahicardie');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('04-DEC-2020','%d-%b-%Y'),'Cardiomiopatie');
insert into tratament(id_tratament,data_prescriere,diagnostic)
values (7,str_to_date('08-DEC-2020','%d-%b-%Y'),'Seboree');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('08-DEC-2020','%d-%b-%Y'),'Dermatita');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('10-DEC-2020','%d-%b-%Y'),'Trahom');
insert into tratament(data_prescriere,diagnostic)
values (str_to_date('12-DEC-2020','%d-%b-%Y'),'Midriaza');
commit;

create table procedura_medicala
(
id_procedura int unsigned auto_increment,
nume_procedura varchar(150) not null,
pret int unsigned not null,
constraint pk_procedura primary key(id_procedura),
constraint uq_nume_proc unique(nume_procedura)
);

insert into procedura_medicala(nume_procedura,pret) 
values('Ablatia unei tumori de etaj anterior al bazei craniului cu indepartarea extensiilor sinusului paranazal si a fosei orbitare',100000);
insert into procedura_medicala(nume_procedura,pret) 
values('Neurotomia deschisa de nerv periferic profund',15000);
insert into procedura_medicala(nume_procedura,pret) 
values('Decompresia endoscopica a tunelului carpian',9000);
insert into procedura_medicala(nume_procedura,pret) 
values('Bypass extra-intracranian cu grefa de artera temporala superficiala',7000);
insert into procedura_medicala(nume_procedura,pret) 
values('Indepartarea electrodului intracranian prin craniotomie',23500);
insert into procedura_medicala(nume_procedura,pret) 
values('Aspiratia chistului ovarian',2000);
insert into procedura_medicala(nume_procedura,pret) 
values('Salpingoliza',3500);
insert into procedura_medicala(nume_procedura,pret) 
values('Amputatia deasupra genunchiului',5000);
insert into procedura_medicala(nume_procedura,pret) 
values('Hemipelvectomia',6000);
insert into procedura_medicala(nume_procedura,pret) 
values('Capsulectomia articulatiei interfalangiene a maini',5900);
commit;

create table pacient
(
cnp varchar(13),
nume varchar(20) not null,
prenume varchar(20) not null,
telefon varchar(10) ,
email varchar(100),
data_nasterii date not null,
nr_asigurare varchar(20),
parola_cont varchar(6),
constraint pk_pacient primary key(cnp),
constraint chk_length_cnp check(length(cnp)=13),
constraint chk_digits_cnp check(cnp regexp '^[0-9]+$'),
constraint chk_length_tel_pac check(length(telefon)=10),
constraint chk_digits_tel_pac check(telefon regexp '^[0-9]+$'),
constraint chk_format_tel_pac check(telefon like '07%'),
constraint chk_length_asig check(length(nr_asigurare)=20),
constraint chk_digits_asig check(nr_asigurare regexp '^[0-9]+$'),
constraint chk_data_nasterii check(data_nasterii<sysdate())
);

insert into pacient(cnp,nume,prenume,telefon,data_nasterii,parola_cont)
values('5001217297265','Tanase','Alexandru','0763883576',str_to_date('17-DEC-1974','%d-%b-%Y'),'857320');
insert into pacient(cnp,nume,prenume,telefon,data_nasterii,parola_cont)
values('6000215690138','Cristea','Adriana','0778529021',str_to_date('15-FEB-1988','%d-%b-%Y'),'294600');
insert into pacient(cnp,nume,prenume,telefon,email,data_nasterii,parola_cont)
values('5000529381419','Ionescu','Mario','0769234092','ionescumario@gmail.com',
str_to_date('29-MAY-2001','%d-%b-%Y'),'374500');
insert into pacient
values('6001109453712','Macovei','Liliana','0784521863','macolili@yahoo.com',
str_to_date('09-NOV-1974','%d-%b-%Y'),'83649375192847586741','201345');
insert into pacient(cnp,nume,prenume,nr_asigurare,data_nasterii)
values('6000418723971','Grigore','Alina','94651840275825301749',str_to_date('18-APR-1979','%d-%b-%Y'));
update pacient set parola_cont='109487' where cnp='6000418723971';

insert into pacient
values('5002909453242','Comanescu','Bogdan','0768521896','bogdibog@yahoo.com',
str_to_date('09-NOV-1988','%d-%b-%Y'),'90649375192847586531','474029');
insert into pacient(cnp,nume,prenume,telefon,data_nasterii)
values('6000418799204','Dinu','Maria','0778529027',str_to_date('25-DEC-1964','%d-%b-%Y'));
insert into pacient(cnp,nume,prenume,telefon,data_nasterii)
values('5000747239714','Hanu','Dorel','0778523749',str_to_date('07-MAY-1962','%d-%b-%Y'));
insert into pacient(cnp,nume,prenume,telefon,nr_asigurare,data_nasterii)
values('5000747239447','Tarara','David','0762523206','58651840275825301229',str_to_date('12-FEB-1973','%d-%b-%Y'));

insert into pacient(cnp,nume,prenume,telefon,email,data_nasterii,parola_cont)
values('5000529381273','Doroftei','Bogdan','0769234211','doroftei_bogdan@yahoo.com',
str_to_date('01-MAY-1997','%d-%b-%Y'),'384650');
insert into pacient(cnp,nume,prenume,telefon,email,data_nasterii,parola_cont)
values('6000529381419','Paun','Maria','0784564871','marymari2001@gmail.com',
str_to_date('18-APR-2001','%d-%b-%Y'),'856452');
insert into pacient(cnp,nume,prenume,telefon,email,data_nasterii,parola_cont)
values('5000529388000','Lastar','Codrin','0769234754','codrinescul@gmail.com',
str_to_date('29-APR-2000','%d-%b-%Y'),'272395');
commit;

create table internare
(
id_internare int unsigned auto_increment,
cnp varchar(13) not null,
data_internare date not null,
data_externare date,
salon int unsigned not null,
etaj_salon int unsigned not null,
constraint pk_id_int primary key(id_internare),
constraint fk_cnp foreign key(cnp) references pacient(cnp) on delete cascade,
constraint chk_val_date check (data_internare<ifnull(data_externare,data_internare+1)),
constraint chk_val_salon check (salon>=1 and salon<=99)
);

insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('6000418723971',str_to_date('19-DEC-2020','%d-%b-%Y'),str_to_date('25-DEC-2020','%d-%b-%Y'),19,3);
insert into internare(cnp,data_internare,salon,etaj_salon)
values('6000215690138',str_to_date('24-DEC-2020','%d-%b-%Y'),4,1);
insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('5001217297265',str_to_date('10-DEC-2020','%d-%b-%Y'),str_to_date('17-DEC-2020','%d-%b-%Y'),12,3);
insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('5000747239447',str_to_date('11-DEC-2020','%d-%b-%Y'),str_to_date('17-DEC-2020','%d-%b-%Y'),12,3);
insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('5000747239714',str_to_date('10-DEC-2020','%d-%b-%Y'),str_to_date('17-DEC-2020','%d-%b-%Y'),9,3);
insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('6000418799204',str_to_date('10-DEC-2020','%d-%b-%Y'),str_to_date('21-DEC-2020','%d-%b-%Y'),1,1);
insert into internare(cnp,data_internare,data_externare,salon,etaj_salon)
values('5002909453242',str_to_date('13-DEC-2020','%d-%b-%Y'),str_to_date('20-DEC-2020','%d-%b-%Y'),3,1);
commit;

create table lista_medicamente
(
id_lista int unsigned auto_increment,
id_tratament int unsigned not null ,
id_medicament int unsigned not null,
doza float not null,
odata_la int unsigned not null,
data_incepere date not null,
data_intrerupere date,
constraint pk_lis_med primary key(id_lista),
constraint fk_id_med foreign key(id_medicament) references medicament(id_medicament) on delete cascade,
constraint fk_id_trat foreign key(id_tratament) references tratament(id_tratament) on delete cascade,
constraint chk_val_med_date check (data_incepere<ifnull(data_intrerupere,data_incepere+1))
);

insert into lista_medicamente
values(1,6,5,1,8,str_to_date('05-DEC-2020','%d-%b-%Y'),str_to_date('23-DEC-2020','%d-%b-%Y'));
insert into lista_medicamente
values(2,4,3,1,12,str_to_date('04-DEC-2020','%d-%b-%Y'),str_to_date('09-DEC-2020','%d-%b-%Y'));
insert into lista_medicamente
values(3,4,5,2,24,str_to_date('04-DEC-2020','%d-%b-%Y'),str_to_date('20-DEC-2020','%d-%b-%Y'));
insert into lista_medicamente
values(4,5,3,1,6,str_to_date('05-DEC-2020','%d-%b-%Y'),str_to_date('12-DEC-2020','%d-%b-%Y'));
insert into lista_medicamente
values(5,5,5,2,24,str_to_date('12-DEC-2020','%d-%b-%Y'),str_to_date('25-DEC-2020','%d-%b-%Y'));

insert into lista_medicamente
values(6,10,10,0.5,24,str_to_date('14-DEC-2020','%d-%b-%Y'),str_to_date('23-JAN-2021','%d-%b-%Y'));
insert into lista_medicamente
values(7,10,9,0.1,12,str_to_date('14-DEC-2020','%d-%b-%Y'),str_to_date('23-JAN-2021','%d-%b-%Y'));

insert into lista_medicamente
values(8,9,10,1,12,str_to_date('11-DEC-2020','%d-%b-%Y'),str_to_date('11-FEB-2021','%d-%b-%Y'));
insert into lista_medicamente

values(9,8,7,1,8,str_to_date('09-DEC-2020','%d-%b-%Y'),str_to_date('09-JAN-2021','%d-%b-%Y'));
insert into lista_medicamente
values(10,8,8,0.5,24,str_to_date('09-DEC-2020','%d-%b-%Y'),str_to_date('09-JAN-2021','%d-%b-%Y'));
insert into lista_medicamente
values(11,7,7,1,12,str_to_date('09-DEC-2020','%d-%b-%Y'),str_to_date('10-JAN-2021','%d-%b-%Y'));
insert into lista_medicamente
values(12,7,6,1,24,str_to_date('16-DEC-2020','%d-%b-%Y'),str_to_date('20-JAN-2021','%d-%b-%Y'));
commit;

create table consultatie
(
id_consultatie int unsigned auto_increment,
cod_parafa varchar(6) not null,
cnp varchar(13) not null,
id_tratament int unsigned,
constraint pk_consult primary key (id_consultatie),
constraint uq_trat_fk unique(id_tratament,cnp,cod_parafa),
constraint uq_trat_pac unique(id_tratament,cnp),
constraint uq_trat_med unique(id_tratament,cod_parafa),
constraint fk_cod_parafa_cons foreign key(cod_parafa) references medic(cod_parafa) on delete cascade,
constraint fk_cnp_cons foreign key(cnp) references pacient(cnp) on delete cascade,
constraint fk_id_trat_cons foreign key(id_tratament) references tratament(id_tratament) on delete cascade
);

DELIMITER $$
use `spital`$$
create definer = current_user trigger `spital`.`consultatie_BEFORE_INSERT_MED_AMB` before insert on `consultatie` for each row
if (new.cod_parafa not in(select cod_parafa from medic where id_sectie='AMB')) then
signal sqlstate '45000'
set message_text = 'Doar medicii din ambulatoriu pot da consultatii!';
end if$$
$$
DELIMITER ;

insert into consultatie values(1,'101200','5000529381419',5);
insert into consultatie values(2,'101200','5000529381419',6);
insert into consultatie values(3,'230450','6001109453712',4);
insert into consultatie values(4,'667208','5000529381273',7);
insert into consultatie values(5,'667208','6000529381419',8);
insert into consultatie values(6,'264091','5000529388000',9);
insert into consultatie values(7,'264091','6001109453712',10);
commit;

create table proceduri_internare
(
id_proc_int int unsigned auto_increment,
cod_parafa varchar(6) not null,
id_procedura int unsigned not null,
id_internare int unsigned not null,
data_incepere_procedura datetime not null,
data_terminare_procedura datetime not null,
constraint pk_proc_int primary key(id_proc_int),
constraint uq_med_data unique(cod_parafa,data_incepere_procedura),
constraint fk_codprf_int foreign key(cod_parafa) references medic(cod_parafa) on delete cascade,
constraint fk_proc_int foreign key(id_procedura) references procedura_medicala(id_procedura) on delete cascade,
constraint fk_int foreign key(id_internare) references internare(id_internare) on delete cascade,
constraint chk_val_date_int check(data_incepere_procedura<data_terminare_procedura)
);

DELIMITER $$
use `spital`$$
create definer = current_user trigger `spital`.`proceduri_internare_BEFORE_INSERT_DATA_PROC` before insert on `proceduri_internare` 
for each row
begin
if(new.data_incepere_procedura<(select intern.data_internare from internare intern where intern.id_internare=new.id_internare)
or (select ifnull(intern.data_externare,sysdate()) from internare intern where intern.id_internare=new.id_internare)<
new.data_terminare_procedura) then
signal sqlstate '45000'
set message_text = 'Datele pentru procedura nu sunt valide pentru internarea introdusa!';
end if;
end$$
DELIMITER ;

insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('340200',3,1,str_to_date('20-DEC-2020 8:30','%d-%b-%Y %H:%i'),str_to_date('20-DEC-2020 19:17','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('201600',3,1,str_to_date('20-DEC-2020 8:30','%d-%b-%Y %H:%i'),str_to_date('20-DEC-2020 19:17','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('340200',5,1,str_to_date('22-DEC-2020 12:47','%d-%b-%Y %H:%i'),str_to_date('22-DEC-2020 17:05','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('201600',5,1,str_to_date('22-DEC-2020 12:47','%d-%b-%Y %H:%i'),str_to_date('22-DEC-2020 17:05','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('340200',4,2,str_to_date('26-DEC-2020 10:29','%d-%b-%Y %H:%i'),str_to_date('26-DEC-2020 16:33','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('340200',4,2,str_to_date('27-DEC-2020 8:21','%d-%b-%Y %H:%i'),str_to_date('27-DEC-2020 14:55','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('998356',10,7,str_to_date('15-DEC-2020 8:19','%d-%b-%Y %H:%i'),str_to_date('15-DEC-2020 13:29','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('998356',10,5,str_to_date('11-DEC-2020 07:50','%d-%b-%Y %H:%i'),str_to_date('11-DEC-2020 09:20','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('244628',6,6,str_to_date('11-DEC-2020 12:39','%d-%b-%Y %H:%i'),str_to_date('11-DEC-2020 20:18','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('676388',6,6,str_to_date('11-DEC-2020 12:39','%d-%b-%Y %H:%i'),str_to_date('11-DEC-2020 20:18','%d-%b-%Y %H:%i'));
insert into proceduri_internare(cod_parafa,id_procedura,id_internare,data_incepere_procedura,data_terminare_procedura)
values('292874',6,6,str_to_date('11-DEC-2020 12:39','%d-%b-%Y %H:%i'),str_to_date('11-DEC-2020 20:18','%d-%b-%Y %H:%i'));

commit;


