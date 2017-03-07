use HeroDB;

drop view if exists SeriesDebut;
drop view if exists ExtendJurdic;
drop view if exists JurdicOverlap;
drop view if exists DebCounts;
drop view if exists HeroDebutAge;

/* ~~~~~~~~~~~~~~~ Useful Views ~~~~~~~~~~~~~~~ 
   When retrieving series info, we have to go through debut. 
   So it'd be best to create a permanent view combining the two. 
*/
create view SeriesDebut as 
	select 
		deb_id, Series.series_id, series_name, deb_number, deb_date
	from 
		Debut inner join Series on Debut.series_id = Series.series_id;

/* 
    Heroes that are part of leagues can be said to have 
	an extended juridiction inherited from the league
*/
create view ExtendJurdic as
	select Hero.hero_id, hero_name, concat(hero_jurdic, '; ', ex_jur) as 'Total Jurisdiction'
    from Hero inner join
		(select hero_id, group_concat(league_jurdic separator ',') as ex_jur
		from Membership inner join League on Membership.league_id = League.league_id
		group by hero_id) 
        as JurStage1
	on Hero.hero_id = JurStage1.hero_id 
    where ex_jur not like concat('%', hero_jurdic,'%');

/* Produces a listing of heroes with the same jurisdiction*/
create view JurdicOverlap as
	select hero_jurdic, group_concat(hero_name separator ',') as Heroes
    from Hero group by hero_jurdic;

/* ~~~~~~~~~~~~~~~ Interesting Views ~~~~~~~~~~~~~~~ */
/* Retrievies the debut count for all series - how many heroes debuted in this series? */
create view DebCounts as
	select
		series_id, series_name, count(series_id) as deb_count
	from
		SeriesDebut
	group by
		series_id;

/* Derived attribute view - hero's real world age (since Debut), in years and months */
create view HeroDebutAge as
	select
		hero_id, hero_name, year(now()) - year(deb_date) as years, 
        month(now()) - month(deb_date) as months
	from
		Hero inner join Debut on Hero.deb_id = Debut.deb_id;

select * from SeriesDebut;
select * from ExtendJurdic;
select * from JurdicOverlap;
select * from DebCounts;
select * from HeroDebutAge;