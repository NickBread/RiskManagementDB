USE RiskManagement;

CREATE TABLE Subdivision
(
    idSubdivision INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    subdivisionName VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE Employee
(
    idEmployee INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    firstName VARCHAR(45) NOT NULL,
    patronymic VARCHAR(45) NOT NULL,
    employeeSubdivision INT NOT NULL,
    FOREIGN KEY (employeeSubdivision) REFERENCES Subdivision (idSubdivision),
    position VARCHAR(45) NOT NULL,
    headLogin VARCHAR(45),
    headPassword VARCHAR(45)
);

CREATE TABLE Projects (
    idProject INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    projectName VARCHAR(45) NOT NULL,
    projectDescription VARCHAR(45),
    projectPerimeter INTEGER NOT NULL,
    FOREIGN KEY (projectPerimeter) REFERENCES Subdivision (idSubdivision),
    projectHead INTEGER NOT NULL,
    FOREIGN KEY (projectHead) REFERENCES Employee (idEmployee),
    projectBudget INTEGER NOT NULL, 
    projectStartDate DATE NOT NULL,
    projectEndDate DATE NOT NULL,
    projectExpired INTEGER,
    projectDuration INTEGER
);

CREATE TABLE EmployeeToProjects
(
    idEmployee INTEGER NOT NULL,
    FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee),
    idProject INTEGER NOT NULL,
    FOREIGN KEY (idProject) REFERENCES Projects (idProject)
);

CREATE TABLE Equipment
(
    idEquipment INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    equipmentName VARCHAR(45) NOT NULL,
    usageDuration INTEGER NOT NULL,
    usagePrice INTEGER NOT NULL
);
 
CREATE TABLE Materials
(
    idMaterial INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    materialName VARCHAR(45) NOT NULL,
    unit VARCHAR(45) NOT NULL,
    count INTEGER NOT NULL,
    unitPrice INTEGER NOT NULL
);

CREATE TABLE Works (
    idWork INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    workName VARCHAR(45) NOT NULL,
    workProject INTEGER NOT NULL,
    FOREIGN KEY (workProject) REFERENCES Projects (idProject),
    workStartDate DATE NOT NULL,
    workEndDate DATE NOT NULL,
    workExpired INTEGER,
    workDuration INTEGER,
    workBudget INTEGER,
    executor INTEGER NOT NULL,
    FOREIGN KEY (executor) REFERENCES Employee (idEmployee),
    cumulativeJobRisksImortance INTEGER
);


CREATE TABLE EquipmentToWork
(
    idEquipment INTEGER NOT NULL,
    FOREIGN KEY (idEquipment) REFERENCES Equipment (idEquipment),
    idWork INTEGER NOT NULL,
    FOREIGN KEY (idWork) REFERENCES Works (idWork)
);

CREATE TABLE MaterialsToWork
(
    idMaterial INTEGER NOT NULL,
    FOREIGN KEY (idMaterial) REFERENCES Materials (idMaterial),
    idWork INTEGER NOT NULL,
    FOREIGN KEY (idWork) REFERENCES Works (idWork)
);

CREATE TABLE Risks (
    idRisk INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    riskName VARCHAR(45) NOT NULL,
    riskWork INTEGER NOT NULL,
    FOREIGN KEY (riskWork) REFERENCES Works (idWork),
    measuresToDecrease VARCHAR(45),
    probability INTEGER,
    impactBudget INTEGER,
    impactBudgetWeight INTEGER,
    impactEndDate INTEGER,
    impactEndDateWeight INTEGER,
    impactQuality INTEGER,
    impactQualityWeight INTEGER,
    impactContent INTEGER,
    impactContentWeight INTEGER,
    riskImportance INTEGER,
    riskWeight INTEGER
);
