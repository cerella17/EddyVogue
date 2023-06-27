

$(document).ready(function() {
  $(".card").hover(function() {
    $(this).find(".overlay").css({
      "opacity": "1",
      "transform": "scale(1)"
    });
  }, function() {
    $(this).find(".overlay").css({
      "opacity": "0",
      "transform": "scale(1.3)"
    });
  });

  $(".overlay").css({
    "position": "absolute",
    "background-color": "rgba(192, 192, 192, 0.7)",
    "width": "100%",
    "height": "100%",
    "top": "0",
    "transform": "scale(1.3)",
    "opacity": "0",
    "transition": "transform 1s ease 0s"
  });

  $(".overlay a").css({
    "position": "absolute",
    "top": "50%",
    "left": "50%",
    "transform": "translate(-50%, -50%)",
    "font-weight": "bold",
    "font-size": "70px",
    "font-family": "Sans-serif",
    "text-decoration": "none",
    "color": "white"
  });

  $(".imgbox").css({
    "width": "100%",
    "height": "100%",
    "transition": "transform 1s ease"
  });

  $(".imgbox").hover(function() {
    $(this).css("transform", "scale(1.1)");
  }, function() {
    $(this).css("transform", "scale(1)");
  });
});