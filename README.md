# APPR6312.ST10146442
Repo for Part 2 APPR6312 Backup 


Please make sure to please check your appsettings.json file to have the correct
database connection string please as this is crucial for you to have this right
for the database connection to work correctly.

Import the Database file or sql file and you are good to go. and start running the Web application to
start registering as a user and then as a volunteer. There are added tasks thanks
to the admin dashboard control over users access as added feature.

If you want to use the Admin please make this predefined Admin user
with this code below:
INSERT INTO Admin (Username, PasswordHash, Email, FullName)
VALUES ('AdminUser', 'Admin123', 'admin@domain.com', 'Admin Name');

This will make a predefined Admin user and the password and username is then
as follows:
Username: AdminUser
Password: Admin123

Please make sure to import and execute the scripts after importing the 
database file please in this repo.
