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
});

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
