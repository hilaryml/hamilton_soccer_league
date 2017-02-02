$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/teams/" + id + "/players", function(data) {
      //format data
      var players = "<p><strong>Players:</strong></p>"
      $.each(data, function(index, player) {
        players += "<p>" + player.name + "<p>";
      })
      // Replace text of div
      $("#team-" + id + "-players").html(players);
    });
  });
});
