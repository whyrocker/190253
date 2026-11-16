alter table zadanie add column godziny_szacowane INT DEFAULT 8;
select*from zadanie;
update zadanie set godziny_szacowane = 4  where id_zadania = 1;
update zadanie set godziny_szacowane = 12  where id_zadania = 2;
update zadanie set godziny_szacowane = 16  where id_zadania = 3;
alter table zadanie alter column godziny_szacowane set default 6;
select*from zadanie;

alter table projekt add column opis_kratki varchar(50) null;
alter table projekt modify column opis_kartki varchar(200);
select*from projekt; 
update projekt set opis_kratki = 'mvp' where id_projektu = 1;
update projekt set opis_kratki = 'pilne wdrozenie' where id_projektu = 2;
alter table projekt  drop column opis_kratki;


alter table zadanie drop foreign key id_zadania;
alter table zadanie add constraint fk_zadanie_projekt
foreign key (projekt) references projekt (id_projektu);
delete from projekt where id_projektu = 1;
select*from zadanie where projekt is null;