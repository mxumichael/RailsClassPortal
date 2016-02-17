

credentials for the preconfigured admin, instructor and student
name           ,email              ,password
Super User     ,admin@admin.com    ,password
Student User   ,student@ncsu.edu   ,password
Instructor User,instructor@ncsu.edu,password



# csc517_program1
Program 1 (Ruby on Rails) Class Portal

Class Portal
You are tasked with creating a Class Portal web application.

There will be three types of users in the system:
Admin
Instructor
Student
Admins
The system should have a preconfigured admin.  It should be impossible to delete this admin.
An admin user will have the following attributes: 
name
email (should be unique)
password
All admins can perform the following tasks:
Log in with an email and password
Edit their profile details
Manage admins
Create new admins
View the list of all the admins and their profile details (except password)
Delete admins (except oneself and the preconfigured Admin)
Manage courses
Add a course to the system. A course will have the following attributes: 
Course number (unique for each course)
Title
Description
Instructor
Start date
End date
Status.
Possible values for the status attribute:
Active – when the instructor can add/remove students, add course material and post grades;
Inactive – otherwise. If the end date for a course has been reached it is disabled the next day. Disabled courses can’t be modified in any way, only deletion by admin is allowed.
View the list of all the courses.
View the details of each course (the fields mentioned above). 
Edit the details of a course 
Admin can change the details of a course, add/remove students or instructor (there has to be at least one instructor in a course), add material or post grades on behalf of an instructor.
Delete a course from the system
Manage users (instructors and students)
View the list of all the users and their profile details (except password)
View the history of a users (that is, courses enrolled in, taught or taken in the past)
Delete a user.
Students

A student will have the following attributes: 

name
email (should be unique)
password
Anyone can sign up as a student using their email, name and password. After signup, she/he can perform the following tasks:

Log in with email and password
Edit her/his profile details
Search courses using course number or title or instructor or description or status
search results should be a list of courses matching the search criteria
View the details of a course
Request enrollment in a course.
Drop a course.
View own course history.
Note: Course history includes the grades attained by a student for the course.
Instructors

An instructor will have the following attributes: 

name
email (should be unique)
password
Instructors are added to the system by the admin. Instructors can perform the following tasks for the courses assigned to them:
Add a student to the course by approving his/her enrollment request.
Remove a student from course.
Add material to course page (notifications, deadlines etc.). This should be visible to all students.
Post grades for a student (a student can view only his/her grades).
Miscellaneous
Testing

Thoroughly test one model and one controller. Feel free to use any testing framework.
Deployment
Please ensure that your deployment is always accessible. You can use the following

Heroku or any similar PaaS (OpenShift etc) with free plans
Amazon AWS
Bonus (Extra Credit)
You can do any or all of the below for extra credit (equal credit will be awarded for each option).

If a course has the status of “Inactive”, then a student can register to receive a notification email when the course becomes Active (email functionality only has to work on your Development box)
Students and Instructors can exchange private messages.
An Instructor of the course can request to make a course “Inactive”. The request can be viewed by the admins only.

Submission
Your submission in Expertiza should consist of the following-

A link to your deployed application
A link to your repository (use github.com to host your repository)
There should be a README.md file in this repo containing credentials for the preconfigured admin, instructor and student and any other information that reviewers would find useful.
Some information that reviewers may find useful is:
how to test various features (e.g., how to access certain pages, what details to enter in the form etc.)
use cases for some of the edge-case scenarios (e.g., what will happen if admin tries to delete a user who is currently enrolled in a course or taking a course).

