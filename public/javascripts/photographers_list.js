jQuery(function($) {
  $(".view_options a").click(function() {
    $(".photographers_list").removeClass("grid list").addClass($(this).attr("data-set-class-to"));
    $(".view_options a").removeClass("active");
    $(this).addClass("active");
    return false;
  });

  $("a.locaton_select").click(function() {
    $(".cities_list").slideDown("fast");
    return false;
  });

  $(".cities_list .closing_button a").click(function() {
    $(".cities_list").slideUp("fast");
    return false;
  });
});
