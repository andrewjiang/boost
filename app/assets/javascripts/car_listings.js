$(document).ready(function(){
  $('form.new_car_listing').submit(function(){
    var referredBy = $('#select_referred_by').val();
    mixpanel.track("ListCarApp Submit Pressed", {"Referred By" : referredBy});
  })
});