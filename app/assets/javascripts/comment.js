$(document).ready(function() {
  attachComment();
});

function attachComment() {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();

    var content = $(this).serialize();

    var posting = $.post('/comments', content);

    posting.done(function(data) {
      var comment = data;
      $("#comments").append(comment["content"]);
    });
  });
};
