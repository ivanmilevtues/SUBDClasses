    DROP SCHEMA IF EXISTS Library;
    CREATE SCHEMA Library;
    USE Library;

    DROP TABLE IF EXISTS Book;
    CREATE TABLE Book (
        Id INT AUTO_INCREMENT NOT NULL,
        Name VARCHAR(255) NOT NULL,
        PremiereDate DATE NOT NULL,
        ISBN CHAR(13) NOT NULL,
        
        PRIMARY KEY(Id)
    );

    DROP TABLE IF EXISTS Author;
    CREATE TABLE Author(
        Id INT AUTO_INCREMENT NOT NULL,
        NAME VARCHAR(255) NOT NULL,
        
        PRIMARY KEY(Id)
    );

    DROP TABLE IF EXISTS BookAuthors;
    CREATE TABLE BookAuthors(
        Id INT AUTO_INCREMENT NOT NULL,
        BookAuthorId INT NOT NULL,
        BookId INT NOT NULL,
        
        FOREIGN KEY(BookAuthorId) REFERENCES Author(Id),
        FOREIGN KEY(BookId) REFERENCES Book(Id),
        PRIMARY KEY(Id)
    );


    /*
    * Insert into Book.
    */

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('Sherlock Holmes', '2010-07-25', '1234567890123');

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('Harry Potter', '2002-02-15', '2345678901234');

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('Moby Dick', '1851-12-12', '1029347584912');

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('The Adventures of Huckleberry', '1884-12-10', '1234321893201');

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('Percy Jackson & the Olympians', '2011-11-28', '0987654321098');

    INSERT INTO Book(Name, PremiereDate, ISBN)
    VALUES ('The Frog Prince', '1858-10-12', '0912384756123');


    /*
    * Insert into Author.
    */
    INSERT INTO Author(Name)
    VALUES(' Sir Arthur Conan Doyle');

    INSERT INTO Author(Name)
    VALUES ('J. K. Rowling');

    INSERT INTO Author(Name)
    VALUES ('Herman Melville');

    INSERT INTO Author(Name)
    VALUES ('Mark Twain');

    INSERT INTO Author(Name)
    VALUES ('Rick Riordan');

    INSERT INTO Author(Name)
    VALUES ('Jacob Grimm');

    INSERT INTO Author(Name)
    VALUES ('Wilhelm Grimm');


    /*
    * Insert Book Authors.
    */
    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (1, 1);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (2, 2);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (3, 3);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (4, 4);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (5, 5);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (6, 6);

    INSERT INTO BookAuthors(BookAuthorId, BookId)
    VALUES (7, 6);


    /*
    * Заглавията на всички книги, издадени през определена година
    */
    SELECT b.Name
    FROM Book AS b
    WHERE b.PremiereDate BETWEEN '1851-01-01' AND '1851-12-30';

    /*
    * Заглавието, годината на издаване и ISBN номер на всички книги на определен автор, идентифициран по неговото име
    */
    SELECT b.Name, b.PremiereDate, b.ISBN
    FROM Author as a
    INNER JOIN BookAuthors as ba
    ON a.Name ='Herman Melville' AND a.Id = ba.BookAuthorId
    INNER JOIN Book as b
    ON ba.BookId = b.Id;

    /*
    * Имената на всички автори на определена книга, идентифицирана по своя ISBN номер
    */
    SELECT a.NAME
    FROM Book as b
    INNER JOIN BookAuthors as ba
    ON b.ISBN = '0912384756123' AND b.Id = ba.BookId
    INNER JOIN Author as a
    ON a.Id = ba.BookAuthorId;

    /*
    * Броят на книгите на всеки един автор и името му, подредени в низходящ ред по брой на книгите.
    * Включете и авторите, които нямат издадени книги.
    */
    SELECT a.Name, COUNT(ba.BookAuthorId)
    FROM Author as a
    LEFT JOIN BookAuthors as ba
    ON ba.BookAuthorId = a.Id
    GROUP BY a.Name
    ORDER BY COUNT(ba.BookAuthorId) DESC;
    
    /*
    * Заглавията на всички книги от определена година и броя на авторите им, като включите само книгите, които имат поне два автора.
    * Подредете резулатите по азбучен ред на заглавията на книгите.
    */

    SELECT b.Name, COUNT(ba.BookId)
    FROM Book as b
    INNER JOIN BookAuthors as ba
    ON b.Id = ba.BookId
    GROUP BY b.Name
    HAVING COUNT(ba.BookId) >= 2;
