CREATE OR REPLACE PROCEDURE IssueBook (bid int, email varchar, pass varchar)
LANGUAGE plpgsql
AS $$
DECLARE
	uid int := 0;
	cnt int := 0;
	flg boolean;
BEGIN
	uid := GetBorrowID(email,pass);
	IF uid IS NOT NULL THEN
		SELECT avail INTO flg FROM Book_Info WHERE bk_id = bid;
		cnt := CheckIfIssued(bid, uid);
		IF cnt = 0 THEN
			IF flg = 'Y' THEN
				INSERT INTO Issue_Status VALUES (DEFAULT, uid, bid, current_date, current_date + interval '30 days');
				RAISE NOTICE 'Book issued in your name.';
				UPDATE Avail_Copies SET avail_copies = avail_copies - 1 WHERE isbn = (SELECT isbn FROM Book_Info where bk_id = bid);
				CALL ChangeBookFlag(bid);
			ELSE
				RAISE NOTICE 'All the copies of the book are borrowed at the moment.';
			END IF;
		ELSE
			RAISE NOTICE 'The book is already issued to your name.';
		END IF;
	END IF;
END $$;


CALL IssueBook (3,'lane@gmail.com','laneJ')
select * from issue_status
select * from book_info
select * from avail_copies
select * from borrower_info
