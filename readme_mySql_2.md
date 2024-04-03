# GROUP BY:

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

 # JOIN:
 ## 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
 - Mia soluzione
 SELECT `students`.`id`, `students`.`name` AS `student_name`, `students`.`surname` AS `student_surname`,`students`.`date_of_birth`,`students`.`enrolment_date`, `students`.`email`,`degrees`.`name` AS `degree_name` 
 FROM `students` 
 JOIN `degrees` 
 ON `students`.`degree_id` = `degrees`.`id` 
 WHERE `degrees`.`name` = "Corso di Laurea in Economia";

 ## 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
 - Mia soluzione
 SELECT `degrees`.`name`, `degrees`.`website` , `departments`.`name` AS `department`
 FROM `degrees`
 JOIN `departments`
 ON `degrees`.`department_id` = `departments`.`id`
 WHERE `departments`.`name` = "Dipartimento di Neuroscienze" AND `degrees`.`level` = "magistrale";
 
 ## 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
 - Mia soluzione
 SELECT `courses`.`id`,`courses`.`name`, `courses`.`description`, `courses`.`period`,`courses`.`year`,`courses`.`cfu`,`courses`.`website` ,  `course_teacher`.`teacher_id`
 FROM `courses`
 JOIN `course_teacher`
 ON `course_teacher`.`course_id` = `courses`.`id`
 WHERE  `course_teacher`.`teacher_id` = 44;
 - Soluzione proposta durante correzione
 SELECT `courses`.`id`,`courses`.`name`, `courses`.`description`, `courses`.`period`,`courses`.`year`,`courses`.`cfu`,`courses`.`website` ,  `course_teacher`.`teacher_id`
 FROM `courses`
 JOIN `course_teacher`
 ON `courses`.`id` =  `course_teacher`.`course_id`
 JOIN `teachers`
 ON `course_teacher`.`teacher_id` = `teachers`.`id`
 WHERE `teachers`.`name` = "Fulvio" AND `teachers`.`surname` = "Amato";

 ## 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
 - Mia soluzione
 SELECT `students`.`surname`, `students`.`name`,`degrees`.`name` AS `degree_name`, `departments`.`name` AS `department`
 FROM `students`
 JOIN `degrees`
 ON `students`.`degree_id` = `degrees`.`id` 
 JOIN `departments`
 ON `degrees`.`department_id` = `departments`.`id`
 ORDER BY `students`.`surname`;

 - Soluzione proposta durante correzione
 ....
 ORDER BY `students`.`surname`, `students`.`name`;

 ## 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
  - Mia soluzione
 SELECT `degrees`.`name` AS `degree_name` , `courses`.`name` AS `course_name` , `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname` 
 FROM `degrees` 
 JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id` 
 JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id` 
 JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

 ## 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
 ## 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.