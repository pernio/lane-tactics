-- Drop tables
drop table if exists
	player_unit,
    unit,
    player;

create schema if not exists lane;

-- Create tables
create table player (
	id int unsigned not null auto_increment primary key,
    name varchar(100) not null unique,
    level int unsigned not null,
    experience int unsigned not null,
    points int unsigned not null
);
create table unit (
	id int unsigned not null auto_increment primary key,
    name varchar(100) not null,
    damage int unsigned not null,
    speed int unsigned not null,
    moveEveryRounds int unsigned not null,
    unlockAtPoints int unsigned not null,
    picture int unsigned,
    disabled boolean not null
);
create table player_unit (
	playerId int unsigned not null,
    unitId int unsigned not null,
    used boolean not null default false   
);

-- Foreign keys
alter table player_unit
	add constraint fk_player
		foreign key (playerId) references player(id)
        on delete cascade
        on update restrict,
	add constraint fk_unit
		foreign key (unitId) references unit(id)
        on delete cascade
        on update restrict;

-- Inserts
insert into player (name,level,experience,points) values
	('John Doe',0,0,0),
    ('Jinzo',10,230,200);

insert into unit (name,damage,speed,moveEveryRounds,unlockAtPoints,picture,disabled) values
	('Knight',2,1,1,0,null,0),
    ('Runner',1,2,1,200,null,0),
    ('Giant',1,1,2,50,null,0);
