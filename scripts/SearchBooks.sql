/* Function to search books on given string.
   String compared with book title, author and category. */
   
CREATE OR REPLACE FUNCTION SearchBooks(str varchar)
RETURNS TABLE (bookID int, BookTitle varchar, Author varchar, Category varchar)
AS $$
BEGIN
	RETURN QUERY SELECT
		B.bk_id,
		B.bk_title,
		B.a_name,
		B.c_name
	FROM
		ViewBooks B
	WHERE
		bk_title ILIKE '%'||str||'%' OR a_name ILIKE '%'||str||'%' OR c_name ILIKE '%'||str||'%';
END $$ LANGUAGE plpgsql;

/*Calling search book function */
--SELECT * FROM SearchBooks ('Fiction')