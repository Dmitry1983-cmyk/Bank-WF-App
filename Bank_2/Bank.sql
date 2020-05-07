create database Bank;

use Bank;

create table [User](
Id int identity primary key,
������� varchar(20),
��� varchar(20),
�������� varchar(20),
������ varchar(20),
����� varchar(20),
����_�������� date
);

create table Wallet(
Id int identity primary key,
�����_����� int,
����� int
);

create table Photo_table(
Id int identity primary key,
Photo image
);

create table User_Login_Pass(
Id int identity primary key,
����� varchar(20) unique,
������ varchar(20) unique,
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

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id /* �������� 2 ������� User � User_Login_Pass */

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id /* �������� 3 ������� User � User_Login_Pass  � Wallet*/
select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id join Photo_table on Wallet.Id=Photo_table.Id /*��������� 4 ������� � ���� */

select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id where [User].�����='�����'
select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id where [User].Id=2


insert into [User](�������,���,��������,������,�����,����_��������) Values('������','����','��������','�������','�����','01-12-2020');
insert into [User](�������,���,��������,������,�����,����_��������) Values('������','����','��������','�������','����','07-07-2020');
insert into [User](�������,���,��������,������,�����,����_��������) Values('����������','�����','��� ������','������','��������','01-07-2010');
insert into [User](�������,���,��������,������,�����,����_��������) Values('�����','����','�������','���','������','07-07-2006');
insert into [User](�������,���,��������,������,�����,����_��������) Values('�������','����','��','�����','��� ����','01-11-2001');
insert into [User](�������,���,��������,������,�����,����_��������) Values('�����','��','����','�����','������','07-07-2002');
insert into [User](�������,���,��������,������,�����,����_��������) Values('�������','���','��������','���������','�����','07-16-2000');
insert into [User](�������,���,��������,������,�����,����_��������) Values('������','�����','����','���','��� ��������','08-23-2009');

insert into User_Login_Pass(�����,������) values('����123','����123');
insert into User_Login_Pass(�����,������) values('����123','����123');
insert into User_Login_Pass(�����,������) values('�����123','�����123');
insert into User_Login_Pass(�����,������) values('����123','����123');
insert into User_Login_Pass(�����,������) values('�������123','�������123');
insert into User_Login_Pass(�����,������) values('�����123','�����123');
insert into User_Login_Pass(�����,������) values('���123','���123');
insert into User_Login_Pass(�����,������) values('����123','����123')


insert into Wallet(�����_�����,�����)values(121212123,3000)
insert into Wallet(�����_�����,�����)values(212121321,4000)
insert into Wallet(�����_�����,�����)values(123456789,6000)
insert into Wallet(�����_�����,�����)values(987654321,8000)
insert into Wallet(�����_�����,�����)values(132435457,9000)
insert into Wallet(�����_�����,�����)values(551122334,12000)
insert into Wallet(�����_�����,�����)values(778865490,14000)
insert into Wallet(�����_�����,�����)values(65378999,17000)

insert into AdminBank(Name_Admin,Login_Admin,Pass_Admin)values('����','admin','admin');


select* from [User];
select*from User_Login_Pass;
select *from Wallet;
select*from Photo_table
select*from AdminBank;


BEGIN TRANSACTION
    UPDATE Wallet
        SET ����� =�����+1000 where �����_�����=121212123

    UPDATE Wallet
        SET ����� = �����-1000
        WHERE �����_�����=778865490

COMMIT 


