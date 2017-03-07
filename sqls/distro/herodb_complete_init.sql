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
    primary key (fra_id),
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
    foreign key (deb_id) references Debut (deb_id),
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
    foreign key (deb_id) references Debut (deb_id),
    unique (hero_name)
);

create table League (
    league_id smallint(2) unsigned not null,
    league_name varchar(24),
    league_jurdic varchar(32),
    deb_id smallint(2) unsigned not null,
    primary key (league_id),
    foreign key (deb_id) references Debut (deb_id),
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

insert into Franchise VALUES(1,'ABC Studios' );
insert into Franchise VALUES(2,'Amalgam Comics' );
insert into Franchise VALUES(3,'Americas Best Comics' );
insert into Franchise VALUES(4,'Capcom' );
insert into Franchise VALUES(5,'Dark Horse Comics' );
insert into Franchise VALUES(6,'DC Comics' );
insert into Franchise VALUES(7,'Disney' );
insert into Franchise VALUES(8,'Dreamworks' );
insert into Franchise VALUES(9,'Dynamite Entertainment' );
insert into Franchise VALUES(10,'Epic' );
insert into Franchise VALUES(11,'George Lucas' );
insert into Franchise VALUES(12,'Hanna-Barbera' );
insert into Franchise VALUES(13,'HarperCollins' );
insert into Franchise VALUES(14,'Hasbro' );
insert into Franchise VALUES(15,'Icon Comics' );
insert into Franchise VALUES(16,'IDW Publishing' );
insert into Franchise VALUES(17,'Image Comics' );
insert into Franchise VALUES(18,'Impact' );
insert into Franchise VALUES(19,'James Cameron' );
insert into Franchise VALUES(20,'Marv Films' );
insert into Franchise VALUES(21,'Marvel Comics' );
insert into Franchise VALUES(22,'Matt Groening' );
insert into Franchise VALUES(23,'Mattel' );
insert into Franchise VALUES(24,'Microsoft' );
insert into Franchise VALUES(25,'Naughty Dog' );
insert into Franchise VALUES(26,'NBC - Heroes' );
insert into Franchise VALUES(27,'New Universe' );
insert into Franchise VALUES(28,'Nintendo' );
insert into Franchise VALUES(29,'Rebellion' );
insert into Franchise VALUES(30,'Sega' );
insert into Franchise VALUES(31,'Shueisha' );
insert into Franchise VALUES(32,'Skybound' );
insert into Franchise VALUES(33,'Sony Pictures' );
insert into Franchise VALUES(34,'South Park' );
insert into Franchise VALUES(35,'Star Trek' );
insert into Franchise VALUES(36,'Superhero Database' );
insert into Franchise VALUES(37,'SyFy' );
insert into Franchise VALUES(38,'Team Epic TV' );
insert into Franchise VALUES(39,'Titan Books' );
insert into Franchise VALUES(40,'Ubisoft' );
insert into Franchise VALUES(41,'Ultraverse' );
insert into Franchise VALUES(42,'Universal Studios' );
insert into Franchise VALUES(43,'Wildstorm' );
insert into Franchise VALUES(44,'One');

/* Wonder Woman */
INSERT INTO Series VALUES(1,'All Star Comics');
INSERT INTO Debut VALUES(01, STR_TO_DATE( '12/1/1941', "%m/%d/%Y") , 8, 1);

/* Dogwelder, Sectin 8 */
INSERT INTO Series VALUES(2,'Hitman');
INSERT INTO Debut VALUES(02, STR_TO_DATE( '9/1/1997', "%m/%d/%Y") , 18, 2);

/* Superman */
INSERT INTO Series VALUES(3,'Action Comics');
INSERT INTO Debut VALUES(03, STR_TO_DATE( '6/1/1938', "%m/%d/%Y") , 1, 3);

/* Batman */
INSERT INTO Series VALUES(4,'Detective Comics');
INSERT INTO Debut VALUES(04, STR_TO_DATE( '5/1/1939', "%m/%d/%Y") , 37, 4);

/* Jean-Luc Picard */
INSERT INTO Series VALUES(5,'Star Trek: The Next Generation');
INSERT INTO Debut VALUES(05, STR_TO_DATE( '9/28/1987', "%m/%d/%Y") , 1, 5);

/* Captain Hindsight */
INSERT INTO Series VALUES(6,'South Park');
INSERT INTO Debut VALUES(06, STR_TO_DATE( '9/28/1987', "%m/%d/%Y") , 206, 6);

/* Birdman, Galactic Losers */
INSERT INTO Series VALUES(7,'Birdman and the Galaxy Trio');
INSERT INTO Debut VALUES(07, STR_TO_DATE( '9/9/1967', "%m/%d/%Y") , 1, 7);

/* Spectre */
INSERT INTO Series VALUES(8,'More Fun Comics');
INSERT INTO Debut VALUES(08, STR_TO_DATE( '2/1/1940', "%m/%d/%Y") , 51, 8);

/* Saitama */
INSERT INTO Series VALUES(9,'One-Punch Man (Webcomic)');
INSERT INTO Debut VALUES(9, STR_TO_DATE( '1/1/2009', "%m/%d/%Y") , 1, 9);

/* Sixpack */
INSERT INTO Debut VALUES(10, STR_TO_DATE( '12/1/1996', "%m/%d/%Y") , 9, 2);

/* Fortress Of Solitude */
INSERT INTO Debut VALUES(11, STR_TO_DATE( '6/1/1958', "%m/%d/%Y") , 241, 3);

/* Batcave */
INSERT INTO Debut VALUES(12, STR_TO_DATE( '1/1/1944', "%m/%d/%Y") , 83, 4);

/* Justice League */
INSERT INTO Series VALUES(10,'The Brave and the Bold');
INSERT INTO Debut VALUES(13, STR_TO_DATE( '3/1/1960', "%m/%d/%Y") , 83, 10);

insert into Hero VALUES(
    1, 'Wonder Woman', 
    'Superhuman Strength, Flight, Superhuman Speed', 
    'Everywhere', 'Vulnerability to Piercing Weapons', 
    'Wonder Woman did not keep her identity a secret, and she was not at first a "super-heroine". Indeed, her character was in many ways that of a babe in the woods, innocent and without guile. Diana spoke only Themyscirian, a combination of classical Greek and Turkish. She had to learn English when she arrived in America, rather than knowing the language intuitively. Nonetheless, Diana was trained as a warrior and had no compunction against using deadly force when called for. Diana often dealt with war, injustice, inequality, death, and conflicts involving the Olympian Gods. Post-Crisis, Steve Trevor was now an Air Force officer considerably older than Dianas apparent age, thus sidestepping the traditional romance between the two. Instead, Trevor became involved with Etta Candy, who herself became a mature military officer of good standing and a large, but realistic physique. The Greek war god Ares and the Greek witch Circe eventually become two of Dianas greatest enemies. Dianas enemy list also included the Cheetah who was a woman who could transform into a powerful and ferocious feline-humanoid creature.', 
    6, 1);

insert into Hero VALUES(
    2, 'Dogwelder', 
    'None (Dog Welding)', 
    'Gotham City', 'Acidic demon vomit/spit/unknown-secretion',
    'Dogwelder is a member of Section 8, a "superhero" team led by delusional superhero wannabe Six-Pack, a supporting character in the comic book series "Hitman".', 
    6, 2);

insert into Hero VALUES(
    3, 'Superman', 
    'Superhuman strength, Superhuman speed, Superhuman senses (including telescopic vision, x-ray vision, superhuman hearing, microscopic vision), Invulnerability, Superhuman breath ,Flight (initially enhanced jumping, super-leaping)', 
    'Everywhere, Metropolis', 'Magic, kryptonite',
    'Kal-El was born on the doomed planet Krypton to Jor-El and Lara. Although Jor-El had hoped to send his pregnant wife away from the planet in a test rocket and avoid its destruction, Kal-El was born earlier than expected, and the life support systems could only support one. Therefore, the baby was sent alone to Earth, the last son of Krypton. The babys spaceship landed in Sutton Field near Smallville, Kansas, where he was found by Jonathan and Martha Kent, who raised him as their son, Clark Kent. As he grew older, he began exhibiting extraordinary powers, including super-strength and flight. His friends in Smallville included Pete Ross and Lana Lang who continued to remain friends with Kent into their adult lives as shown when Ross became Vice President during Luthors Presidency. As Clark plays football game with Pete and a few other teenage boys. However, his powers lead to Pete breaking his arm, and destroying the football. Guilt-ridden, Clark rides home with his farmer. Next day at school, when Pete asks Clark to sign his cast, Clarks powers let him see the break in Petes arm, and he runs away. Lana , follows him, as they talk about the day they discovered Clarks power when he saved her from the blades of a combine harvester. When Clark responds that hes afraid to touch people, Lana kisses him. However, this leads to Clarks heat vision activating, and he accidentally burns down the gym. Clark wonders whats wrong with him. That night, Jonathan decides to tell Clark the whole story of how he joined the family. They always knew he was special. Not just for who he is, or for his uncanny abilities. They knew because he dropped out of the sky in a silver rocket, and answered their prayers. Clark is initially overjoyed, until the rocket begins playing a recorded message from Jor-El. The Kryptonian scientist introduces himself as the father of Kal-El, last son of Krypton. He says that his powers will protect him in the environment of the planet Earth, but that he is not one of the Earthlings. Clark reacts with rage and blasts the shipw with his heat vision, but the ship is resistant to his powers. Clark runs across the field and breaks down crying. John catches up to him, and the two embrace. The next day, the Kents have an idea: since the rocket is immune to Clarks powers, they make him a set of glasses from some of its crystals to block the heat vision. Martha Kent thinks it makes him look clever. Going back to the rocket, Martha sees some of the disasters that befell Krypton before its destruction, as well as catching a glimpse of day-to-day Kryptonian wear. Clark avoids playing football with the other boys, for fear of hurting someone else. Lana suggests that he get better at lying, then asks him to help her set up her aunts stall at the county fair. There, Clark meets a young red-headed man: Lex Luthor, who is selling off his books so he can get a ticket out of Smallville. Clark is interested in a book about aliens, but when Lex pulls out the green rock he found earlier, Clark faints, knocking over Lex and smashing the jar with the rock in it. A tornado brews from nowhere, and although everyone else gets to safety, Lana is swept up. Reacting, Clark runs to her and jumps... and goes on jumping. He flies to her, rescuing her from the tornado. When she asks how he is flying, his power fails him and he falls to earth. The two land in a stream, and Lana kisses him. The glasses, he notes afterwords, contain the effects of the heat vision. Clark is happy that he has found a positive use for his condition, but Martha is firm that he should wear something else if he is going to use his powers, or he will swiftly be without clothes. Using some sketches based on the Kryptonian clothing in the hologram, and the blanket he came wrapped in, she plans to make a suit for him to wear, but she needs his heat vision to help her sew it (since the impervious nature of the suit has so far resisted five pairs of scissors, a sewing machine and Jonathan Kents chainsaw. Once the suit is made, Clark comes down wearing it. Martha and John are impressed, but Clark is firm in the belief that he will never wear something this silly again. Wearing his suit, Clark engages in several heroic activities across Smallville. Clark saves Lionel Luthor from falling off a cliff. Clark comes back home by slipping through a secret underground tunnel. He tells his parents that he has been staying out of sight, mostly out of embarrassment about his uniform. Clark looks to the skies with Joanthan, sees into distant galaxies, and wonders if hes alone. He studies Dr. Erdels book the next day, and Lex interrupts him in the process of researching Metropolis for the building Lex plans on constructing in the city. After Lex tells Clark of his grand plan, Clark offers to hang out with Lex some time. Lex sneers at the idea. Lana tries to console Clark over the fact that most of the kids are not hanging out with him, or that hes pushing them away. When Lana kisses him on the cheek his eyes begin to flare, and inadvertently he tells Lana that he only wants to be friends, and sends her off upset as well. He hears the other kids poking fun at him, and is soon interrupted by three members of the Legion of Superheroes. The Legion bend the rules to take him to the future. They fight a group of human supremacists. Brainiac 5 interrupts their revelry to remind them of the consequences of their actions. They return Clark to the present and promise future adventures. As Clark describes the future to Pa, a rocket approaches the house. Clark stops it, revealing the test rocket with Krypto. While Clark was still a youngster, the amnesic Daxamite Lar Gand arrived in Smallville, Clark was excited to find someone like himself, even theorizing that he was his older brother and naming "Mon-El". However, after accidentally exposing the Daxamite to lead, his memories returned. Clark sent him to the Phantom Zone until a core for his lead poisoning could be found. During his earliest time as a private super-hero, Clark continued to be visited by the Legion of Super-Heroes, who continue to bring him to their time and induct him into their membership, and share many adventures with Clark during his youth. Clark occasionally traveled between this future and his own native time, before permanently returning to his own native time. His memories of his visits would be erased by Saturn Girl, so as not to pollute the timeline. Clark mostly remembers these events as vague dream-like memories. After he graduated from high school, Clark then decided to travel the world for a number of years, learning about its cultures, languages, and customs. He would secretly help people when he could, although he never had a costume or a superhero identity. He briefly stayed in Paris, where he met a renown journalist named Simone. He also started dating a young woman named Rosie. Shortly after he started dating her, he ran into an old friend of his from high school, Kenny Braverman, who stole Rosie away from Clark. The two had a whirlwind courtship and soon became engaged, but shortly before the wedding was supposed to occur, they broke it off. Clark never learned why. He spent some time in Australia, where he met and had a brief romance with Callie Llewellyn. While in college, Clark met Lori Lemaris and the two became briefly involved, until he learned her secret. After graduating college, Clark later moved to Metropolis. As Clark walks around Metropolis, awestruck, he encounters a citizenry that lives fast, cheap, and out of control. He comes up to the Daily Planet, a dilapidated building laced with graffiti. Inside he makes a point of catching his briefcase and spilling it in a subtle way. In the elevator he meets Rudy Jones, a janitor who says he has forgotten his lunch. Taking Clark for a country rube, Jones talks him into handing over his lunch. At the main floor he encounters Ron Troupe, Steve Lombard, Cat Grant, and Jimmy Olsen. He is mistaken for a bill collector and eventually makes his way to the Planet office, where Lois Lane and Perry White debate the merits of a story. Perry cites the fact that going after Luthor has nearly killed the Planet, and Lois fights back with the nobility of idealism. Perry introduces Lois and Clark, and Lois offers to take Clark on a tour, which surprises Perry. She takes Clark to the Lexcorp building for the unveiling of a piece of technology, and sneaks in wearing a blonde wig by duping Clark to distract the guards. At the top Luthor unveils his Metallo body suit, which Lois observes with interest as a potential machine of war. Security catches her, she flees, and then she trips and falls off the building. Clark, hearing the ruckus, sneaks into an alley, changes into his suit, and saves her. People grab at him and he flees, fearing hes done the wrong thing unveiling himself to the world. Lois and Perry debate the story about the flying man, while the other reporters look on in interest. Luthor goons show and demand that Lois go with them, and they ask for Clark to come as well. Lois agrees, given the opportunity to finally quiz Luthor. Lois and Clark wait for Luthor, who appears as theyre talking about his wealth. Lois lights into him with questions. While they talk, Rudy Jones has mutated into the Parasite and attacks Luthorcorp employees. Clark hears Parasites rampage, tries to make an excuse to leave, but as he does, the Parasite bursts in, having smelled him. Clark appears and takes Parasite out of the building. As he does, Parasites teeth grow outward, and he sucks on Clarks neck, stealing power. They crash on street level. Clark musters strength and punches the Parasite. He hits Parasite with heat vision, then freezes him in place. The people around seem afraid of Clark and thankful. Luthor appears, and tries to foster the fear. Clark leaves. On the roof of the Daily Planet, he sees Jimmy on the ledge. Thinking him about to commit suicide, Clark stops him. They talk about feeling ostracized in the big city, and how Jimmy is thinking of leaving. Superman persuades him not to, given that Jimmy is his only friend in the city. Jimmy asks if he can take a picture of Superman, and Superman allows it. Jimmy has him put his hands on his hips. The issue runs with Lois story and Jimmys picture, identifying the flying man as "Superman." This infuriates Luthor, causing him to declare personal war on Perry White. A fire in the Daily Planets main warehouse almost takes a fatal turn that night, but people are saved by Superman. Public opinion slowly turns to Supermans favor, thanks in large part to the Daily Planet, the only Metropolis newspaper that portrays Superman in a positive way. As he is about to fly away, he meets Lois and Jimmy, who get some information for a story. The three voice the opinion that the fire is the work of a milicious. Jimmy wonders who it could be... At the Daily Planet, things are looking up. Lois is about to get to work, when she is greeted by Sgt John Corben, her fathers choice for her future husband. Lois truies to break away, but John refuses to go away... unitl he is met by Clark Kent. Corben tries to bull Kent aside, but through a combination of oafish good humour and a grip like a steel vice, he sends Corben packing. Clark offers to buy lunch for Lois Lane, and she takes him up on it. Over lunch, Lois Lane tells Clark about John Corben, who works for her father and whom he favours over Lois and her sister. Lane always wanted a son. Lois also reveals that she cannot remember her mother. When Clark tries to comfort her, she points out that Clark constantly shifts between two personae, one a bumbling fool and one a supremely confident man. An explosion on a skyscraper leads to Clark leaving complaining of an inner ear infection. Flying to the scene as Superman, he meets General Lane, who asks him for an interview. Lane points out that while there have been previous reports of humans gaining extraordinary abilities, his office believes that Superman is not human. Superman explains that he grew up on Earth, considers himself an American, and wants to use his powers to be a productive member of society. Lane abandons the pretext that this is an interview, and demands to know what Superman can do, and what his interest in Lois is. Superman turns to leave, telling Lane that he is no-ones enemy. Outside, Superman is accosted by soldiers, who fail to make any impact. However, the soldiers are soon backed up by Corben, who manages to weaken Superman in a pitched battle. As Corben reveals the glowing rock, Superman is weakened, but a ricocheting bullet hits the rock, creating an explosion which cripples Corben and his battlesuit. Superman escapes through the sewers as the soldiers rush to save Corben. General Lane and his forces arrive at the Daily Planet to shut the newspaper down, until they get some answers about Superman. And in the sewers below Metropolis, Superman sits wounded. Soldiers find Superman in the sewers. They battle him as he pleads with them to stand down, for the safety of the bystanders. Metallo enters the fight, and he begins to attack his own soldiers in order to get to Superman. Lois arrives to warn him about the kryptonite and tell him to flee, but he refuses to give up. Metallo attacks him with a kryptonite ray, threatening the bystanders, but Superman melts a manhole cover over the kryptonite and flies Metallo into space until the lack of oxygen knocks him out. Sam arrives and orders Superman and Lois arrested. The crowd turns on the Army, and Superman orders the crowd to stop, telling them that they, not the Army, not Lex Luthor, nor himself, are meant to be Metropoliss saviors. Superman meets with Lex and tells him Metropolis doesnt belong to him: You dont own us. Lex objects, since Superman isnt from Earth. Superman replies, This is my home, and leaves. Superman visits Lois atop the Daily Planet building and thanks her for making him feel like he belongs there. He starts the Planet’s rusty globe spinning again. Lois asks, Are you a man or an alien? His response is, Im Superman.', 
     6, 3);

insert into Hero VALUES(
    4, 'One-Punch Man', 
    'Immeasurable Strength, Enhanced Leap, Invulnerability, Psychic Resistance, Extraordinary Senses', 'Earth, Z-City',
    'Saitama (サイタマ, Saitama) is the main protagonist of One-Punch Man and the most powerful hero alive. Saitama faces a self-imposed existential crisis, as he is now too powerful to gain any thrill from his deeds. He registered with the Hero Association as a C-Class and eventually made a big leap to become a B-Class hero and is tasked to defend Z-City against Mysterious Beings. Under the Hero Association, he is given the name Caped Baldy (ハゲマント, Hagemanto).', 
    'None', 44, 9);

insert into Hero VALUES(
    5, 'Batman', 
    'Martial Arts Master, Genius-Level Intellect, Peak Human Strength, Indomitable Will', 
    'Gotham City, Earth', 'Memories of his parents/childhood',
    'Batman is the secret identity of Bruce Wayne. Witnessing the murder of his parents as a child leads him to train himself to physical and intellectual perfection and don a bat-themed costume in order to fight crime. Batman operates in Gotham City, assisted by various supporting characters including his sidekick Robin and his butler Alfred Pennyworth, and fights an assortment of villains influenced by the characters roots in film and pulp magazines. Unlike most superheroes, he does not possess any superpowers; he makes use (to the best that he can) of intellect, detective skills, science and technology, wealth, physical prowess, and intimidation in his war on crime.', 
    6, 4);

insert into Hero VALUES(
    6, 'Jean-Luc Picard', 
    'Starfleet class Martial combat training, Command of the USS Enterprise', 
    'Federation Space, Earth', 'Only Human', 
    'Jean-Luc Picard was a celebrated Starfleet officer, archaeologist and diplomat who served during the latter two thirds of the 24th century. The highlights of his career were centered around assignments as commanding officer of the Federation starships: USS Stargazer, USS Enterprise-D, and the USS Enterprise-E. In these roles, Picard not only witnessed the major turning points of recent galactic history, but played a key role in them also, from making first contact as captain of the Federations flagship with no fewer than 27 alien species, including the Ferengi and the Borg. He also became the chief contact point with the Q Continuum, and served as Arbiter of Succession, where he presided over the investiture of Chancellor Gowron. Picard would expose the Romulan Star Empire as backers of his chief rivals, later aiding a Romulan underground movement of dissidents to gain a toehold on the Romulan homeworld.', 
    35, 5);

insert into Hero VALUES(
    7, 'Captain Hindsight', 
    'Hindsight, Flight', 
    'South Park', 'Crippling Self-Doubt',
    'Jack "Captain Hindsight" Brollin is a superhero who "helps" people in need by appearing at the scene to lecture them about what they did wrong to get into a certain accident and what methods they could have used to avoid it, instead of actually rescuing them. Despite this, civilians still feel much better afterwards. He removed his special ability through the machine he gained it from in Mysterion Rises, and went back to work as a news reporter again. He was personally invited to superheroes group Coon and Friends by Cartman, but he refused to join.', 
    34, 6);

insert into Hero VALUES(
    8, 'Birdman', 
    'flight, create a shield of solid light, shoot destructive energy beams from his fists, Law', 
    'USA', 'Being away from the Sun for too long',
    'Ray Randall was chosen by the high priest of Ra (Egyptian Sun God) to become an avatar of their deity and become Ras champion on Earth. He was to "shine the light of justice" on the world by doing heroic acts. His powers were activated when he shouted his own codename, "Birdman". Ray could fly, fire powerful blasts from his hands and form an energy shield for defense. He absorbed solar energy and needed the sunlight to recharge his energy reserves. He would be much weaker during the nighttime and helpless when in locations devoid of sunlight, such as underground caverns and castle dungeons. He had his homebase built within an inactive volcano and took up work with the Inter-Nation Security, a secret agency. His contact with the agency was Falcon 7, an eye-patch wearing agent. Falcon would update him on assignments and the activities of established foes. The most regularly appearing sidekick of Birdman was Avenger, an eagle. His origin was never elaborated but Avenger had super-powers of his own: human-level intellect, strength sufficient to carry a weakened or knocked out Birdman and flight at high speeds. At some point Birdman shared some of his powers with a human sidekick, Birdboy. The sole survivor of a ship attacked by pirates, the boy was effectively adopted by Birdman. While the wings of the older hero are natural, the junior one has mechanical wings. A villain hypnotized and mutated a young aerialist to Birdgirl. By the end of her first appearance she had become Birdmans third and last sidekick. Birdman faced several super villains though most were either one-shot characters or appeared in two episodes. The one constant was the employer of most of them, F.E.A.R. . A secret organizations whose members wore hoods and addressed each other by codenumbers. The leader was Number One.', 
     12, 7);

insert into Hero VALUES(
    9, 'Spectre', 
    'God Abilites: manipulation of time & space, control over all matter, invulnerability, limitless strength.', 
    'Everywhere', 'Sufficiently Powerful Magic, Divine Limitations, Divine Law, Finite Power',
    'The Spectre is a cosmic entity and the physical embodiment of Gods vengeance on Earth. Permanently bonded to a human soul, he uses his incredible divine powers to punish the truly wicked, usually ending his victims lives in creative and ironic ways. His existence is in response to the failure of Eclipso, the spirit of Gods wrath that turned completely malevolent and evil. Jim Corrigan, a member of the Justice Society of America during the Golden Age was the original Spectre and the most well-known. Hal Jordan, a fallen Green Lantern, took his place during Day of Judgment as a way of seeking redemption. Crispus Allen became the most recent Spectre at the end of the Day of Vengeance during Infinite Crisis. ' , 
    6, 8);

/* Vapor Man */
insert into Hero VALUES(
    10, 'Vapor Man', 
    'Transform part or all of his body into a gaseous form, exudes vapors', 
    'Galaxy at Large', 'Presumably anything air-tight',
    'A native of planet Vaporus, agent of the Galactic Patrol, and member of the Galaxy Trio', 
    12, 7);

/* Meteor Man */
insert into Hero VALUES(
    11, 'Meteor Man', 
    'Increase or decrease the size of any part of his body. Superhuman strength in enlarged limbs.', 
    'Galaxy at Large', 'Restirctive clothing', 
    'A native of planet Meteorus, agent of the Galactic Patrol, and member of the Galaxy Trio',
    12, 7);

/* Gravity Girl */
insert into Hero VALUES(
    12, 'Gravity Girl', 
    'Bend the laws of gravity to her will', 
    'Galaxy at Large', 'Anything else ridiculously overpowered',
    'The daughter of the king of the planet Gravitas, she left her luxurious home and life of privilege at an early age to fight crime with the Galactic Patrol and was subsequently assigned to the Galaxy Trio team, with whom she has served ever since.', 
    12, 7);

/* Six Pack */
insert into Hero VALUES(
    13, 'Six Pack', 
    'High Tolerance for Alcohol, Possibly Reality Alteration', 
    'Gotham City', 'Sobriety',
    'Sixpack was a regular at Noonan\'s Bar, where he was known for telling tall tales about heroic battles with supervillains while wearing a piss-stained homemade costume. He occasionally tried to help Tommy whenever he could, but usually was not very helpful. He was the leader of Section Eight. Sixpack led his team on a few missions. However his team was not very effective. During his battle against The Many Angled Ones, the majority of his team was killed. Sixpack\'s powers manifest and he sacrfices himself to save the world. He was presumed dead/missing, in reality he survived. Sid went to Alcohol Anonymous meetings and appeared to not recall being a superhero.', 
    6, 10);

/* Superman */
INSERT INTO Identity VALUES(2, 'Clark Kent', 'Newspaper Journalist', 3);

/* Captain Hindsight */
INSERT INTO Identity VALUES(3, 'Jack Brollin', 'Reporter', 7);

/* Birdman */
INSERT INTO Identity VALUES(4, 'Ray Randall', 'None', 8);

/* Spectre */
INSERT INTO Identity VALUES(5, 'Jim Corrigan', 'Police Detective', 9);
INSERT INTO Identity VALUES(6, 'Hal Jordan', 'Green Latern', 9);
INSERT INTO Identity VALUES(7, 'Crispus Allen', 'Police Detective', 9);

/* Six Pack */
INSERT INTO Identity VALUES(8, 'Sidney Speck', 'Unemployed Alcoholic', 13);

/* Galaxy Trio */
INSERT INTO League VALUES(1, "Galaxy Trio", "Andromeda Galaxy", 7);
INSERT INTO Membership VALUES(10, 1);
INSERT INTO Membership VALUES(11, 1);
INSERT INTO Membership VALUES(12, 1);

/* Section 8 */
INSERT INTO League VALUES(2, "Section 8", "Gotham City", 2);
INSERT INTO Membership VALUES(2, 2);
INSERT INTO Membership VALUES(13, 2);

/* Justice League */
INSERT INTO League VALUES(3, "Justice League", "Earth, the Universe, and Everything", 13);
INSERT INTO Membership VALUES(1, 3);
INSERT INTO Membership VALUES(3, 3);
INSERT INTO Membership VALUES(5, 3);

/* Fortress Of Solitude */
INSERT INTO Base VALUES(1, "Fortress Of Solitude", "The Arctic Circle", "", 11);
INSERT INTO Inhabitance VALUES(3, 1);

/* Batcave */
INSERT INTO Base VALUES(2, "Batcave", "USA", "Gotham", 12);
INSERT INTO Inhabitance VALUES(5, 2);

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

SELECT * FROM Series;
SELECT * FROM Franchise;
SELECT * FROM Debut;
SELECT * FROM Base;
SELECT * FROM Hero;
SELECT * FROM League;
SELECT * FROM Membership;
SELECT * FROM Inhabitance;
SELECT * FROM Identity;

select * from SeriesDebut;
select * from ExtendJurdic;
select * from JurdicOverlap;
select * from DebCounts;
select * from HeroDebutAge;