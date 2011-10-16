jQuery(function($) {
  $("form.new_admin_calendar_record").ajaxForm();
  $("table.calendar td").click(function() {
   $(this).toggleClass("free");
   $(this).toggleClass("busy");
   $(this).find("form.new_admin_calendar_record:first").submit();
  });
});
