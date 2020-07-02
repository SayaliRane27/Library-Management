# Library Management System
Database management functions simulating requirements of library management system.

### Basic Features:
1. Issue Book
2. Return Book
3. Search Books
4. Add New User

### Entity-Relationship Diagram:
The diagram shows the tables present in the database and their relationship with each other along with the *primary key* and *foreign key* in each table.

<img width="638" alt="eerd" src="https://user-images.githubusercontent.com/67709215/86399391-308d8d00-bc75-11ea-96ea-849ff0e7909f.PNG">


### SQL Files:
```
1. Create_Tables.sql      <-- Creating all the tables from the above diagram and populating data in the tables

2. Login.sql              <-- Checking if the user email and password match the record in database 

3. NewUser.sql            <-- Adding a new user with all the information in the database

4. IssueBook.sql          <-- Adding an issue record in Issue_Status table and calling below functions/procedures
   a. GetBorrowID.sql     <-- Retreiving the user id from the email and password given to issue the book against it
   b. CheckIfIssued.sql   <-- Checking if the book is already issued by the user
   c. ChangeBookFlag.sql  <-- Changing the availability of the book based on number of copies available after issued 
                              ('N' if 0, 'Y' if available copies 1 or more)
   
5. ReturnBook.sql         <-- Adding a record in Return_Status table after verifying the corresponding issue record exists
   
6. SearchBooks.sql        <-- Searching book based on user provided string
   a. ViewBooks_View.sql  <-- View of book title, author and category used to search books
```
