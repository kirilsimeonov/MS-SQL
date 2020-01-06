CREATE TABLE Majors (
MajorID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Students (
StudentID INT PRIMARY KEY IDENTITY,
StudentNumber INT NOT NULL,
StudentName NVARCHAR(50) NOT NULL,
MajorID INT,
CONSTRAINT FK_Students_Majors
FOREIGN KEY (MajorID)
REFERENCES Majors (MajorID)
)

CREATE TABLE Payments (
PaymentID INT PRIMARY KEY IDENTITY,
PaymentDate DATE NOT NULL,
PaymentAmount DECIMAL(15, 2) NOT NULL,
StudentID INT,
CONSTRAINT FK_Payments_Students
FOREIGN KEY (StudentID)
REFERENCES Students (StudentID)
)

CREATE TABLE Subjects (
SubjectID INT PRIMARY KEY IDENTITY,
SubjectName NVARCHAR(50) NOT NULL
)

CREATE TABLE Agenda (
StudentID INT,
SubjectID INT,
CONSTRAINT PK_StudentID_SubjectID
PRIMARY KEY (StudentID, SubjectID),
CONSTRAINT FK_Agenda_Students
FOREIGN KEY (StudentID)
REFERENCES Students (StudentID),
CONSTRAINT FK_Agenda_Subjects
FOREIGN KEY (SubjectID)
REFERENCES Subjects (SubjectID)
)