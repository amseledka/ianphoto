jQuery(function($) {
  $("ul.calendar_months>li").addClass("hidden");
  d = new Date();
  currentMonth = d.getMonth() + 1;
  currentYear = d.getFullYear();
  $("ul.calendar_months li#year_"+currentYear+"_month_"+currentMonth).removeClass("hidden");

  $("ul.calendar_months li a.switch_month_link").click(function() {
    desired_anchor = $(this).attr("href");
    if($("ul.calendar_months>li"+desired_anchor).size()) {
      $("ul.calendar_months>li").addClass("hidden");
      $("ul.calendar_months>li"+desired_anchor).removeClass("hidden");
    }
    return false;
  });

  $("#date_nav_button").click(function() {
    month = $("#date_month").val();
    year = $("#date_year").val();
    desired_date = year+"-"+month+"-1";
    current_location = window.location.href.split("?")[0];
    window.location = current_location+"?month="+desired_date;
    return false;
  });

  stickFooter();
});
