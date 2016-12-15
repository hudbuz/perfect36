# test_grader

This application allows users to take up to 5 real ACT standardized tests and immediately grade and view their scores. 
In addition to taking tests, the application allows users to view their previous test data in a radar graph by D3.js, 
as well as the ability to upload new tests and immediately create AnswerKey's based off of the PDF. 

Current features include:
  
 PDF and Bubble Sheet for 5 ACT's
 Simple user login with Devise
 Authentication with Facebook
 Data visual from D3.js
 Instant creation of new AnswerKey's using a PDF2HTML gem and scraping over through the new document
 Authorization with Pundit
 HTML and CSS designed with Bootstrap SASS


Upcoming features include:
  
  Admin analysis tool with D3 visuals and intelligent analysis of students results
  Google OAuth
  Graph based data structure that informs users which questions they are likely to miss based off of previous results
  Including up to 20 tests
 
 
