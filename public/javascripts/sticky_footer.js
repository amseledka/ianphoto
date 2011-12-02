function stickFooter() {
  if($("body").height() < $(window).height()) {
    $("footer").addClass("sticky");
  } else {
    $("footer").removeClass("sticky");      
  }
}

$(document).ready(function() {
  stickFooter();
});