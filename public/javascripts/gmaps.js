function load() {
 if (GBrowserIsCompatible()) {
  lat = document.getElementById('latitude').innerHTML
  lat  = parseFloat(lat);
  lng = document.getElementById('longitude').innerHTML
  lng  = parseFloat(lng);
  info = document.getElementById('info');
  info.style.display = 'none'
  info = document.getElementById('info').innerHTML;
  document.getElementById('warning').style.display = 'none'
 
  map_div = document.getElementById("map");
  map_div.style.width = '600px';
  map_div.style.height = '400px';
  var map = new GMap2(map_div);
  map.setCenter(new GLatLng(lat, lng), 11);
  map.addControl(new GSmallMapControl());
		
  var marker = new GMarker(map.getCenter());
  map.openInfoWindowHtml(marker.getLatLng(), info);
		
  GEvent.addListener(marker, 'click',  function() {
   map.openInfoWindowHtml(marker.getLatLng(), info);
  })
   
  map.addOverlay(marker);
 }
}
	
window.onload = function() { load() }
window.onunload = function() { GUnload() }