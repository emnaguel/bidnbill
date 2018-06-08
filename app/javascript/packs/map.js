import GMaps from 'gmaps/gmaps.js';


const othermapElement = document.getElementById('othermap');
if (othermapElement) {
  const map = new GMaps({ el: '#othermap', lat: 0, lng: 0 });
  const markers = JSON.parse(othermapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

const mapElement = document.getElementById('map');
if (mapElement) {
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

const secondMapElement = document.getElementById('second_map');
if (secondMapElement) {
  const map = new GMaps({ el: '#second_map', lat: 0, lng: 0 });
  const markers = JSON.parse(secondMapElement.dataset.markers);
  map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  // $('#nav-second-a a').on('show.bs.tab', function (e) {
   document.querySelector('#nav-second-a').addEventListener("click", (event) => {
    console.log("hello")
    window.setTimeout(function () {
      console.log(event);
      if (markers.length === 0) {
        map.setZoom(2);
      } else if (markers.length === 1) {
        map.setCenter(markers[0].lat, markers[0].lng);
        map.setZoom(14);
      } else {
        map.fitLatLngBounds(markers);
      }

    }, 150);
  });
}

const thirdMapElement = document.getElementById('third_map');
if (thirdMapElement) {
  const map = new GMaps({ el: '#third_map', lat: 0, lng: 0 });
  const markers = JSON.parse(thirdMapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
