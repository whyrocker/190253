use infio_matsiase;
drop table if exists pracownik;
CREATE TABLE pracownik ( 
id_pracownika INT auto_increment primary key,
imie varchar(40) not null,
nazwisko varchar(60) not null,
data_urodzenia date not null
);
insert into pracownik (imie, nazwisko, data_urodzenia) values
("jan", "kowalski", "1995-05-12"),
("tomasz", "pyrzyk", "2006-03-26"),
("anna", "nowak", "1990-03-15");
SELECT * FROM pracownik;
update pracownik
set data_urodzenia = "1996-01-01"
where id_pracpownika = 1;
SELECT * FROM pracownik where id_pracownika = 1;




use infio_matsiase;
drop table if exists zadanie;
create table zadanie (
id_zadania INT auto_increment primary key,
nazwa_zadania varchar(150) not null,
priorytet enum ('wysoki', 'normalny', 'niski'),
opis text,
pracownik int,
constraint fk_zadanie_pracownik
 foreign key (pracownik)
 references pracownik(id_pracownika)
 on delete set null
 );
 alter table zadanie modify column priorytet enum ('wysoki', 'normalny', 'niski') default 'normalny';
 insert into zadanie (nazwa_zadania, priorytet, opis, pracownik) values
('naprawa', 'wysoki', 'optymalizacja zadan', 1),
('przygotowywanie raportu', 'normalny', 'raport missieczny', 2),
('testowanie', 'niski', 'testowanie modolu', 3);
SELECT * FROM zadanie;





use infio_matsiase;
drop table if exists projekt;
create table projekt (
id_projektu INT auto_increment primary key,
nazwa_projektu varchar(150) not null,
data_rozpoczecia date,
data_zakonczecia date);
alter table projekt 
add column menedzer_projektu  int ,
add constraint fk_projekt_menedzer
 foreign key (menedzer_projektu)
 references pracownik(id_pracownika)
 on delete set null;
 insert into projekt (nazwa_projektu, data_rozpoczecia, menedzer_projektu) values
 ('system', '2026-01-10', 1),
 ('aplikacja', '2026-02-01', 2);
 alter table zadanie 
add column projekt  int ,
add constraint fk_zadanie_projekt
 foreign key (projekt)
 references projekt(id_projektu)
 on delete set null;
 update zadanie set projekt = 1 where id_zadania in (1,2);
 update zadanie set projekt = 2 where id_zadania =3;
 
 
 
 
use infio_matsiase;
drop table if exists sprint;
create table sprint (
id_sprintu INT auto_increment primary key,
numer_sprintu int unsigned not null,
data_rozpoczecia date,
data_zakonczecia date);
 alter table zadanie 
add column sprint  int;
 alter table zadanie 
add constraint fk_zadanie_sprint
 foreign key (sprint)
 references sprint(id_sprintu)
 on delete set null;
 insert into sprint (numer_sprintu, data_rozpoczecia, data_zakonczecia)
 values (1, '2026-03-01', '2026-03-15');
  update zadanie set sprint = 1 where id_zadania in (1,2);
  select * from zadanie;
  
  
  
  
  use infio_matsiase;
drop table if exists status;
  create table status (
  id_statusu INT auto_increment primary key,
  nazwa_statusu varchar(50) not null);
  insert into status (nazwa_statusu) values
  ('nowe'), ('w toku'), ('zakonczone');
   alter table zadanie 
add column status  int;
 alter table zadanie 
add constraint fk_zadanie_status
 foreign key (status)
 references status(id_statusu)
 on delete set null;
   update zadanie set status = 1 where id_zadania = 1;
   update zadanie set status = 2 where id_zadania = 2;
  update zadanie set status = 3 where id_zadania = 3;
   select * from zadanie;

