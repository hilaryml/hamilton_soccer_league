$(document).ready(function() {
  attachNext();
});

function attachNext() {
  $(".js-next").on("click", function(event) {
    event.preventDefault();

    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    var team = parseInt($(".js-next").attr("data-team"));
    $.get("/teams/" + team + "/games/" + nextId + ".json", function(data) {
      //replace text within html tag
      $("#gameId").text("Game " + data["id"]);

      var versusText = "Teams: " + data["teams"][0]["name"] + " vs. " + data["teams"][1]["name"];
      $("#versus").text(versusText);

      $("#location").text("Location: " + data["location"]);

      var dateText = getDateText(data);
      $("#dateTime").text(dateText);

      //comments here
      var comments = "<h4>Comments:</h4>";
      $.each(data["comments"], function(index, comment) {
        comments += "<p>" + comment.content + "</p>";
      })
      $("#comments").html(comments)

      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
};

function getDateText(data) {
  var date = new Date(data["date"]);
  var day = date.getDate();
  var monthNum = date.getMonth();

  var months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  var month = months[monthNum];

  var time = new Date(data["time"]);

  var dateText = "Date and Time: " + month + day + " at " + time.toLocaleTimeString()
  return dateText
}
