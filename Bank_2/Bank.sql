create database Bank;

use Bank;

create table [User](
Id int identity primary key,
Фамилия varchar(20),
Имя varchar(20),
Отчество varchar(20),
Страна varchar(20),
Город varchar(20),
Дата_рождения date
);

create table Wallet(
Id int identity primary key,
Номер_карты int,
Сумма int
);

create table Photo_table(
Id int identity primary key,
Photo image
);

create table User_Login_Pass(
Id int identity primary key,
Логин varchar(20) unique,
Пароль varchar(20) unique,
NumCard int,
PhotoId int,
constraint Fk_User_Login_Pass_to_User foreign key(NumCard) references [User](Id),
constraint Fk_User_Login_Pass_to_MoneyUsers foreign key(NumCard) references Wallet(Id),
constraint Fk_User_Login_Pass_to_Photo_table foreign key(PhotoId) references Photo_table(Id)
);

create table AdminBank(
Id int identity primary key,
Name_Admin varchar(20),
Login_Admin varchar(20) unique,
Pass_Admin varchar(20) unique,
);


drop table [User];
drop table User_Login_Pass;
drop table Wallet;
drop table Photo_table;
drop table AdminBank;

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id /* соеденил 2 таблицы User и User_Login_Pass */

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id /* соеденил 3 таблицы User и User_Login_Pass  и Wallet*/
select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id join Photo_table on Wallet.Id=Photo_table.Id /*объеденил 4 таблицы в одну */

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id where [User].Город='Днепр'
select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id where [User].Id=2


insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Иванов','Иван','Иванович','Украина','Днепр','01-12-2020');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Петров','Петр','Петрович','Украина','Киев','07-07-2020');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Абдурахман','Хасан','ибн Хаттаб','Аравия','Пакистан','01-07-2010');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Смитт','Джон','Эдиссон','США','Бостон','07-07-2006');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Джейсон','Скот','Ли','Китай','Гон Конг','01-11-2001');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Томми','Ли','Джон','Гаваи','Бостон','07-07-2002');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Сэмюэль','Эль','Джекссон','Австралия','Сиетл','07-16-2000');
insert into [User](Фамилия,Имя,Отчество,Страна,Город,Дата_рождения) Values('Кетрин','Зетта','Джон','США','Лос Анджелес','08-23-2009');

insert into User_Login_Pass(Логин,Пароль) values('иван123','иван123');
insert into User_Login_Pass(Логин,Пароль) values('петя123','петя123');
insert into User_Login_Pass(Логин,Пароль) values('хасан123','хасан123');
insert into User_Login_Pass(Логин,Пароль) values('джон123','джон123');
insert into User_Login_Pass(Логин,Пароль) values('джейсон123','джейсон123');
insert into User_Login_Pass(Логин,Пароль) values('томми123','томми123');
insert into User_Login_Pass(Логин,Пароль) values('сэм123','сэм123');
insert into User_Login_Pass(Логин,Пароль) values('кети123','кети123')


insert into Wallet(Номер_карты,Сумма)values(121212123,3000)
insert into Wallet(Номер_карты,Сумма)values(212121321,4000)
insert into Wallet(Номер_карты,Сумма)values(123456789,6000)
insert into Wallet(Номер_карты,Сумма)values(987654321,8000)
insert into Wallet(Номер_карты,Сумма)values(132435457,9000)
insert into Wallet(Номер_карты,Сумма)values(551122334,12000)
insert into Wallet(Номер_карты,Сумма)values(778865490,14000)
insert into Wallet(Номер_карты,Сумма)values(65378999,17000)

insert into AdminBank(Name_Admin,Login_Admin,Pass_Admin)values('Вася','admin','admin');


select* from [User];
select*from User_Login_Pass;
select *from Wallet;
select*from Photo_table
select*from AdminBank;


BEGIN TRANSACTION
    UPDATE Wallet
        SET Сумма =Сумма+1000 where Номер_карты=121212123

    UPDATE Wallet
        SET Сумма = Сумма-1000
        WHERE Номер_карты=778865490

COMMIT 


