import GMaps from 'gmaps/gmaps.js';


const othermapElement = document.getElementById('othermap');
if (othermapElement) { // don't try to build a map if there's no div#map to inject in
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
if (mapElement) { // don't try to build a map if there's no div#map to inject in
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
if (secondMapElement) { // don't try to build a map if there's no div#map to inject in
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
}

const thirdMapElement = document.getElementById('third_map');
if (thirdMapElement) { // don't try to build a map if there's no div#map to inject in
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

import { autocomplete } from '../components/autocomplete';

// [...]
 autocomplete();
