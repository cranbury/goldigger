investors = [];

$(document).ready(function(){
  $("form").submit(function(e){
  e.preventDefault;
  var periodMode = $("#period").val();
  period(periodMode);
})
  
})


function period(periodMode) {
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
  
  $.getJSON('/investors', {days: days}).done(function(data) {
    investors = data.responseJSON;
  });
  // AJAX call with variable plugged in
  //looks like $.getJSON(url, {days: variable})
}

