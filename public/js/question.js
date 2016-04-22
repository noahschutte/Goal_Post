$(document).ready(function() {
  $('#new-question-form').on('click', function(event){
    console.log("I've clicked on the link",event)
    event.preventDefault;
    $target = $(event.target)
    $.ajax({
      url: '/questions/new'
    }).done(function(response) {
      console.log("I'm the response", response)
    })
  })

});
