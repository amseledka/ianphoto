function stickFooter() {
  if($("footer").offset().top+$("footer").height() < $(window).height()) {
    $("footer").addClass("sticky");
  } 
  if($("body").height()+$("footer").height() > $(window).height()) {
    $("footer").removeClass("sticky");      
  }
}

$(document).ready(function() {
  stickFooter();
});

$(window).resize(function() {
  stickFooter();
});