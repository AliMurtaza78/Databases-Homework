drop table if exists classes_attendence;
drop table if exists classes;
drop table if exists mentors;
drop table if exists students;

create table if not EXISTS mentors (
  id                      SERIAL PRIMARY KEY,
  name                      VARCHAR(30) NOT NULL,
  glassgow_living_period_years   smallint,
  address                   VARCHAR(120),
  fav_programming_language  VARCHAR (30)
  
);



create table if not exists students(
  id                        SERIAL PRIMARY KEY,
  name                      VARCHAR(30) NOT NULL,
  address                   VARCHAR(120),
  Graduated                 boolean not null
);

create table if not exists classes(
 id                        SERIAL PRIMARY KEY,
 leading_mentor            int references mentors(id) ,
 topic                     VARCHAR(20) not null,
 date                      VARCHAR(30) not null,
 location                  VARCHAR(30) not null
);

create table if not exists classes_attendence(
id                         SERIAL PRIMARY key,
student_id                 int references students(id),
class_id                   int references classes(id)
);


insert into mentors (name,glassgow_living_period_years,address,fav_programming_language) VALUES 
('John Smith','1','glassow Sauchiehall Street','Javascript' ),
('Nick','2','glassow Sauchiehall Street','Node.js' ),
('John Wick','5','glassow Sauchiehall Street','HTML/CSS' ),
('Sherlock holmes','10','glassow Sauchiehall Street','React' ),
('Enola Holmes','10','glassow Sauchiehall Street','React' )
;

insert into students (name,address,Graduated) VALUES 
('Bonnie ','glassow Sauchiehall Street',true ),
('Jackson','glassow Sauchiehall Street', false ),
('Luke Hudgeson','glassow Sauchiehall Street',false ),
('Jackie','glassow Sauchiehall Street',true ),
('Emma','glassow Sauchiehall Street', false ),
('Bon ','glassow Sauchiehall Street', true ),
('Jack','glassow Sauchiehall Street',false ),
('Laura Hudgeson','glassow Sauchiehall Street', true ),
('Fin','glassow Sauchiehall Street', true ),
('Emerson','glassow Sauchiehall Street',false )
;

insert  into classes (leading_mentor,topic,date,location) values 
(1,'SQL','2022/01/01','London'),
(2,'Javascript','2022/12/01','London'),
(3,'React','2022/11/10','London'),
(4,'HTML/CSS','2022/09/20','London'),
(5,'Node.js','2022/05/01','London')
;

insert into classes_attendence(student_id,class_id) values 
(1,1),
(3,2),
(2,3),
(3,2)
;

select * from mentors limit 10 ;

select * from mentors  where glassgow_living_period_years > 5 limit 10;

select * from students where Graduated = true;

select * from students;

select * from classes;

select s.name from  classes_attendence as ca 
join students as s
on ca.student_id = s.id 
where s.name like 'L%' limit 10;

--students who joined the class on the specific date_part
select s.name from students as s
join classes_attendence as ca 
on s.id = ca.student_id
join classes as c 
on c.id = ca.class_id
where c.date = '2022/11/10'
;

select m.name from mentors as m
where m.fav_programming_language = 'Javascript';

select s.name from students as s
where s.Graduated = true;


select * from classes as c
where c.date < '2022/06/01';

