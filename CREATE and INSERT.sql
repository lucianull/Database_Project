CREATE TABLE angajati
    (id_angajat number(8), 
    nume varchar(20), 
    prenume varchar(20), 
    cnp varchar(13), 
    functie varchar(15), 
    nr_telefon varchar(15), 
    data_angajare date, 
    salariu float(8), 
    CONSTRAINT angajat_pk PRIMARY KEY (id_angajat));

CREATE SEQUENCE SEQ_ANGAJAT
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Mihai', 'Radu', '2323232323323', 'bucatar-sef', '0747347365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Roman', 'Anastasia', '2323232323323', 'bucatar', '0747308635', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Bran', 'Andrei', '2323232323323', 'manager', '0747347365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Paduraru', 'Adi', '2323232323323', 'barman', '0747349365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Ana', 'Andreea', '2323232323323', 'ospatar', '0747893365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Popescu', 'Andrei', '2323232323323', 'pizzer', '0747374365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);
INSERT INTO angajati values(SEQ_ANGAJAT.NEXTVAL, 'Axinte', 'Iulian', '2323232323323', 'livrator', '0744597365', TO_DATE('29/12/2015', 'DD/MM/YYYY'), 4500);

CREATE TABLE masini_livrare
    (serie_sasiu varchar(17),
    nr_inmatriculare varchar(8),
    data_itp date,
    CONSTRAINT masina_livrare_pk PRIMARY KEY (serie_sasiu));
    
INSERT INTO masini_livrare values('VWZG8323245894MM9', 'B101PPN', TO_DATE('18/10/2021', 'DD/MM/YYYY'));
INSERT INTO masini_livrare values('RNZG8323265874MM9', 'B102PPN', TO_DATE('19/10/2021', 'DD/MM/YYYY'));
INSERT INTO masini_livrare values('RNZG8323845804MM9', 'B103PPN', TO_DATE('20/10/2021', 'DD/MM/YYYY'));

CREATE TABLE clienti (id_client number(8),
    nume varchar(20),
    prenume varchar(20),
    nr_telefon varchar(15),
    CONSTRAINT client_pk PRIMARY KEY (id_client));

CREATE SEQUENCE SEQ_CLIENT
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 10000000
NOCYCLE;

INSERT INTO clienti VALUES(SEQ_CLIENT.NEXTVAL, 'Popescu', 'Ana', '0744796365');
INSERT INTO clienti VALUES(SEQ_CLIENT.NEXTVAL, 'Gaitan', 'Alex', '0744796365');
INSERT INTO clienti VALUES(SEQ_CLIENT.NEXTVAL, 'Rotaru', 'George', '0744796365');
INSERT INTO clienti VALUES(SEQ_CLIENT.NEXTVAL, 'Anton', 'Mihaela', '0744796365');
INSERT INTO clienti VALUES(SEQ_CLIENT.NEXTVAL, 'Radulescu', 'Mihai', '0744796365');


CREATE TABLE comenzi
    (id_comanda number(8),
    id_client number(8),
    adresa varchar(512),
    discount float(2),
    CONSTRAINT comenzi_pk PRIMARY KEY(id_comanda),
    CONSTRAINT comenzi_id_client_fk FOREIGN KEY(id_client) REFERENCES clienti(id_client));
    
CREATE SEQUENCE SEQ_COMENZI
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 10000000
NOCYCLE;

INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 1, 'Calea Victoriei 18', 0);
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 2, null, 0);
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 3, 'Calea Victoriei 18', 0);

CREATE TABLE mod_plata
    (id_plata number (8),
    CONSTRAINT mod_plata_pk PRIMARY KEY (id_plata));

CREATE SEQUENCE SEQ_MOD_PLATA
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 10000000
NOCYCLE;

INSERT INTO mod_plata VALUES(SEQ_MOD_PLATA.NEXTVAL);
INSERT INTO mod_plata VALUES(SEQ_MOD_PLATA.NEXTVAL);
INSERT INTO mod_plata VALUES(SEQ_MOD_PLATA.NEXTVAL);

CREATE TABLE produse
    (id_produs number(8),
    nume varchar(100),
    gramaj float(8),
    pret float(8),
    CONSTRAINT produse_pk PRIMARY KEY (id_produs));

CREATE SEQUENCE SEQ_PRODUSE
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'Salata Greceasca', 350, 24.5);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'Paste Carbonara', 450, 34);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'English Breakfast', 500, 21);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'Pizza Carnivora', 480, 28);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'Pizza Quattro Formaggi', 350, 24.9);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 'Fresh Portocale', 350, 12);

CREATE TABLE ingrediente
    (id_ingredient number(8),
    nume varchar(20),
    stoc float(8),
    CONSTRAINT ingrediente_pk PRIMARY KEY (id_ingredient));


CREATE SEQUENCE SEQ_INGREDIENTE
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'ou', 50);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'lapte', 6);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'faina', 50);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'pepperoni', 5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'cheddar', 10);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'drojdie', 0.5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'portocale', 10);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'bacon', 1);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'tagliatelle', 10);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'mozaarella', 5.5);

CREATE TABLE furnizori
    (id_furnizor number(8),
    nume varchar(30),
    nr_telefon varchar(15),
    CONSTRAINT furnizori_pk PRIMARY KEY (id_furnizor));


CREATE SEQUENCE SEQ_FURNIZOR
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO furnizori VALUES(SEQ_FURNIZOR.NEXTVAL, 'Metro', '0773737373');
INSERT INTO furnizori VALUES(SEQ_FURNIZOR.NEXTVAL, 'Lidl', '0779869373');

CREATE TABLE receptii
    (id_receptie number(8),
    id_ingredient number(8),
    data_receptie date,
    pret_unitar float(10),
    cantitate float(10),
    CONSTRAINT receptie_pk PRIMARY KEY (id_receptie, id_ingredient),
    CONSTRAINT receptie_id_ingredient_fk FOREIGN KEY (id_ingredient) REFERENCES ingrediente(id_ingredient));
    
CREATE SEQUENCE SEQ_RECEPTIE
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO receptii VALUES(SEQ_RECEPTIE.NEXTVAL, 1, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 0.5, 50); 
INSERT INTO receptii VALUES(1, 2, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 4.33, 6); 
INSERT INTO receptii VALUES(1, 3, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 3.5, 50); 
INSERT INTO receptii VALUES(1, 4, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 23.5, 5); 
INSERT INTO receptii VALUES(1, 5, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 15.59, 10); 
INSERT INTO receptii VALUES(SEQ_RECEPTIE.NEXTVAL, 6, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 0.5, 0.5); 
INSERT INTO receptii VALUES(2, 7, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 1, 10); 
INSERT INTO receptii VALUES(2, 8, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 5, 1); 
INSERT INTO receptii VALUES(2, 9, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 18.99, 10); 
INSERT INTO receptii VALUES(2, 10, TO_DATE('2/06/2022', 'DD/MM/YYYY'), 11, 5.5); 

CREATE TABLE se_ocupa_de
    (id_comanda number(8),
    id_angajat number(8),
    CONSTRAINT se_ocupa_de_id_comanda_fk FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda),
    CONSTRAINT se_ocupa_de_id_angajat_fk FOREIGN KEY (id_angajat) REFERENCES angajati(id_angajat));
    
INSERT INTO se_ocupa_de VALUES(1, 7);
INSERT INTO se_ocupa_de VALUES(2, 5);
INSERT INTO se_ocupa_de VALUES(3, 7);

CREATE TABLE are
    (id_produs number(8),
    id_comanda number(8),
    id_angajat number(8),
    cantitate number(4),
    CONSTRAINT are_pk PRIMARY KEY (id_comanda, id_produs),
    CONSTRAINT are_id_produs_fk FOREIGN KEY (id_produs) REFERENCES produse(id_produs),
    CONSTRAINT are_id_comanda_fk FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda),
    CONSTRAINT are_id_angajat_fk FOREIGN KEY (id_angajat) REFERENCES angajati(id_angajat));
    
INSERT INTO are VALUES(1, 1, 1, 1);
INSERT INTO are VALUES(2, 1, 1, 1);
INSERT INTO are VALUES(5, 2, 6, 2);
INSERT INTO are VALUES(6, 3, 4, 2);

CREATE TABLE contine
    (id_produs number(8),
    id_ingredient number(8),
    cantitate float(8),
    CONSTRAINT contine_pk PRIMARY KEY (id_produs, id_ingredient),
    CONSTRAINT contine_id_produs_fk FOREIGN KEY (id_produs) REFERENCES produse(id_produs),
    CONSTRAINT contine_id_ingredient_fk FOREIGN KEY (id_ingredient) REFERENCES ingrediente(id_ingredient));
    
INSERT INTO contine VALUES(1, 8, 0.3);
INSERT INTO contine VALUES(1, 10, 0.1);
INSERT INTO contine VALUES(2, 9, 0.4);
INSERT INTO contine VALUES(2, 10, 0.1);
INSERT INTO contine VALUES(3, 1, 2);
INSERT INTO contine VALUES(3, 8, 0.1);
INSERT INTO contine VALUES(4, 6, 0.025);
INSERT INTO contine VALUES(4, 3, 0.2);
INSERT INTO contine VALUES(4, 8, 0.1);
INSERT INTO contine VALUES(4, 4, 0.1);
INSERT INTO contine VALUES(5, 10, 0.1);
INSERT INTO contine VALUES(5, 5, 0.1);
INSERT INTO contine VALUES(5, 3, 0.2);
INSERT INTO contine VALUES(5, 6, 0.025);
INSERT INTO contine VALUES(6, 7, 1);

