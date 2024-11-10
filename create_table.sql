CREATE TABLE "artists" (  
    "artist_id" SERIAL NOT NULL PRIMARY KEY,  
    "firstname" VARCHAR(255) NOT NULL,  
    "lastname" VARCHAR(255) NOT NULL  
);  

CREATE TABLE "customers" (  
    "customer_id" SERIAL NOT NULL PRIMARY KEY,  
    "name" VARCHAR(255) NULL,  
    "email" VARCHAR(255) NOT NULL UNIQUE  
);  

CREATE TABLE "albums" (  
    "album_id" SERIAL NOT NULL PRIMARY KEY,  
    "title" VARCHAR(255) NOT NULL UNIQUE,  
    "release_date" DATE NOT NULL,  
    "artist_id" INTEGER NOT NULL,  
    FOREIGN KEY ("artist_id") REFERENCES "artists"("artist_id")  
);  

CREATE TABLE "tracks" (  
    "track_id" SERIAL NOT NULL PRIMARY KEY,  
    "album_id" INTEGER NOT NULL,  
    "artist_id" INTEGER NOT NULL,  
    "title" VARCHAR(255) NOT NULL,  
    "duration" INTEGER NOT NULL,  
    "file_type" TEXT NOT NULL,  
    "genre" TEXT NOT NULL,  
    "file_size" INTEGER NOT NULL,  
    "price" INTEGER NOT NULL,  
    FOREIGN KEY ("album_id") REFERENCES "albums"("album_id"),  
    FOREIGN KEY ("artist_id") REFERENCES "artists"("artist_id")  
);  

CREATE TABLE "sales" (  
    "sale_id" SERIAL NOT NULL PRIMARY KEY,  
    "track_id" INTEGER NOT NULL,  
    "customer_id" INTEGER NOT NULL,  
    "quantity" INTEGER NOT NULL,  
    "sale_date" DATE NOT NULL,  
    "price_at_sale" INTEGER NOT NULL,  
    FOREIGN KEY ("track_id") REFERENCES "tracks"("track_id"),  
    FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id")  
);