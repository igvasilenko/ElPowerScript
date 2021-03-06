
USE [ElectricPowerV01]
GO
--использование счетчиков - классификация КП
IF OBJECT_ID('CounterPurposePos', 'U') IS NOT NULL
   DROP TABLE CounterPurposePos;
   
CREATE TABLE CounterPurposePos
(
   CounterPurposeId int identity PRIMARY KEY,
   CounterId int not null foreign key REFERENCES dbo.Counter(CounterId), 
   PurposePosId int not null foreign key REFERENCES dbo.PurposePos(PurposePosId), 
   UsedPercent NUMERIC(12,3) not null default 0,
   UsedKvat int not null default 0
)


IF OBJECT_ID('BillingPeriod', 'U') IS NOT NULL
   DROP TABLE BillingPeriod;

CREATE TABLE BillingPeriod
(
   BillingPeriodId int identity PRIMARY KEY,
   DateCreate datetime not null default GetDate(),
   PeriodMonth int not null,
   PeriodYear int not null
)

IF OBJECT_ID('BillingLoadsGreo', 'U') IS NOT NULL
   DROP TABLE BillingLoadsGreo;
   
CREATE TABLE BillingLoadsGreo
(
   BillingLoadsGreoId int identity PRIMARY KEY,
   BillingPeriodId int not null foreign key REFERENCES dbo.BillingPeriod(BillingPeriodId), 
   CounterId int not null foreign key REFERENCES dbo.Counter(CounterId), 
   PreviousValue int not null default 0,
   CurrentValue int not null default 0,
   UsedKvat int not null default 0
)