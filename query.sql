################################################################################
#QUERY
################################################################################


\! echo "#Total users, total authors, total authors and total books";
select count(*)
from users;
select count(*)
from authors;
select count(*)
from publishers;
select count(*)
from books;
################################################################################


\! echo "#select ISBN with at least 1 full score of review"
select distinct ISBN
from book_ratings
where rating=10;
################################################################################


\! echo "#Find the number of books with rating > 4 and users in USA."
select count(ISBN)
from users as u, book_ratings as b
where u.user_id=b.user_id and rating>4 and location like '%usa%' and rating>4;
################################################################################


\! echo "#Find the average rating of books with the age of user is from 30 to 50."
select avg(rating)
from users as u, book_ratings as b
where u.user_id=b.user_id and age>30 and age<50;
################################################################################


\! echo "#Find the number of users in each location with book rating>8."
select location, count(u.user_id)
from users as u, book_ratings as b
where u.user_id=b.user_id and rating>8
group by location
order by location;
################################################################################


\! echo "#Find the author’s name and book_title which is published after 2010."
select name, book_title
from authors as a, books as b
where a.author_id=b.author_id and year_of_publication>2010
order by name;
################################################################################


\! echo "#Find the author’s name with book rating =10."
select a.name
from authors as a, books as b, book_ratings as br
where a.author_id=b.author_id and b. ISBN=br.ISBN and rating=10;
################################################################################


\! echo "Find the book_title, publication’s name and rating of book which is published after 2010."
select book_title, p.name, r.rating
from books as b, book_ratings as r, publishers as p
where b.ISBN=r.ISBN and b.publisher_id=p.publisher_id and year_of_publication>2010
order by rating;
################################################################################


\! echo "#select the books whose rating is grater than 8 , published by author id = 2,order by rating."
Select distinct Book_Title ,Rating,Year_Of_Publication
From books as B, authors as A, book_ratings as R
Where A.Author_ID =2 and B.Author_ID = 2 and R.ISBN = B.ISBN and Rating>5
order by Rating desc;
################################################################################


\! echo "# find the books rating and the users information."
Select Book_Title, Rating, users.User_ID, Location, Age
From books, book_ratings,users
Where books.ISBN = book_ratings.ISBN and book_ratings.User_ID = users.User_ID and books.ISBN = 0001846086;
################################################################################


\! echo "# find the user 1838 rated books and rating."
Select User_ID, Book_Title,rating
From book_ratings, books
Where books.ISBN = book_ratings.ISBN and User_ID =1838 ;
################################################################################


\! echo "# find what age of user is likely to give high ratings."
Select Age,avg(Rating)
From book_ratings, users
Where book_ratings.User_ID = users.User_ID
Group by Age
order by avg(Rating) desc;
################################################################################

\! echo "# Find books published after 2000."
select Book_Title
from books
where Year_Of_Publication > 2000;
################################################################################

\! echo "# Order the average score of rated book"
select ISBN, avg(rating)
from book_ratings
group by ISBN
order by avg(rating) desc
################################################################################
