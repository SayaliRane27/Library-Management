/* Procedure to authenticate the user by verifying the email and password */

CREATE OR REPLACE PROCEDURE Login(email varchar, pass varchar)
LANGUAGE plpgsql
AS $$
DECLARE
	c1 CURSOR FOR SELECT br_email, br_password FROM Borrower_Info;
	email1 Borrower_Info.br_email%TYPE;
	pass1 Borrower_Info.br_password%TYPE;
	cnt int;
	msg varchar(30);
BEGIN
	cnt := 0;
	OPEN c1;	
		LOOP
			FETCH c1 INTO email1, pass1;
				IF (email1 = email and pass1 = pass) THEN
					RAISE NOTICE 'Login Successful.';
					cnt := 1;
				END IF;
			EXIT WHEN NOT FOUND; 
		END LOOP;
		IF cnt = 0 THEN
			RAISE NOTICE 'Invalid email or password.';
		END IF;
	CLOSE c1;
END $$;

/* Calling login function */
--CALL login ('ware@gmail.com', 'wareR')