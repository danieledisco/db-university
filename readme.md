# db-university

Modellizzare la struttura di un database per memorizzare tutti i dati riguardanti una università:

 * sono presenti diversi Dipartimenti (es.: Lettere e Filosofia, Matematica, Ingegneria ecc.);
 * ogni Dipartimento offre più Corsi di Laurea (es.: Civiltà e Letterature Classiche, Informatica, Ingegneria Elettronica ecc..)
 * ogni Corso di Laurea prevede diversi Corsi (es.: Letteratura Latina, Sistemi Operativi 1, Analisi Matematica 2 ecc.);
 * ogni Corso può essere tenuto da diversi Insegnanti;
 * ogni Corso prevede più appelli d'Esame;
 * ogni Studente è iscritto ad un solo Corso di Laurea;
 * ogni Studente può iscriversi a più appelli di Esame;
 * per ogni appello d'Esame a cui lo Studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente. 
 
 Pensiamo a quali entità (tabelle) creare per il nostro database e cerchiamo poi di stabilirne le relazioni. Infine, andiamo a definire le colonne e i tipi di dato di ogni tabella.

 ## Progetto del db

 ### dipartimenti
  - id
  - nome_dipartimento
  - descrizione_dipartimento
  - direttore_dipartimento
  - budget

 ### corsi_laurea
  - id
  - nome_corso_laurea
  - descrizione_corso_laurea
  - presidente_corso_laurea
  - id_dipartimento

 ### materie
  - id
  - name_materia
  - programma
  - preside
  - testo_riferimento
  - id_corso_laurea
 
 ### professori
  - id
  - name
  - cognome
  - anni_insegnamento
  - ruolo (docente assistente)
  - id_materia

 ### appelli_esame
  - id
  - data
  - ora
  - aula
  - id_materia

 ### studenti
  - id
  - nome
  - cognome
  - id_corso_laurea
  - id_appello_esame

 ### voti
  - id
  - id_studente
  - id_appello_esame
  - voto
