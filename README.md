# Comp 420 Final Project (NF)
My personal copy of the final project I did in Comp 420 (Databases). [Forrest Tappan](https://github.com/forresttappan281?tab=overview&from=2016-04-28) and I worked together to create a MySQL superhero database.

If you wish to look at the database for yourself, there is an SQL file located in the sqls folder called **herodb_complete_init.sql**. This creates all the tables, procedures, and views. It also inserts all the data that was used to populate the database. All you need to do is create the databse the SQL file uses - in this case 'HeroDB'. That's line 2 of the file, if you wish to edit it.

All the other SQL files are just pieces of **herodb_complete_init.sql**. Most of the work on the database was done in class using the MySQL client. This made it rather convenient to edit multiple files, but inconvenient to run those multiple files to build the database. Thus we have the ultra query - built from all the other queries to ease the building of the database.

So the various subfolders are the different pieces of our super query. The **data** folder houses the queries for populating the tables with data, the **ddl** (data definition language) folder contains all of our table definitions, and the **dml** (data manipulation language) holds all of the procedures and views.

Everything Else
---------------
This was the project folder, so there are several images related to our presentation. The **herodb_erd0X** image series represents our database in various stages of development. **insert_simple.png**, **insert_with_debut.png**, and **association.png** are all query snapshots that were used in our PowerPoint presentation.

Lessons Learned
---------------
When we were initially deciding what qualities of a superhero should be recorded in our database, we ran across an issue. Most of the data related to a superhero was highly qualitive and subjective. It was difficult to translate all the little quirks and exceptions into the inherently rigid confines of an relational database. 

For example: we started with Z-list superheroes, one of them being a hero called "Dog Welder". How would we represent his power, dog welding? Some websites attempted to classify Dog Welder's abilities into a vague "mechanical affinity". That put Dog Welder in the same category as an gadget loving character - the same category as Morgan Freeman's character from the Christopher Nolan films, Lucius Fox. This the disparity represented in **qualitative_dilemma.png**.

Ultimately we decided to best preserve the heroes by storing text descriptions, rather than attempting to model such a wildly diverse set of people in a constricting way.
