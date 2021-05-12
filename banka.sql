-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."Musteriler"
(
    id integer NOT NULL,
    musteri_no character varying(5) NOT NULL,
    kanal_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."Gercek_Musteriler"
(
    musteri_id integer NOT NULL,
    ad character varying(20) NOT NULL,
    soyad character varying(20) NOT NULL,
    tc_no character varying(11) NOT NULL,
    PRIMARY KEY (musteri_id)
);

CREATE TABLE public."Tuzel_Musteriler"
(
    musteri_id integer NOT NULL,
    unvan character varying(20) NOT NULL,
    vergi_no character varying(5) NOT NULL,
    PRIMARY KEY (musteri_id)
);

CREATE TABLE public."Adresler"
(
    id integer NOT NULL,
    musteri_id integer NOT NULL,
    adres_detay character varying(200) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.bilancolar
(
    id integer NOT NULL,
    musteri_id integer NOT NULL,
    "baslangıc_tarih" date NOT NULL,
    tutar double precision NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.ticari_faliyetler
(
    id integer NOT NULL,
    musteri_id integer NOT NULL,
    kategori character varying(25) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."Kanallar"
(
    id integer NOT NULL,
    kanal_tip character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public."Gercek_Musteriler"
    ADD FOREIGN KEY (musteri_id)
    REFERENCES public."Musteriler" (id)
    NOT VALID;


ALTER TABLE public."Tuzel_Musteriler"
    ADD FOREIGN KEY (musteri_id)
    REFERENCES public."Musteriler" (id)
    NOT VALID;


ALTER TABLE public."Adresler"
    ADD FOREIGN KEY (musteri_id)
    REFERENCES public."Musteriler" (id)
    NOT VALID;


ALTER TABLE public.bilancolar
    ADD FOREIGN KEY (musteri_id)
    REFERENCES public."Gercek_Musteriler" (musteri_id)
    NOT VALID;


ALTER TABLE public.ticari_faliyetler
    ADD FOREIGN KEY (musteri_id)
    REFERENCES public."Musteriler" (id)
    NOT VALID;


ALTER TABLE public."Musteriler"
    ADD FOREIGN KEY (kanal_id)
    REFERENCES public."Kanallar" (id)
    NOT VALID;

END;