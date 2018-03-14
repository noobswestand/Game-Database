# Game-Database
For a class - A half implemented database with php and mysql

---

In here you will find:

- **theERD**
- **WWW folder**
 - contains the PHP, HMTL, and CSS that runs the website (NOTE: the PHP uses mysqli_fetch_all which is unsupported on some plateforms)
  
- **make.sql**
  - Creates the database with all of the tables and relationships
- **query.sql**
  - Has various queries that are used in the PHP, and some other fun ones
- **save.sql**
  - Inserts over 25k queries into the database
  
- **Generator**
  - Written in GML  - Mostly used for the drawing capabilities and saving those drawings into a nice png form
  - Generates the fake data that is used for testing the database. This is where the save.sql came from
  - All of the data is valid, and none of it points to invalid data
  
  
##PHP files
These are split up into seperate files depending on thier function

- **database.php**
  - Creates a connection to the database
- **game.php**
  - Displays the games to the users
- **user.php**
  - Displays the user information given by an ID

---

A live version of the website can be found here:
[LiveDemo](dank.x10host.com/Demo/user.php?act=show&user=1)
