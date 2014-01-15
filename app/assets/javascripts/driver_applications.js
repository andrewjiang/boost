function setReferredBy(val) {
  var referredByOther = document.getElementById('referredByOther');
  if (val==="Other") {
    referredByOther.value = "";
    referredByOther.style.display='block';
  } else {
    referredByOther.value = val;
    referredByOther.style.display='none';
  }
}