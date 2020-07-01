/* Procedure to create a new borrower record in the database */

CREATE OR REPLACE PROCEDURE NewUser(firstname varchar, lastname varchar, phone varchar, email varchar, pass varchar) 
LANGUAGE plpgsql
AS $$
BEGIN
  	INSERT INTO Borrower_Info VALUES (DEFAULT, firstname, lastname, phone, email, pass, 'Active', 0);
END $$;