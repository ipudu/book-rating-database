################################################################################
#INITIALIZATION
################################################################################

################################################################################
#Create Table books
drop table if exists books;
create table books
(
ISBN varchar(13),
Book_Title varchar(255),
Author_ID int(11),
Year_Of_Publication int(10),
Publisher_ID int(11),
primary key (ISBN)
);
#Load Data
load data local infile 'data/books.csv' into table books
columns terminated by '\t'
lines terminated by '\n';
################################################################################


################################################################################
#Create Table users
drop table if exists users;
create table users
(
User_ID int(11),
Location varchar(255),
Age int(11),
primary key (User_ID)
);
#Load Data
load data local infile 'data/users.csv' into table users
columns terminated by '\t'
lines terminated by '\n';
################################################################################


################################################################################
#Create table Book_Ratings
drop table if exists book_ratings;
create table book_ratings
(
User_ID int(11),
ISBN varchar(13),
Rating int(11),
primary key (User_ID, ISBN)
);
#Load Data
load data local infile 'data/book_ratings.csv' into table book_ratings
columns terminated by '\t'
lines terminated by '\n';
################################################################################


################################################################################
#Create table Authors
drop table if exists authors;
create table authors
(
Author_ID int(11),
Name varchar(255),
Phone int(10) Default NULL,
Gender varchar(1) Default NULL,
Address varchar(255) Default NULL,
primary key (Author_ID)
);
#Load Data
load data local infile 'data/authors.csv' into table authors
columns terminated by '\t'
lines terminated by '\n';
################################################################################


################################################################################
#Create table Publishers
drop table if exists publishers;
create table publishers
(
Publisher_ID int(11),
Name varchar(255),
Phone int(10) default NULL,
Address varchar(255) default NULL,
primary key (Publisher_ID)
);
#Load Data
load data local infile 'data/publishers.csv' into table publishers
columns terminated by '\t'
lines terminated by '\n';
################################################################################
