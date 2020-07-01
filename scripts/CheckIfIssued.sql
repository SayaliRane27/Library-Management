/* Function to check if the book is already issued by the user and return an integer
   '0' for not issued as every issue record has a corresponding return record */

CREATE OR REPLACE FUNCTION CheckIfIssued(bid int, uid int)
RETURNS int
AS $$
DECLARE
	x1 int := 0;
	x2 int := 0;
	cnt int := 0;
	c1 CURSOR FOR SELECT i_id FROM Issue_Status WHERE uid=br_id AND bid=bk_id;
	c2 CURSOR FOR SELECT r_id FROM Return_Status;
BEGIN
	OPEN c1;
		LOOP
			FETCH c1 INTO x1;
			EXIT WHEN NOT FOUND;
			OPEN c2;
				LOOP
					FETCH c2 INTO x2;
					EXIT WHEN NOT FOUND;
					IF (x1=x2) THEN
						cnt := cnt - 1;
					END IF;
				END LOOP;
			CLOSE c2;
			cnt := cnt + 1;
		END LOOP;
	CLOSE c1;
	RETURN cnt;
END $$ LANGUAGE plpgsql;