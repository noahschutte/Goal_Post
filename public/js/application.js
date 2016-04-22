$(document).ready(function() {

  $('#new-question-form').on('click', function(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('href'),
      method: 'get'
    }).done(function(response){
      $('#future-form').append(response);
    });
  });

  $('#new-comment-on-question').on('click', function(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('href'),
      method: 'get'
    }).done(function(response){
      $('#future-comment-on-ques').append(response);
    });
  });

  $('.new_answer_form').on('click', function(event){
    event.preventDefault();
    $('.answer-form').show();
  });

  $('.new-comment-on-answer').on('click', function(event){

    event.preventDefault();
    $target = $(event.target);
    $target.next().show();
  });

});

//POTENTIAL POST QUESTION SUBMIT AJAX REQ. OPERATIONAL WITHOUT
// $('').on('submit', function(event){
//   event.preventDefault();
//   $target = $(event.target);
//   $.ajax({
//     url: $target.attr('action'),
//     method: 'post',
//     data: $target.serialize()
//   });.done(function(response){

//   })
// })

