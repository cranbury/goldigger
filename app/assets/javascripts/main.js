investors = [];

$(document).ready(function(){
  $("form").submit(function(e){
  e.preventDefault();
  var periodMode = $("#period").val();
  var round = $("#round").val();
  period(periodMode, round);
})
  
})


function period(periodMode, round) {
  // variable is assigned based on periodMode
  var days = 0;

  switch(periodMode){
    case "Last 3 Months":
      days = 90;
      break;
    case "Last 6 Months":
      days = 180;
      break;
    case "Last year":
      days = 365;
      break;
    case "Last 2 Years":
      days = 730;
      break;
    default:
      days = 10000;
  }

  
  response = $.getJSON('/investors', {days: days, round: round}).done(function(data) {
    console.log(data);
    investors = data;
    $("ul").empty();
    for(var i = 0; i < investors.length; i++){
      var li = $("<li><a href=http://www.crunchbase.com/" +investors[i].path+ ">" + investors[i].name+"</a></li>");
      //li.val = investors[i].name;
      $("ul").append(li);
    }
  });
  // AJAX call with variable plugged in
  //looks like $.getJSON(url, {days: variable})
}

