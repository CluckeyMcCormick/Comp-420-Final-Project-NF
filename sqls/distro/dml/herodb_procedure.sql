use HeroDB;

DROP PROCEDURE IF EXISTS insert_hero;
DROP PROCEDURE IF EXISTS insert_base;
DROP PROCEDURE IF EXISTS insert_league;
DROP PROCEDURE IF EXISTS insert_franchise;
DROP PROCEDURE IF EXISTS insert_identity; 

DROP PROCEDURE IF EXISTS associate_league;
DROP PROCEDURE IF EXISTS associate_base;

DROP PROCEDURE IF EXISTS search_hero;

/* ~~~~~~~~~~~~~~~ Insertion Procedures ~~~~~~~~~~~~~~~ */
/* Creates a new hero, and the associated debut and series entities (if necessary) */
DELIMITER //
CREATE PROCEDURE insert_hero( 
	hName varchar(24), hPowSet text, hJurDic varchar(24), 
	hWeakSet text, hDescrip text, serName varchar(32), 
	debDate datetime,  debNum smallint unsigned )
BEGIN

	declare seriesId smallint;

	declare debId smallint;

	declare heroId smallint;

	select series_name INTO seriesId from Series where series_name = serName;

	/* If series exists */
	if seriesId is not NULL then
		/* grab the debId */
		select deb_id INTO debId from Debut where series_id = seriesId and deb_number = debNum;
		/* If debut doesn't exist */
		if debId is NULL then		
			/* make the debut */
			select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
			insert into Debut VALUES(debId, debDate, debNum, seriesId);
		end if;
	else
		/* make the series ourselves */
		select series_id + 1 INTO seriesId from Series order by series_id desc limit 1;
		insert into Series VALUES(seriesId, serName);
		/* then make the debut */
		select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
		insert into Debut VALUES(debId, debDate, debNum, seriesId);
	end if;
	
	/* Create our hero*/
	select hero_id + 1 INTO heroId from Hero order by hero_id desc limit 1;
	insert into Hero VALUES( heroId, hName, hPowSet, hJurDic, hWeakSet, hDescrip,  debId);
END //
DELIMITER ;

/* Creates a new base, and the associated debut and series entities (if necessary) */
DELIMITER //
CREATE PROCEDURE insert_base( 
	bName varchar(24), bCountry varchar(24), bCity varchar(16), 
	serName varchar(32), debDate datetime,  debNum smallint unsigned )
BEGIN

	declare seriesId smallint;

	declare debId smallint;

	declare baseId smallint;

	select series_name INTO seriesId from Series where series_name = serName;

	/* If series exists */
	if seriesId is not NULL then
		/* grab the debId */
		select deb_id INTO debId from Debut where series_id = seriesId and deb_number = debNum;
		/* If debut doesn't exist */
		if debId is NULL then		
			/* make the debut */
			select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
			insert into Debut VALUES(debId, debDate, debNum, seriesId);
		end if;
	else
		/* make the series ourselves */
		select series_id + 1 INTO seriesId from Series order by series_id desc limit 1;
		insert into Series VALUES(seriesId, serName);
		/* then make the debut */
		select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
		insert into Debut VALUES(debId, debDate, debNum, seriesId);
	end if;
	
	/* Create our base*/
	select base_id + 1 INTO baseId from Base order by base_id desc limit 1;
	insert into Base VALUES(baseId, bName, bCountry, bCity, debId);
END //
DELIMITER ;

/* Creates a new league, and the associated debut and series entities (if necessary) */
DELIMITER //
CREATE PROCEDURE insert_league( 
	lName varchar(24), lJurDic varchar(32), 
	serName varchar(32), debDate datetime,  debNum smallint unsigned )
BEGIN

	declare seriesId smallint;

	declare debId smallint;

	declare leagueId smallint;

	select series_name INTO seriesId from Series where series_name = serName;

	/* If series exists */
	if seriesId is not NULL then
		/* grab the debId */
		select deb_id INTO debId from Debut where series_id = seriesId and deb_number = debNum;
		/* If debut doesn't exist */
		if debId is NULL then		
			/* make the debut */
			select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
			insert into Debut VALUES(debId, debDate, debNum, seriesId);
		end if;
	else
		/* make the series ourselves */
		select series_id + 1 INTO seriesId from Series order by series_id desc limit 1;
		insert into Series VALUES(seriesId, serName);
		/* then make the debut */
		select deb_id + 1 INTO debId from Debut order by deb_id desc limit 1;
		insert into Debut VALUES(debId, debDate, debNum, seriesId);
	end if;
	
	/* Create our league*/
	select league_id + 1 INTO leagueId from League order by league_id desc limit 1;
	insert into League VALUES(leagueId, lName, lJurDic, debId);
END //
DELIMITER ;

/* Creates a new franchise */
DELIMITER //
CREATE PROCEDURE insert_franchise( fName varchar(24) )
BEGIN

	declare fraId smallint;
	
	/* Create our franchise*/
	select fra_id + 1 INTO fraId from Franchise order by fra_id desc limit 1;
	insert into Franchise VALUES(fraId, fName);

END //
DELIMITER ;

/* Creates a new identity for the specified hero */
DELIMITER //
CREATE PROCEDURE insert_identity( hName varchar(24), rName varchar(24), proff varchar(24) )
BEGIN

	declare idId smallint;
	
	declare heroId smallint;

	select hero_id INTO heroId from Hero where hero_name = hName;

	if heroId is not NULL then
		/* Create our identity*/
		select id_id + 1 INTO idId from Identity order by id_id desc limit 1;
		insert into Identity VALUES(idId, rName, proff, heroId);
	end if;
		
END //
DELIMITER ;

/* Associates a league and a hero via a Membership entity */
DELIMITER //
CREATE PROCEDURE associate_league( hName varchar(24), lName varchar(24) )
BEGIN
	
	declare heroId smallint;

	declare leagueId smallint;

	select hero_id INTO heroId from Hero where hero_name = hName;

	select league_id INTO leagueId from League where league_name = lName;

	if heroId is not NULL and leagueId is not NULL then
		/* Create our hero*/
		insert into Membership VALUES(heroId, leagueId);
	end if;
		
END //
DELIMITER ;

/* Associates a base and a hero via an Inhabitance entity */
DELIMITER //
CREATE PROCEDURE associate_base( hName varchar(24), bName varchar(24) )
BEGIN
	
	declare heroId smallint;

	declare baseId smallint;

	select hero_id INTO heroId from Hero where hero_name = hName;

	select base_id INTO baseId from Base where base_name = bName;

	if heroId is not NULL and baseId is not NULL then
		/* Create our hero*/
		insert into Inhabitance VALUES(heroId, baseId);
	end if;
		
END //
DELIMITER ;

/* ~~~~~~~~~~~~~~~ Searching Procedures ~~~~~~~~~~~~~~~ */
/* Searches all of hero's fields for the keyword, returns any matches */
DELIMITER //
CREATE PROCEDURE search_hero( keyword varchar(32) )
BEGIN
	
	declare composite varchar(34);

	select concat('%', keyword ,'%') INTO composite;

	select
		hero_id, hero_name, hero_powerset, hero_weakset, hero_jurdic, hero_descrip
	from
		Hero
	where
		(hero_name like keyword) or (hero_powerset like keyword) or (hero_weakset like keyword)
        or (hero_jurdic like keyword) or (hero_descrip like keyword);
END //
DELIMITER ;