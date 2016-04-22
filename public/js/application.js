$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.new_answer_form').on('click', function(event){

    event.preventDefault();
    console.log("YESSS");
    var $target = $(event.target);

    requestOptions = {
      url: $target.attr('href'),
      method: 'get',
      data: undefined,
      dataType: 'html'
    }

    $.ajax(requestOptions).done(function(response){
      console.log('yes')
      $('#create_new_answer').append(response)
    });
  });
});
