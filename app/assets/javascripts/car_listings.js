$(document).ready(function(){
  $('form').submit(function(){
    var referredBy = $('#select_referred_by').val();
    mixpanel.track("ListCarApp Submit Pressed", {"Referred By" : referredBy});
  })
});