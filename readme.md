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
  - id                              | BIGINT
  - nome_dipartimento               | VARCHAR(50)
  - descrizione_dipartimento        | LONGTEXT
  - direttore_dipartimento          | VARCHAR(100)
  - budget                          | DECIMAL(7,2)

 ### corsi_laurea
  - id                              | BIGINT
  - nome_corso_laurea               | VARCHAR(50)
  - descrizione_corso_laurea        | MEDIUMTEXT
  - presidente_corso_laurea         | VARCHAR(100)
  - id_dipartimento

 ### materie
  - id                              | BIGINT
  - name_materia                    | VARCHAR(50)
  - programma                       | TEXT
  - preside                         | VARCHAR(100)
  - testo_riferimento               | VARCHAR(50)
  - id_corso_laurea
 
 ### professori
  - id                              | BIGINT
  - name                            | VARCHAR(50)
  - cognome                         | VARCHAR(50)
  - anni_insegnamento               | TINYINT
  - ruolo                           | TINYINT (1 professore, 2 assistente, 3 dottorando, etc)
  - id_materia

 ### appelli_esame
  - id                              | BIGINT
  - data                            | DATE (YYYY-MM-GG)
  - ora                             | TIME (HH:MM:SS)
  - aula                            | VARCHAR(50)
  - id_voto


 ### studenti
  - id                              | BIGINT
  - nome                            | VARCHAR(50)
  - cognome                         | VARCHAR(50)
  - id_corso_laurea
  - id_voto

 ### voti
  - id                              | BIGINT
  - voto                            | TINYINT (fino a 30 e la lode 31)

 ## Talelle Pivot

 ### studente_materia
  - id
  - id_studente
  - id_materia

 ### stdente_appello_esame
  - id
  - id_studente
  - id_appello_esame


## Connessioni tra varie tabelle
 0. Il fatto di inserire su di un singolo collegamento il rombo con la scritta "Relationship" non aggiunge chiarezza (il collegamento basta) e peggiora  la visualizzazione in pagina   
 1. Ogni dipartimento ha più corsi di laurea ma ogni corso di laurea non ha più dipartiemnti ==> 1 to Many
 2. Ogni corso di laurea ha più studenti ma uno studente non ha più corsi di laurea ==> 1 to Many
 3. Ogni corso di laurea ha più materie ma ogni materia non ha più corsi di laurea ==> 1 to Many
    * Questo generalizzando le categorie (p.es Analisi 1 c'è per Ingegneria ma non c'è per Filosofia ma Ing. Civile ed Ing. ELettronica hanno Analisi 1)
 4. Ogni materia può avere più professori ma ogni professore non può avere più materie ==> 1 to Many
 5. Ogni studente può avere più materie ma ogni materia può avere più studenti ==> Many to Many
 6. Ogni appello d'esame può avere più studenti ma ogni studente può avere più appelli d'esame ==> Many to Many
 7. Ogni singolo voto si riferisce ad un singolo studente ==> 1 to 1
 8. Ogni singolo voto si riferisce ad un singolo appello ==> 1 to 1
