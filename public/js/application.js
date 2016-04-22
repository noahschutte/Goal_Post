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
    var $target = $(event.target);
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
    var $target = $(event.target);
    $target.next().show();
  });

  $('.upvote-block').on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      method: 'post',
      url: '/votes',
      data: $target.serialize(),
      dataType: 'html'
    }).done(function(response){
      $target.parent().next().html(response)
    });
  });

    $('.downvote-block').on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      method: 'post',
      url: '/votes',
      data: $target.serialize(),
      dataType: 'html'
    }).done(function(response){
      $target.parent().next().html(response)
    });
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
