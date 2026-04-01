create database user_database;

use user_database;

create table users(
    id serial primary key,
    name varchar(100),
    email varchar(100) unique
);
