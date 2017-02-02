
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    var team = parseInt($(".js-next").attr("data-team"));
    $.get("/teams/" + team + "/games/" + nextId + ".json", function(data) {
      console.log(data);
      //these should be replacing the text within the html tags...
      $("#id").text(data["id"]);

      var versusText = "Teams: " + data["teams"][0]["name"] + " vs. " + data["teams"][1]["name"];
      $("#versus").text(versusText);

      $("#location").text("Location: " + data["location"]);

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
      var hour = time.getHours(); //will need to convert to 12 hr clock...
      var minutes = time.getMinutes();

      var dateText = "Date and Time: " + month + day + " at " + hour + ":" + minutes
      //comments here


      // re-set the id to current on the link
      //$(".js-next").attr("data-id", jsonData["id"]);
    });
  });
});
