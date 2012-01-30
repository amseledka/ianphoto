$(document).ready(function() {
  $("form#new_contestant").submit(function() {
    $(this).find("input[type=text]").each(function() {
      if(!$(this).val()) {
        $(this).parent().addClass("error");
      } else {
        $(this).parent().removeClass("error");
      }
    });
    $(this).find("input[type=file]").each(function() {
      if($(this).val()) $(this).parent().addClass("loaded");
    });
    if($(".field.error").size()) {
      $(this).addClass("errors");
      $(".field.error input:first").focus();
      return false;
    }
    if(!$(".loaded").size()) {
      $(".field h3").addClass("error_msg");
      return false;
    }
  });
});