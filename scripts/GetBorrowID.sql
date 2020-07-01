CREATE OR REPLACE FUNCTION GetBorrowID (email varchar, pass varchar)
RETURNS int
AS $$
DECLARE
	bid int;
BEGIN
	SELECT br_id INTO STRICT bid from Borrower_Info where (br_email=email) AND (br_password=pass);
	RETURN bid;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'Invalid email or password';
	RETURN NULL;
END $$ LANGUAGE plpgsql;


select GetBorrowID ('lane@gmail.com', 'laneJ')