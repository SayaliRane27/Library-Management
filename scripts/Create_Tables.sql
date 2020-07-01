/* Creates tables and inserts data for all the tables expect issue & return statuses*/

DROP TABLE Return_Status CASCADE;
DROP TABLE Issue_Status CASCADE;
DROP TABLE Borrower_Info CASCADE;
DROP TABLE Avail_Copies CASCADE;
DROP TABLE Book_Info CASCADE;
DROP TABLE Description CASCADE;
DROP TABLE Category_Info CASCADE;
DROP TABLE Author_Info CASCADE;

CREATE TABLE Author_Info
	(a_id serial,
	 a_name varchar(100),
	 CONSTRAINT author_pk PRIMARY KEY (a_id));
	 
INSERT INTO Author_Info values (DEFAULT,'Sally Rooney');
INSERT INTO Author_Info values (DEFAULT,'Glendy Vanderah');
INSERT INTO Author_Info values (DEFAULT,'Mary Beth Keane');
INSERT INTO Author_Info values (DEFAULT,'Alex Michaelides');
INSERT INTO Author_Info values (DEFAULT,'Harlan Coben');
INSERT INTO Author_Info values (DEFAULT,'Chuck Wendig');
INSERT INTO Author_Info values (DEFAULT,'Malcolm Gladwell');
INSERT INTO Author_Info values (DEFAULT,'Melinda Gates');
INSERT INTO Author_Info values (DEFAULT,'Antoni Porowski');
INSERT INTO Author_Info values (DEFAULT,'Jeffery Archer');
INSERT INTO Author_Info values (DEFAULT,'Mindy Kaling');
INSERT INTO Author_Info values (DEFAULT,'Elton John');
	 
CREATE TABLE Category_Info
	(c_id serial, 
	 c_name varchar(100),
	 CONSTRAINT category_pk PRIMARY KEY (c_id));
	 
INSERT INTO Category_Info values (DEFAULT,'Fiction');
INSERT INTO Category_Info values (DEFAULT,'Mystery & Thriller');
INSERT INTO Category_Info values (DEFAULT,'Science Fiction');
INSERT INTO Category_Info values (DEFAULT,'Nonfiction');
INSERT INTO Category_Info values (DEFAULT,'Humor');
INSERT INTO Category_Info values (DEFAULT,'Food & Cookbooks');
INSERT INTO Category_Info values (DEFAULT,'Memoir & Autobiography');
	 
CREATE TABLE Description
	(d_id serial,
	 description varchar(500),
	 CONSTRAINT Description_pk PRIMARY KEY (d_id));
	 
INSERT INTO Description VALUES (DEFAULT, 'Normal People is the story of mutual fascination, friendship and love. It takes us from that first conversation to the years beyond, in the company of two people who try to stay apart but find that they can’t.');
INSERT INTO Description VALUES (DEFAULT,'A mysterious child teaches two strangers how to love and trust again.');
INSERT INTO Description VALUES (DEFAULT,'Heartbreaking and redemptive, Ask Again, Yes is a gorgeous and generous portrait of the daily intimacies of marriage and the power of forgiveness.');
INSERT INTO Description VALUES (DEFAULT,'The Silent Patient is a shocking psychological thriller of a woman’s act of violence against her husband―and of the therapist obsessed with uncovering her motive.');
INSERT INTO Description VALUES (DEFAULT,'A perfect family is shattered when their daughter goes missing!');
INSERT INTO Description VALUES (DEFAULT,'A decadent rock star. A deeply religious radio host. A disgraced scientist. And a teenage girl who may be the world''s last hope.');
INSERT INTO Description VALUES (DEFAULT,'A powerful examination of our interactions with strangers -- and why they often go wrong.');
INSERT INTO Description VALUES (DEFAULT,'A debut from Melinda Gates, a timely and necessary call to action for women''s empowerment. Writing with emotion, candor, and grace, she introduces us to remarkable women and shows the power of connecting with one another.');
INSERT INTO Description VALUES (DEFAULT,'Antoni Porowski, the food and wine guru on Netflix''s sensation Queer Eye, meets people where they live—literally. With appealing vulnerability, he shows cooks of all levels how to become more confident and casual in the kitchen.');
INSERT INTO Description VALUES (DEFAULT,'An unputdownable story, spanning sixty years, of two powerful men linked by an all-consuming hatred, brought together by fate to save―and finally destroy―each other.');
INSERT INTO Description VALUES (DEFAULT,'HER FUTURE IS AMBITION. HIS FUTURE IS WEALTH. BUT THEIR PAST HOLDS A SECRET…');
INSERT INTO Description VALUES (DEFAULT,'In Why Not Me?, Kaling shares insightful, deeply personal stories about falling in love at work, seeking new friendships in lonely places, attempting to be the first person in history to lose weight without any behavior modification whatsoever, and believing that you have a place in Hollywood when you’re constantly reminded that no one looks like you.');
INSERT INTO Description VALUES (DEFAULT,'In his first and only official autobiography, music icon Elton John reveals the truth about his extraordinary life, from his rollercoaster lifestyle as shown in the film Rocketman, to becoming a living legend.');

CREATE TABLE Book_Info 
	(bk_id serial,
	 isbn varchar(10),
	 bk_title varchar(200), 
	 a_id int, 
	 c_id int, 
	 d_id int,
	 avail boolean,
	 CONSTRAINT book_pk PRIMARY KEY (bk_id),
	 CONSTRAINT book_fk1 FOREIGN KEY (a_id) REFERENCES Author_Info(a_id),
	 CONSTRAINT book_fk2 FOREIGN KEY (c_id) REFERENCES Category_Info(c_id),
	 CONSTRAINT book_fk3 FOREIGN KEY (d_id) REFERENCES Description(d_id));

INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN12345','Normal People',1,1,1,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN98645','Where the Forest Meets the Stars',2,1,2,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN98709','Ask Again, Yes',3,1,3,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN34630','The Silent Patient',4,2,4,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN35434','Run Away',5,2,5,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN12986','Wanderers',6,3,6,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN98985','Talking to Strangers: What We Should Know About the People We Don''t Know',7,4,7,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN77984','The Moment of Lift: How Empowering Women Changes the World',8,4,8,TRUE);	
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN11984','Antoni in the Kitchen',9,6,9,TRUE);	
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN02643','Kane and Abel',10,1,10,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN66323','The Prodigal Daughter',10,1,11,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN64747','Why Not Me?',11,7,12,TRUE);
INSERT INTO Book_Info VALUES (DEFAULT, 'ISBN60837','Me',12,7,13,TRUE);

CREATE TABLE Avail_Copies
	(isbn varchar(10),
	 bk_id int,
	 num_copies int,
	 avail_copies int,
	 CONSTRAINT avail_pk PRIMARY KEY (isbn, bk_id));
	 
INSERT INTO Avail_Copies VALUES ('ISBN12345',1,4,4);
INSERT INTO Avail_Copies VALUES ('ISBN98645',2,4,4);
INSERT INTO Avail_Copies VALUES ('ISBN98709',3,2,2);
INSERT INTO Avail_Copies VALUES ('ISBN34630',4,1,1);
INSERT INTO Avail_Copies VALUES ('ISBN35434',5,4,4);
INSERT INTO Avail_Copies VALUES ('ISBN12986',6,2,2);
INSERT INTO Avail_Copies VALUES ('ISBN98985',7,3,3);
INSERT INTO Avail_Copies VALUES ('ISBN77984',8,2,2);	
INSERT INTO Avail_Copies VALUES ('ISBN11984',9,3,3);	
INSERT INTO Avail_Copies VALUES ('ISBN02643',10,4,4);
INSERT INTO Avail_Copies VALUES ('ISBN66323',11,2,2);
INSERT INTO Avail_Copies VALUES ('ISBN64747',12,4,4);
INSERT INTO Avail_Copies VALUES ('ISBN60837',13,2,2);
	 
CREATE TABLE Borrower_Info
	(br_id serial, 
	 br_FirstName varchar(20), 
	 br_LastName varchar(20), 
	 br_Phone varchar(20),
	 br_Email varchar(50),
	 br_Password varchar(20),
	 br_Status varchar(10),
	 late_fee float,
	 CONSTRAINT borrower_pk PRIMARY KEY (br_id));
	 
INSERT INTO Borrower_Info VALUES (DEFAULT,'Rory','Ware','9435469823','ware@gmail.com','wareR','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Tara','Shaw','8584969597','shaw@gmail.com','shawT','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Eloy','Kane','5017506725','kane@gmail.com','kaneE','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Jude','Lane','7199935930','lane@gmail.com','laneJ','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Troy','Hale','6454238810','hale@gmail.com','haleT','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Marty','Diaz','9374771606','diaz@gmail.com','diazM','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Nancy','Chris','8775188648','chris@gmail.com','chrisN','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Terry','Roy','5823271995','roy@gmail.com','royT','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Tina','Wells','3199109161','wells@gmail.com','wellsT','Active',0);
INSERT INTO Borrower_Info VALUES (DEFAULT,'Phil','Pope','9934812349','pope@gmail.com','popeP','Active',0);
	 
CREATE TABLE Issue_Status
	(i_id serial,
	 br_id int,
	 bk_id int,
	 issue_date date,
	 expiry_date date,
	 CONSTRAINT issue_pk PRIMARY KEY (i_id),
	 CONSTRAINT issue_fk1 FOREIGN KEY (br_id) REFERENCES Borrower_Info(br_id),
	 CONSTRAINT issue_fk2 FOREIGN KEY (bk_id) REFERENCES Book_Info(bk_id));
	 
CREATE TABLE Return_Status
	(r_id serial,
	 i_id int,
	 return_date date,
	 extra_days int,
	 late_fee float,
	 CONSTRAINT return_pk PRIMARY KEY (r_id),
	 CONSTRAINT return_fk1 FOREIGN KEY (i_id) REFERENCES Issue_Status(i_id));
	 
	 



