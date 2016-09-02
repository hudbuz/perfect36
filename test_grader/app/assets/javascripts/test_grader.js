$(document).ready(function() {

  createTest();



})

function Test (id, english_score, math_score, reading_score, science_score, total_score, completed) {
  this.id = id
  this.english_score = english_score
  this.math_score = math_score
  this.reading_score = reading_score
  this.science_score = science_score
  this.total_score = total_score
  this.completed = completed
}


Test.prototype.fillInScores = function() {
  $('#takenAt').html('Completed at: ' + this.completed)
 
  $('#englishScore').html('English score: '+ this.english_score)
  $('#mathScore').html('Math score: '+ this.math_score)
  $('#readingScore').html('Reading score: '+ this.reading_score)
  $('#scienceScore').html('Science score: '+ this.science_score)
  $('#totalScore').html('Total score: '+ this.total_score)
}

function createTest() {

  $('#create').on('click', function(event){
 
    event.preventDefault()

    var params = {}
    params["test"] = {}
    params["test"]["user_id"] = $('#hiddenUserId').attr('value')
    params["test"]["answer_key_id"] = $('#hiddenAnswerKeyId').attr('value')

    params["test"]["responses_attributes"]= {}

    var secs = ['english', 'math', 'reading', 'science']
    for (i = 0; i < secs.length; i ++) {
   
    params["test"]["responses_attributes"][secs[i]]= {}
    var data = $('#'+secs[i]).children('div')

    for (s = 0; s < data.length; s ++) {
                
      params["test"]["responses_attributes"][secs[i]][s+1] =  null
      for (d = 0; d < data[s].children.length; d ++) {
        
    
        if (data[s].children[d].checked === true) {
          params["test"]["responses_attributes"][secs[i]][s+1] = data[s].children[d].id.slice(-1)
        } 

    }}

  }


   var posting = $.post('/tests', params)

    posting.done(function(data) {
      
      var newTest = new Test(data["id"], data["english_score"], data["math_score"], data["reading_score"], data["science_score"], data["total_score"], data["created_at"])
     
      newTest.fillInScores();
    })

})


}






// // tutor show page
//   sutdents
//   click to tests
//   click to scores




// student show page

//   display tests

// New test
//   downpress events to select button
//   worker to grade test on same page as taking it


// admin index can show tutors and students
//   click events to show basic user info



// make test scores built into model  DONE



