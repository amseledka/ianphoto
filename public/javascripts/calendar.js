jQuery(function($) {
  $("a.switch_month_link").live("click", function() {
    $("ul.calendar_months").load($(this).attr("href"));
    stickFooter();
    return false;
  });

  stickFooter();
});
