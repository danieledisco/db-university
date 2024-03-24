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
  - id_voto


 ### studenti
  - id
  - nome
  - cognome
  - id_corso_laurea
  - id_voto

 ### voti
  - id
  - voto

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
 1. Ogni dipartimento ha più corso di laurea ma ogni corso di laurea non ha più dipartiemnti ==> 1 to Many
 2. Ogni corso di laurea ha più studenti ma uno studente non ha più corso di laurea ==> 1 to Many
 3. Ogni corso di laurea ha più materie ma ogni materia non ha più corso di laurea ==> 1 to Many
    * Questo generalizzando le categorie (p.es Analisi 1 c'è per Ingegneria ma non c'è per Filosofia ma Ing. Civile ed Ing. ELettronica hanno Analisi 1)
 4. Ogni materia può avere più professori ma ogni professore non può avere più materie ==> 1 to Many
 5. Ogni studente può avere più studenti ma ogni materia può avere più studenti ==> Many to Many
 6. Ogni appello d'esame può avere più studenti ma ogni studente può avere più appelli ==> Many to Many
 7. Ogni singolo voto si riferisce ad un singolo studente ==> 1 to 1
 8. Ogni singolo voto si riferisce ad un singolo appello ==> 1 to 1
