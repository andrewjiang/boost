$(function() {
  // Fix input element click problem for dropdown menu
  $('.dropdown-menu').click(function(e) {
    e.stopPropagation();
  });
});

