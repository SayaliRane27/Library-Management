/* Procedure to update the 'Available' flag in Book_Info table when the number of available copies changes 
   'N' when available copies is 0
   'Y' when there are 1 or more available copies */

CREATE OR REPLACE PROCEDURE ChangeBookFlag (bid int)
LANGUAGE plpgsql
AS $$
DECLARE
	cnt int := 0;
BEGIN
	SELECT avail_copies INTO cnt FROM Avail_Copies WHERE isbn = (SELECT isbn FROM Book_Info WHERE bk_id = bid);
	IF (cnt = 0) THEN
		UPDATE Book_Info SET avail = 'N' WHERE bk_id = bid;
	ELSE
		UPDATE Book_Info SET avail = 'Y' WHERE bk_id = bid;
	END IF;
END $$;