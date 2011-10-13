jQuery(function($) {
  $(document).ready(function() {
    $("form.aform").ajaxForm();
    $("table.calendar td").click(function() {
     $(this).toggleClass("free");
     $(this).toggleClass("busy");
     $(this).parent().submit();
    });
  });
});
