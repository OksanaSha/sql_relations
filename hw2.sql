create table if not exists Genres (
id serial primary key,
name varchar(40) not null unique,
description text
);

create table if not exists Musicians (
id serial primary key,
name varchar(40) not null unique,
biography text
);

create table if not exists GenreMusicians (
genre_id integer references Genres(id),
musician_id integer references Musicians(id),
primary key (genre_id, musician_id)
);

create table if not exists Albums (
id serial primary key,
name varchar(40) not null,
year integer not null
);

create table if not exists MusicianAlbums (
musician_id integer references Musicians(id),
album_id integer references Albums(id),
primary key (musician_id, album_id)
);

create table if not exists Tracks (
id serial primary key,
album_id integer references Albums(id),
name varchar(40) not null,
duration_sec integer not null
);

create table if not exists Collections (
id serial primary key,
name varchar(60) not null,
year integer not null
);

create table if not exists CollectionTracks (
collection_id integer references Collections(id),
track_id integer references Tracks(id),
primary key (collection_id, track_id)
);