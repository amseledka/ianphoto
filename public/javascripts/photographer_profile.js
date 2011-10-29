jQuery(function($) {
  $("ul.photos li:not(:first)").addClass("hidden");
  $("ul.photos li:first").addClass("current");
  $("ul.photo_previews li:first").addClass("current");

  $("ul.menu li a").click(function() {
    $(".tab_content").addClass("hidden");
    if($(this).parent().attr("id") == "photos") {
      $("body").addClass("galleries");
    } else {
      $("body").removeClass("galleries");
    }
    $(".tab_content#"+$(this).parent().attr("id")+"_tab").removeClass("hidden");
    $("ul.menu li").removeClass("current");
    $(this).parent().addClass("current");
    return false;
  });
  $("body").addClass("galleries");

  $("a#show_info_tab").click(function() {
    $("ul.menu li#info a:first").click();
    return false;
  });

  $("a#show_calendar_tab").click(function() {
    $("ul.menu li#calendar a:first").click();
    return false;
  });

});
