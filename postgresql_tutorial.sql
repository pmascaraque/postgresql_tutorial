create table users (
    id serial primary key,
    first_name varchar(255) not null,
    last_name text,
    age int,
    email text unique not null
);

drop table users;

insert into users
(first_name, last_name, age, email)
values
('bob', null, null, 'bob@bob6.com');

select * from users;

alter table users drop column age;
alter table users add column age int;

select * from users where age is not null;

update users
set age = age - 10
where age < 25;

select * from users;

delete from users
where last_name is null;

insert into posts
	(title, creator_id)
values ('the great fifth post', 5);

create table posts(
    id serial primary key,
    title text not null,
    body text default '...',
    "creatorId" int references users(id) not null
);

select * from posts;

select u.id users_id, p.id posts_id,
first_name, title from users u
inner join posts p on u.id = p.creator_id
where p.title ilike '%sEcOnd%' and u.id = 1;

--1 user * 2 posts
--x * (y, z) = (x, y), (x, z)