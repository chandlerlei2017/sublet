function showMap(address) {
  var geocoder = new google.maps.Geocoder();

  geocoder.geocode({'address': address}, function(results, status) {
    if (status === 'OK') {
      var newMap = new google.maps.Map(document.getElementById('map'), {
        zoom: 15
      });
      newMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: newMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
