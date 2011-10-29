jQuery(function($) {
  $("form.toggle_calendar_record").ajaxForm();
  $("table.calendar td").click(function() {
   $(this).toggleClass("free");
   $(this).toggleClass("busy");
   $(this).find("form.toggle_calendar_record:first").submit();
  });
});
