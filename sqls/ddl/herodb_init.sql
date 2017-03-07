#CREATE DATABASE `HeroDB`;
use HeroDB;

drop table if exists Membership;
drop table if exists Inhabitance;
drop table if exists Identity;
drop table if exists Base;
drop table if exists Hero;
drop table if exists League;
drop table if exists Debut;
drop table if exists Franchise;
drop table if exists Series;

create table Series (
	series_id smallint(2) unsigned not null,
    series_name varchar(32) not null,
    primary key (series_id),
    unique (series_name)
);

create table Franchise (
	fra_id smallint(2) unsigned not null,
    fra_name varchar(24) not null,
    primary key (fra_id)
    unique (fra_name)
);

create table Debut (
	deb_id smallint(2) unsigned not null,
    deb_date datetime,
    deb_number smallint(2) unsigned,
    series_id smallint(2) unsigned not null,
    primary key (deb_id),
    foreign key (series_id) references Series (series_id)
);

create table Base (
	base_id smallint(2) unsigned not null,
    base_name varchar(24) not null,
    base_country varchar(24),
    base_city varchar(16),
	deb_id smallint(2) unsigned not null,
    primary key (base_id),
    foreign key (deb_id) references Debut (deb_id)
    unique (base_name)
);

create table Hero (
	hero_id smallint(2) unsigned not null,
	hero_name varchar(24) not null,
    hero_powerset text,
    hero_jurdic varchar(24),
    hero_weakset text,
	hero_descrip text,
    fra_id smallint(2) unsigned,
    deb_id smallint(2) unsigned not null,
    primary key (hero_id),
    foreign key (fra_id) references Franchise (fra_id),
    foreign key (deb_id) references Debut (deb_id)
    unique (hero_name)
);

create table League (
	league_id smallint(2) unsigned not null,
    league_name varchar(24),
    league_jurdic varchar(32),
    deb_id smallint(2) unsigned not null,
    primary key (league_id),
    foreign key (deb_id) references Debut (deb_id)
    unique (league_name)
);

create table Membership (
	hero_id smallint(2) unsigned not null,
    league_id smallint(2) unsigned not null,
    primary key (hero_id, league_id),
    foreign key (hero_id) references Hero (hero_id),
    foreign key (league_id) references League (league_id)
);

create table Inhabitance (
	hero_id smallint(2) unsigned not null,
    base_id smallint(2) unsigned not null,
    primary key (hero_id, base_id),
    foreign key (hero_id) references Hero (hero_id),
    foreign key (base_id) references Base (base_id)
);

create table Identity (
	id_id smallint(2) unsigned not null,
    reg_name varchar(24) not null,
    profession varchar(24),
    hero_id smallint(2) unsigned not null,
    primary key (id_id),
    foreign key (hero_id) references Hero (hero_id)
);