function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var billAddress = document.getElementById('bill_address');

    if (billAddress) {
      var autocomplete = new google.maps.places.Autocomplete(billAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(billAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
