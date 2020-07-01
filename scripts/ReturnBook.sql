CREATE OR REPLACE PROCEDURE ReturnBook(iid int)
LANGUAGE plpgsql
AS $$
DECLARE
	c1 CURSOR FOR SELECT i_id FROM Return_Status WHERE i_id=iid;
	expdate date;
	edays int;
	fee float;
	i1 int :=0;
	cnt int :=0;
	bid int :=0;
	checkid int :=0;
BEGIN
	SELECT i_id INTO checkid FROM Issue_Status where i_id=iid;
	IF (checkid!=0) THEN
		SELECT expiry_date INTO expdate FROM Issue_Status WHERE i_id=iid;
		IF (expdate < current_date) THEN
			edays := current_date - expdate;
			fee = edays * 10;
		ELSE
			edays := 0;
			fee := 0;
		END IF;

		OPEN c1;
			LOOP
				FETCH c1 INTO i1;
				EXIT WHEN NOT FOUND;
				IF 	(i1 = iid) THEN
					cnt := 1;
				END IF;
			END LOOP;
		CLOSE c1;

		IF (cnt = 0) THEN
			INSERT INTO Return_Status VALUES (DEFAULT, iid, current_date, edays, fee);
			RAISE NOTICE 'Return complete';
			SELECT bk_id INTO bid FROM Issue_Status WHERE i_id = iid;
			UPDATE Avail_Copies SET avail_copies = avail_copies + 1 WHERE isbn = (SELECT isbn from Book_Info where bk_id = bid);
			CALL ChangeBookFlag(bid);
		ELSE
			RAISE NOTICE 'The book is already returned.';
		END IF;
	ELSE
		RAISE NOTICE 'No issue id present';
	END IF;
END $$;

call ReturnBook(4)
