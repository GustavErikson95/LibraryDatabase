DROP table if exists book_catalogue;

create table if not exists book_catalogue (
  book_id integer primary key,
  book_title varchar(80) not null,
  book_primary_author varchar(80) not null,
  book_genre varchar(80) not null 
);

drop table if exists library_catalogue;

create table if not exists library_catalogue(
  -- ** TEMPORARY NEEDS UPDATE ** 
  ISSN integer primary key,
  book_title varchar(80),
  copies_total integer default 0,
  foreign key (book_title) references book_catalogue(book_title)
);

drop table if exists library_users;

create table if not exists library_users(
  user_id integer primary key not null,
  user_name varchar(80)
);
  
drop table if exists user_borrows;

create table if not exists user_borrows(
  ISSN integer primary key,
  date_borrowed date,
  date_due date,
  user_borrowed varchar(80),
  foreign key (user_borrowed) references library_users(user_name)
);

insert into book_catalogue (book_title, book_primary_author, book_genre)
values ('The Shining', 'Stephen King', 'Horror'),
  ('House of Leaves', 'Mark Z. Danielewski', 'Horror'),
  ('Pale Fire', 'Vladimir Nabakov', 'Experimental Literature'),
  ('The Silmarillion', 'JRR Tolkein', 'Fantasy'),
  ('Hitchhikers Guide to the Galaxy', 'Douglas Adams', 'Science Fiction');

insert into library_catalogue (book_title, copies_total)
values ('The Shining', 8),
  ('House of Leaves', 2),
  ('Pale Fire', 3),
  ('The Silmarillion', 4),
  ('Hitchhikers Guide to the Galaxy', 1);

insert into user_borrows(ISSN, user_borrowed)
values (1, 1),
  (4, 3);

insert into library_users (user_name)
values ('Snoop Dog'),
  ('Elongated Muskrat'),
  ('Benedictine Cucumberbatch'),
  ('Colonel Sanders'),
  ('Professor Woofington'),
  ('DROP TABLE library_users')
  ('Frank Reynolds');

select * from book_catalogue;
select * from library_catalogue;
select * from user_borrows;
select * from library_users;