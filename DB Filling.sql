USE RiskManagement;

INSERT INTO Subdivision (subdivisionName) VALUES ('Подразделение 1');

INSERT INTO Employee (lastName, firstName, patronymic, employeeSubdivision, position, headLogin, headPassword) 
	VALUES ('Иванов', 'Иван', 'Иванович', 1, 'Глава отдела', 'login', 'password');

INSERT INTO Projects (projectName, projectDescription, projectPerimeter, projectHead, projectBudget, projectStartDate, projectEndDate, projectExpired, projectDuration) 
	VALUES ('Проект 1', 'Описание проекта', 1, 1, 100, '2020-02-01', '2020-03-01', 0, 28);

INSERT INTO EmployeeToProjects (idEmployee, idProject) VALUES (1, 1);

INSERT INTO Equipment (equipmentName, usageDuration, usagePrice) VALUES ('Бульдозер', 5, 50);

INSERT INTO Materials (materialName, unit, count, unitPrice) VALUES ('Цемент', 'кг', 100, 5);

INSERT INTO Works (workName, workProject, workStartDate, workEndDate, workExpired, workDuration, workBudget, executor, cumulativeJobRisksImortance) 
	VALUES ('Заливка фундамента', 1, '2020-02-01', '2020-02-08', 0, 7, 30, 1, NULL);

INSERT INTO EquipmentToWork (idEquipment, idWork) VALUES (1, 1);

INSERT INTO MaterialsToWork (idMaterial, idWork) VALUES (1, 1);

INSERT INTO Risks (riskName, riskWork, measuresToDecrease, probability, impactBudget, impactBudgetWeight, impactEndDate, impactEndDateWeight, 
	impactQuality, impactQualityWeight, impactContent, impactContentWeight, riskImportance, riskWeight) VALUES ('Поломка бульдозера', 1, 'меры по уменьшению риска', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);