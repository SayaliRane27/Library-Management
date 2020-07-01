CREATE VIEW ViewBooks AS
SELECT B.bk_id, B.bk_title, AI.a_name, CI.c_name
FROM Book_Info B
LEFT JOIN Author_Info AI ON AI.a_id=B.a_id
LEFT JOIN Category_Info CI ON CI.c_id=B.c_id;

Select * from ViewBooks