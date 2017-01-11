$(document).ready(function() {






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

const Times = [45, 60, 40, 40]

Test.prototype.fillInScores = function() {
  $('#takenAt').html('Completed at: ' + this.completed)

  $('#englishScore').html('English score: '+ this.english_score)
  $('#mathScore').html('Math score: '+ this.math_score)
  $('#readingScore').html('Reading score: '+ this.reading_score)
  $('#scienceScore').html('Science score: '+ this.science_score)
  $('#totalScore').html('Total score: '+ this.total_score)
}

function createTest() {





  this.event.preventDefault()



    var params = {}
    params["test"] = {}
    params["test"]["user_id"] = $('#hiddenUserId').attr('value')

    params["test"]["answer_key_id"] = $('#test_answer_key_id')[0].value

    params["test"]["responses_attributes"]= {}

    var secs = ['english', 'math', 'reading', 'science']
    for (i = 0; i < secs.length; i ++) {

    params["test"]["responses_attributes"][secs[i]]= {}

    var data = $('#'+secs[i]).children('div #question')

    for (s = 0; s < data.length; s ++) {
      console.log(s)
      console.log(data[s])
      params["test"]["responses_attributes"][secs[i]][s+1] =  null
      for (d = 0; d < data[s].children.length; d ++) {


        if (data[s].children[d].checked === true) {
          params["test"]["responses_attributes"][secs[i]][s+1] = data[s].children[d].id.slice(-1)
        }


  }}}

   var posting = $.post('/tests', params)

    posting.done(function(data) {

      var newTest = new Test(data["id"], data["english_score"], data["math_score"], data["reading_score"], data["science_score"], data["total_score"], data["created_at"])

      newTest.fillInScores();
    })

    $('#create').hide()



}


function getAnswer() {



    event.preventDefault();
    var answer = {}
    answer["question"] = $(this.parentElement).index()
    answer["section"] = $(this.parentElement.parentElement)[0].id
    answer["akey"] = $('#hiddenAnswerKeyId').attr('value')

    $.get('/answers', answer, function(data) {
      var correct = data["correct_answer"]



      $('#'+answer["section"]).children('li')[answer["question"]-1].children[2].innerHTML = "Correct Answer = " + correct

    })




}

function changeIframe(){


  answer_key = {id: event.target.selectedOptions[0].value}
  $.get('/answer_keys/'+event.target.selectedOptions[0].value, answer_key , function(resp){

    $('#newTestFrame')[0].src = resp.url


  })
}

function sectionShift(side) {

  this.event.preventDefault()
    if(side !== null){
      $('#activeSection')[0].attributes.value.value ++
    }
    else if (event.currentTarget.id === 'rightSection'){

      $('#activeSection')[0].attributes.value.value ++
    }

    else {

      $('#activeSection')[0].attributes.value.value --
    }

    for (i = 0; i < $('.test-container').children().children('.panel-body').children('.section').length; i ++) {

      if (i == $('#activeSection')[0].attributes.value.value ){

        $('.test-container').children().children('.panel-body').children('.section')[i].style.display = ''
      }
      else {

        $('.test-container').children().children('.panel-body').children('.section')[i].style.display = "none";
      }
    }


}

function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date())
  var seconds = Math.floor((t / 1000) % 60)
  var minutes = Math.floor((t / 1000 / 60) % 60)

  return {
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  debugger

  console.log(id)
  console.log(endtime)
  var times = {english: 45, math: 60, reading: 35, science: 35}

  var clock = document.getElementById(id + ' '+ endtime)
  endtime = new Date(Date.parse(new Date()) + times[endtime.id] * 60 * 1000);

  var minutesSpan = clock.querySelector('.minutes')
  var secondsSpan = clock.querySelector('.seconds')

  function updateClock() {
    var t = getTimeRemaining(endtime);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ':'+ ('0' + t.seconds).slice(-2);

    if (t.minutes <= 0 && t.seconds <= 0) {

      clearInterval(timeinterval)


      if($('#activeSection')[0].attributes.value.value === '3'){
        $('#create')[0].click();

      }
      else{
        alert('You have run out of time. Please move on to the next section or submit test.')
        sectionShift('right')

      }
    }
    else if (t.minutes === 5 && t.seconds === 0){
      alert('You have five minutes left.')
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}
//
// var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
// initializeClock('clockdiv', deadline);

jQuery.fn.blindLeftToggle = function (duration, easing, complete) {
    return this.animate({
        marginLeft: parseFloat(this.css('marginLeft')) < 0 ? 0 : -this.outerWidth()
    }, jQuery.speed(duration, easing, complete));
};

/*!
 * @param {number} duration - The speed amount
 * @param {string} easing - The easing method
 * @param {function} complete - A callback function
**/
jQuery.fn.blindLeftOut = function (duration, easing, complete) {
    return this.animate({
        marginLeft: -this.outerWidth()
    }, jQuery.speed(duration, easing, complete));
};

/*!
 * @param {number} duration - The speed amount
 * @param {string} easing - The easing method
 * @param {function} complete - A callback function
**/
jQuery.fn.blindLeftIn = function (duration, easing, complete) {
    return this.animate({
        marginLeft: 0
    }, jQuery.speed(duration, easing, complete));
};



/*!
 * @param {number} duration - The speed amount
 * @param {string} easing - The easing method
 * @param {function} complete - A callback function
**/
jQuery.fn.blindRightToggle = function (duration, easing, complete) {
    return this.animate({
        marginLeft: -(parseFloat(this.css('marginLeft'))) < 0 ? 0 : this.outerWidth()
    }, jQuery.speed(duration, easing, complete));
};

/*!
 * @param {number} duration - The speed amount
 * @param {string} easing - The easing method
 * @param {function} complete - A callback function
**/
jQuery.fn.blindRightOut = function (duration, easing, complete) {
    return this.animate({
        marginLeft: this.outerWidth()
    }, jQuery.speed(duration, easing, complete));
};

/*!
 * @param {number} duration - The speed amount
 * @param {string} easing - The easing method
 * @param {function} complete - A callback function
**/
jQuery.fn.blindRightIn = function (duration, easing, complete) {
    return this.animate({
        marginLeft: 0
    }, jQuery.speed(duration, easing, complete));
};




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
