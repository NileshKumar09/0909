use Training_19Sep19_Pune
go

create table [46008173].Car(
Id INT NOT NULL IDENTITY(1,1),
Model varchar(50) unique,
ManufacturerId int,
TypeId int,
Engine varchar(50),
BHP int,
TransmissionId int,
Mileage int not null,
Seat int not null,
AirBagDetails varchar(20) not null,
BootSpace varchar(20) not null,
Price varchar(20) not null);

create table [46008173].Manufacturer
(Id int primary key Identity(1,1),
Name varchar(50) unique,
ContactPerson varchar(50) unique,
RegisteredOffice varchar(50) not null);

create table [46008173].CarType
(Id int primary key identity(1,1),
Type varchar(20) unique);

 create table [46008173].CarTransmissionType
(
Id int primary key identity(1,1),
Name varchar(20) unique);

create proc [46008173].InsertCar
 @Id int,
 @Model varchar(50),
  @ManufacturerId VARCHAR(10),
  @TypeId int,
  @Engine varchar(50),
  @BHP int,
  @TransmissionId int,
  @Mileage int,
  @Seat int,
  @AirBag varchar(20),
  @BootSpace varchar(20),
  @Price varchar(20)

AS
BEGIN
		INSERT INTO [46008173].Car
		(Model ,ManufacturerId ,TypeId ,Engine ,BHP ,TransmissionId ,Mileage ,Seat ,AirBagDetails ,BootSpace ,Price )
		VALUES
		(@Model , @ManufacturerId, @TypeId ,@Engine ,@BHP ,@TransmissionId ,@Mileage ,@Seat ,@AirBag ,@BootSpace , @Price )
		SET @Id= SCOPE_IDENTITY()
	END
	
go

create proc [46008173].GetManufacturer
as
begin 
select * from [46008173].Manufacturer
end
go

create proc [46008173].GetCarType
as
begin 
select * from [46008173].CarType
end
go

create proc [46008173].GetTransmission
as
begin 
select * from [46008173].CarTransmissionType
end
go

create proc [46008173].GetAllCars
as begin
select * from [46008173].[Car]
end
go


create proc [46008173].DeleteCar
@Id int
AS
BEGIN
	delete [46008173].[Car] where Id = @Id
END

GO
create proc [46008173].UpdateCar
 @Id int,
 @Model varchar(50),
  @ManufacturerId VARCHAR(10),
  @TypeId int,
  @Engine varchar(50),
  @BHP int,
  @TransmissionId int,
  @Mileage int,
  @Seat int,
  @AirBag varchar(20),
  @BootSpace varchar(20),
  @Price varchar(20)
AS
BEGIN
	update [46008173].[Car] set Model = @Model,ManufacturerId = @ManufacturerId, TypeId = @TypeId,
	Engine = @Engine,BHP = @BHP,TransmissionId = @TransmissionId,Mileage = @Mileage,
	Seat = @Seat,AirBagDetails =@AirBag , BootSpace = @BootSpace,Price = @Price
	 where Id = @Id
END

GO
create proc [46008173].SearchCar
 @Id int,
 @Model varchar(50) output,
  @ManufacturerId VARCHAR(10) output,
  @TypeId int output,
  @Engine varchar(50) output,
  @BHP int output,
  @TransmissionId int output,
  @Mileage int output,
  @Seat int output,
  @AirBag varchar(20) output,
  @BootSpace varchar(20) output,
  @Price varchar(20) output
AS
BEGIN
	select   @Model = Model ,@ManufacturerId = ManufacturerId ,  @TypeId = TypeId ,
	 @Engine = Engine , @BHP =BHP ,  @TransmissionId = TransmissionId,  @Mileage =Mileage,
	@Seat = Seat , @AirBag = AirBagDetails,  @BootSpace = BootSpace,  @Price = Price
	from [46008173].Car where Id = @Id
END
GO


ALTER procedure [46008173].[UpdateEmployee]
  @Id int,
@Name varchar(50) ,
@Designation int ,
@Department int
as
begin
 update [46008173].[Employee] set Name = @Name ,Designation = @Designation, Department = @Department 
 where Id = @Id

 end
