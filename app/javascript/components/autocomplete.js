function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  document.getElementById('bill_zip_code').value = components.zip_code;
  document.getElementById('bill_city').value = components.city;
}

function getAddressComponents(place) {

  if (window.console && typeof console.log === "function") {
    console.log(place);
  }
  var zip_code = null;
  var city = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type === 'street_number') {
        street_number = component.long_name;
      } else if (type === 'route') {
        route = component.long_name;
      } else if (type === 'postal_code') {
        zip_code = component.long_name;
      } else if (type === 'locality') {
        city = component.long_name;
      } else if (type === 'postal_town' && city === null) {
        city = component.long_name;
      } else if (type === 'country') {
        country_code = component.short_name;
      }
    }
  }
  console.log(city);
  console.log(zip_code);
  return {
    zip_code: zip_code,
    city: city,
  };
}

function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var billAddress = document.getElementById('bill_address');

    if (billAddress) {
      var autocomplete = new google.maps.places.Autocomplete(billAddress, { types: [ 'geocode' ] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(billAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
