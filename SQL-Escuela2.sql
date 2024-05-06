create database Escuela2
use Escuela2
--Tabla carrera
create table carrera(
clave_c int,
nom_c varchar(50),
dcurc_c float,
constraint pk_cc primary key (clave_c)
)
insert into carrera values (1,'Derecho',3)
insert into carrera values (2,'Ing.Sistemas',4)
insert into carrera values (3,'Ingieneria de Sistemas',4)

select * from carrera 


--Tabla materia
create table materia(
clave_m int,
nom_m varchar (50),
cred_m int,
constraint pk_cm primary key (clave_m))
insert into materia values (1,'Matematicas',25)
insert into materia values (2,'Español',15)
insert into materia values (3,'Dibujo',15)
insert into materia values (4,'Programacion',20)
select *from materia 


-- Tabla profesor
create table profesor(
clave_p int,
nom_p varchar (50),
dir_p varchar (200),
tel_p bigint,
hor_p datetime,
constraint pk_cp primary key(clave_p))

insert into profesor values(1,'Laura Rosas','calle Azul',123456,'7:00')
insert into profesor values (2,'Roberto Diaz','calle Rosa',98765432,'9:00')
select * from profesor 
/*tabla aloumno
(con clave foranea)*/

create table alumno (
mat_alu int,
nom_alu varchar(50),
edad_alu int,
sem_alu int,
gen_alu varchar (20),
clave_c1 int,
constraint pk_calu primary key (mat_alu),
constraint fk_fc1 foreign key (clave_c1) references carrera (clave_c))

insert into alumno values (1,'Ana',18,6,'mujer',1)
insert into alumno values (2,'Serigio',19,7,'Hombre',2)
insert into alumno values (3,'Julieta',20,6,'Mujer',3)

--tabla alumno-profesor / relacion muchos a muchos
create table alu_pro(
mat_alu1 int,
clave_p1 int,
constraint fk_falu1 foreign key (mat_alu1) references alumno (mat_alu),
constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p))

insert into alu_pro values (1,2)
insert into alu_pro values (2,2)
insert into alu_pro values (3,2)
--tabla materia-alumno
create table alu_mat(
clave_m1 int,
mat_alu2 int,
constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno (mat_alu))

insert into alu_mat values (1,1)
insert into alu_mat values (4,2)
insert into alu_mat values (3,3)
insert into alu_mat values (4,1)


--tabla maateria-profesor
create table mat_pro(
clave_m2 int,
clave_p2 int,
constraint fk_fm2 foreign key (clave_m2) references materia (clave_m),
constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p))

insert into mat_pro values(2,2)

select nom_alu,edad_alu,sem_alu,nom_c,nom_p,nom_m
from alumno inner join carrera on alumno.clave_c1=carrera.clave_c
inner join alu_pro on alu_pro.mat_alu1=alumno.mat_alu
inner join profesor on profesor.clave_p=alu_pro.clave_p1
inner join alu_mat on alu_mat.mat_alu2=alumno.mat_alu
inner join materia on materia.clave_m= alu_mat.clave_m1
where edad_alu =18