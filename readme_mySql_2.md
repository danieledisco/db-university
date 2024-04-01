# Esercizi reativi a GROUP BY e JOIN

## 1. Contare quanti iscritti ci sono stati ogni anno 
  - SELECT 
  COUNT(*) AS `number_of_student`, 
  YEAR(`enrolment_date`) AS `year` 
  FROM `students` 
  GROUP BY `year`;

## 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio 
 - SELECT 
 COUNT(*) AS `number_of_teachers`, 
 `office_address` AS `building` 
 FROM `teachers` 
 GROUP BY `building`;