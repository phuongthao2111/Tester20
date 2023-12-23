create database Assignment2;
use Assignment2;

create table Department(
DepartmentID int primary key auto_increment,
DepartmentName nvarchar(50)
);

create table Pos(
PossionID int primary key auto_increment,
PossionName enum('Dev','Test','Scrum Master','PM')
);

create table Acc(
AccountID int primary key auto_increment,
Email nvarchar(50),
Username nvarchar(50),
FullName nvarchar(50),
DepartmentID int,
 foreign key(DepartmentID) references Department(DepartmentID),
 PossionID int,
 foreign key(PossionID) references Pos(PossionID),
CreateDate date
);

create table GR(
GroupID int  primary key auto_increment,
GroupName nvarchar(50),
CreatorID varchar(50),
CreateDate date 
);

create table GroupAccount(
GroupID int,
foreign key(GroupID) references GR(GroupID),
AccountID int,
foreign key(AccountID) references Acc(AccountID)
);

create table TypeQuestion(
TypeID int primary key auto_increment,
TypeName enum('Essay','Multiple-Choice')
);

create table CatagoryQuestion(
CategoryID int primary key auto_increment,
CategoryName nvarchar(50)
);

create table Question(
QuestionID int primary key auto_increment,
Content nvarchar(100),
CategoryID int,
foreign key(CategoryID) references CatagoryQuestion(CategoryID),
TypeID int,
foreign key(TypeID) references  TypeQuestion(TypeID),
CreatorID varchar(50),
CreateDate date
);

create table Answer(
AnswerID int primary key auto_increment,
Content nvarchar(50),
QuestionID int,
foreign key(QuestionID) references Question(QuestionID),
isCorrect bool
);

create table Exam(
ExamID int primary key auto_increment,
Codema varchar(50),
Title nvarchar(50),
CategoryID varchar(50),
Duration date,
CreatorID varchar(50),
CreateDate date
);

create table ExamQuestion(
ExamID int,
foreign key(ExamID) references Exam(ExamID),
QuestionID int,
foreign key(QuestionID) references Question(QuestionID)
);

