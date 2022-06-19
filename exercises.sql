--	1. Să se listeze toate ingredientele, numarul comenzii, clientul și plata comenzilor care au fost livrate de livratorul Axinte Iulian, 
--	rezultatele vor fi ordonate în funcție de id-ul comenzii.

SELECT Comenzi.id_comanda, Ingrediente.nume, Clienti.nume, Clienti.prenume, Mod_plata.id_plata FROM comenzi Comenzi
    JOIN clienti Clienti ON (Comenzi.id_client=Clienti.id_client)
    JOIN mod_plata Mod_plata ON (Comenzi.id_plata=Mod_plata.id_plata)
    JOIN are are ON (Comenzi.id_comanda=Are.id_comanda)
    JOIN produse Produse ON (Produse.id_produs=Are.id_produs)
    JOIN contine Contine ON (Produse.id_produs=Contine.id_produs)
    JOIN ingrediente Ingrediente ON (Ingrediente.id_ingredient=Contine.id_ingredient)
    JOIN se_ocupa_de Ocupa ON(Comenzi.id_comanda=Ocupa.id_comanda)
    JOIN angajati Angajati ON(Angajati.id_angajat=Ocupa.id_angajat)
WHERE UPPER(Angajati.nume)='AXINTE' and UPPER(Angajati.prenume)='IULIAN'
ORDER BY Comenzi.id_comanda ASC;


--	2. Să se afișeze toate produsele ce conțin mozzarella

SELECT Produse.id_produs, Produse.nume FROM produse Produse, contine Contine
WHERE Produse.id_produs=Contine.id_produs AND Contine.id_ingredient=(SELECT id_ingredient FROM ingrediente WHERE nume='mozzarella');


--	3. Să se afișeze suma totală a produselor din meniu care contin ingrediente de la furnizorul Metro

SELECT SUM(Produse.pret) AS SUMA_TOTALA FROM produse Produse, receptii Receptii
WHERE Produse.id_produs=Receptii.id_ingredient and Receptii.id_furnizor=(SELECT id_furnizor FROM furnizori WHERE nume='Metro');


--	4. Să se afișeze totalul fiecărei comenzi, id-ul acesteia, id-ul clientului și tipul comenzii (daca este dusă de un livrator 
--	atunci tipul acesteia va fi ‘Livrare’ și în caz contrar va fi ’Restaurant’ 

WITH totalComenzi AS(SELECT Comenzi.id_comanda, Comenzi.id_client, SUM(Produse.pret * Are.cantitate) as total 
                        FROM comenzi Comenzi, produse Produse, are Are
                        WHERE Comenzi.id_comanda=Are.id_comanda and Are.id_produs=Produse.id_produs
                        GROUP BY Comenzi.id_comanda, Comenzi.id_client),
tabel AS (SELECT DISTINCT t.id_comanda, t.id_client, t.total, 
    CASE
        WHEN Ocupa.id_comanda=t.id_comanda and Ocupa.id_angajat IN (SELECT id_angajat FROM angajati WHERE UPPER(functie)='LIVRATOR') THEN 'Livrare'
        ELSE 'Restaurant'
        END AS tip_comanda
    FROM totalComenzi t, se_ocupa_de Ocupa)
SELECT id_comanda, id_client, total, tip_comanda FROM tabel
WHERE tip_comanda is not NULL
ORDER BY id_comanda;


--	5. Să se listeze toate mașinile cărora le expira ITP-ul in acest an

SELECT serie_sasiu, nr_inmatriculare, data_itp FROM masini_livrare
WHERE TO_CHAR(CAST(TO_CHAR(data_itp, 'YYYY') as INT)+1)=TO_CHAR(sysdate, 'YYYY');


--	1. Să se mărească prețul produselor ce conțin mozzarella cu 2 lei

select * from produse;
UPDATE produse SET pret=pret+2
WHERE id_produs IN(
    SELECT p.id_produs FROM produse p, contine c, ingrediente i
    WHERE p.id_produs=c.id_produs and c.id_ingredient=i.id_ingredient and i.nume='mozzarella');
select * from produse;
rollback;


--	2. Să se adauge 100 de lei la salariu șoferului care a dus comanda 1.

select * from angajati;
UPDATE angajati SET salariu=salariu+100
WHERE id_angajat IN(
    SELECT a.id_angajat FROM angajati a, se_ocupa_de s, comenzi c
    WHERE c.id_comanda=1 AND c.id_comanda=s.id_comanda AND s.id_angajat=a.id_angajat);
select * from angajati;
rollback;


--	3. Să se ștearga produsul cu numele Salata Greceasca

select * from produse;

DELETE FROM contine WHERE id_produs=(SELECT id_produs from produse where nume='Salata Greceasca');
DELETE FROM produse WHERE nume='Salata Greceasca';

select * from produse;
ROLLBACK;


--	Să se listeze toate comenzile, clienții, plățile și angajații care s-au ocupat de acestea, 
--	pentru toate comenzile în care angajatul cu funcția de pizzer a participat la crearea produselor 
--	din comanda respectivă.

SELECT Comenzi.id_comanda, Comenzi.adresa, Comenzi.discount, Comenzi.id_client, Modalitati.id_plata, Angajati.nume, Angajati.prenume, Angajati.id_angajat FROM comenzi Comenzi
    FULL OUTER JOIN clienti Clienti ON(Comenzi.id_client=Clienti.id_client)
    FULL OUTER JOIN mod_plata Modalitati ON(Comenzi.id_plata=Modalitati.id_plata)
    FULL OUTER JOIN se_ocupa_de Ocupa ON(Ocupa.id_comanda=Comenzi.id_comanda)
    FULL OUTER JOIN angajati Angajati ON(Ocupa.id_comanda=Comenzi.id_comanda and Ocupa.id_angajat=Angajati.id_angajat)
    FULL OUTER JOIN are Are ON(Comenzi.id_comanda=Are.id_comanda)
WHERE Are.id_comanda=Comenzi.id_comanda AND Are.id_angajat IN (SELECT id_angajat FROM angajati WHERE UPPER(functie)='PIZZER');


--	Să se listeze toți angajații care au salariul mai mic de 3000 de RON.

SELECT * FROM angajati 
MINUS
SELECT * FROM angajati
WHERE salariu>=3000;


--	Să se listeze toate produsele ce nu conțin mozzarella.

SELECT p.id_produs, p.nume, p.gramaj, p.pret FROM produse p, contine c, ingrediente i
GROUP BY p.id_produs, p.nume, p.gramaj, p.pret
MINUS
SELECT p.id_produs, p.nume, p.gramaj, p.pret FROM produse p, contine c, ingrediente i
WHERE p.id_produs=c.id_produs AND c.id_ingredient=i.id_ingredient and i.nume='mozzarella';


