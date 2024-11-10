CREATE TABLE "artists"(
    "artist_id" SERIAL NOT NULL,
    "firstname" VARCHAR(255) NOT NULL,
    "lastname" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "artists" ADD PRIMARY KEY("artist_id");
CREATE TABLE "sales"(
    "sale_id" SERIAL NOT NULL,
    "track_id" INTEGER NULL,
    "quantity" INTEGER NULL,
    "sale_date" INTEGER NULL,
    "price_at_sale" DATE NULL
);
ALTER TABLE
    "sales" ADD PRIMARY KEY("sale_id");
ALTER TABLE
    "sales" ADD CONSTRAINT "sales_track_id_unique" UNIQUE("track_id");
CREATE TABLE "tracks"(
    "track_id" SERIAL NOT NULL,
    "album_id" INTEGER NULL,
    "artist_id" INTEGER NULL,
    "title" VARCHAR(255) NOT NULL,
    "duration" INTEGER NOT NULL,
    "file_type" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "file_size" INTEGER NOT NULL,
    "price" INTEGER NOT NULL
);
ALTER TABLE
    "tracks" ADD PRIMARY KEY("track_id");
ALTER TABLE
    "tracks" ADD CONSTRAINT "tracks_album_id_unique" UNIQUE("album_id");
ALTER TABLE
    "tracks" ADD CONSTRAINT "tracks_artist_id_unique" UNIQUE("artist_id");
CREATE TABLE "sa-tr"(
    "sale_id" INTEGER NOT NULL,
    "track_id" INTEGER NOT NULL
);
ALTER TABLE
    "sa-tr" ADD CONSTRAINT "sa_tr_sale_id_unique" UNIQUE("sale_id");
ALTER TABLE
    "sa-tr" ADD CONSTRAINT "sa_tr_track_id_unique" UNIQUE("track_id");
CREATE TABLE "customers"(
    "customer_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NULL,
    "email" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "customers" ADD PRIMARY KEY("customer_id");
CREATE TABLE "albums"(
    "album_id" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "release_date" DATE NOT NULL
);
ALTER TABLE
    "albums" ADD PRIMARY KEY("album_id");
ALTER TABLE
    "albums" ADD CONSTRAINT "albums_title_unique" UNIQUE("title");
CREATE TABLE "cu-ar"(
    "customer_id" INTEGER NULL,
    "artist_id" BIGINT NULL
);
ALTER TABLE
    "cu-ar" ADD CONSTRAINT "cu_ar_customer_id_unique" UNIQUE("customer_id");
ALTER TABLE
    "cu-ar" ADD CONSTRAINT "cu_ar_artist_id_unique" UNIQUE("artist_id");
ALTER TABLE
    "sa-tr" ADD CONSTRAINT "sa_tr_sale_id_foreign" FOREIGN KEY("sale_id") REFERENCES "sales"("sale_id");
ALTER TABLE
    "tracks" ADD CONSTRAINT "tracks_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("artist_id");
ALTER TABLE
    "cu-ar" ADD CONSTRAINT "cu_ar_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("artist_id");
ALTER TABLE
    "albums" ADD CONSTRAINT "albums_title_foreign" FOREIGN KEY("title") REFERENCES "customers"("customer_id");
ALTER TABLE
    "sa-tr" ADD CONSTRAINT "sa_tr_track_id_foreign" FOREIGN KEY("track_id") REFERENCES "tracks"("track_id");
ALTER TABLE
    "cu-ar" ADD CONSTRAINT "cu_ar_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE
    "sales" ADD CONSTRAINT "sales_sale_id_foreign" FOREIGN KEY("sale_id") REFERENCES "customers"("customer_id");
ALTER TABLE
    "tracks" ADD CONSTRAINT "tracks_album_id_foreign" FOREIGN KEY("album_id") REFERENCES "albums"("album_id");
ALTER TABLE
    "albums" ADD CONSTRAINT "albums_album_id_foreign" FOREIGN KEY("album_id") REFERENCES "artists"("artist_id");