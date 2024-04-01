# Esercizi reativi a GROUP BY e JOIN

## 1. Contare quanti iscritti ci sono stati ogni anno 
  SELECT 
  COUNT(*) AS `number_of_student`, 
  YEAR(`enrolment_date`) AS `year` 
  FROM `students` 
  GROUP BY `year`;

## 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio 
 SELECT 
 COUNT(*) AS `number_of_teachers`, 
 `office_address` AS `building` 
 FROM `teachers` 
 GROUP BY `building`;

 ## 3. Calcolare la media dei voti di ogni appello d'esame
 SELECT `exam_id` AS `exam`, 
 AVG(`vote`) AS `average` 
 FROM `exam_student` 
 GROUP BY `exam`;

 ## 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
 SELECT COUNT(*) AS `n_corsi_laurea`, 
 `department_id` AS `dipartimenti` 
 FROM `degrees` 
 GROUP BY `dipartimenti`;