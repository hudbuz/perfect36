Specifications for the Rails with jQuery Assessment

Specs:

 Use jQuery for implementing new requirements
 Include a show page rendered using jQuery and an Active Model Serialization JSON backend.
 *** User show pages has a get request that returns user as well as all the tests they have taken. In addition, the test show pages also make a get call to tests and have responses nested within them. 
 Include an index page rendered using jQuery and an Active Model Serialization JSON backend.
 ***Admin /users page gets all users as well as the tests each of them has taken
 Include at least one has_many relationship in information rendered via JSON
 ***UserTest and TestResponses should satisfy that
 Include at least one link that loads or updates a resource without reloading the page
 *** Admin /users page shows students with all the tests taken then loads test scores on click. Also, test show pages display if responses was correct or incorrect. If incorrect, a button appears to make a call to answers, which produces the correct answer. All load without rerendering the page
 Translate JSON responses into js model objects
 *** Test new form submits info, then turns response data into a Test object with prototype method #fillInScores that sends the test's scores above each input seciton
 At least one of the js model objects must have at least one method added by your code to the prototype

 *** ^ see above

 Also not stated in this file but stated in the ReadMe requirements, test new would be the post call. 

 
Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message