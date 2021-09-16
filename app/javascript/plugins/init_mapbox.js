import mapboxgl, { Popup } from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarker = (map, marker) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ marker.lng, marker.lat ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 3000 });
  }
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 9, duration: 3000 });
  };
  
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mikeybarrett/cktkkilkc502a17pf6y3la65z',
    });
    navigator.geolocation.getCurrentPosition(position => {
      new mapboxgl.Marker({
        color: '#F84C4C' // color it red for user location marker
        }).setLngLat([position.coords.longitude, position.coords.latitude]).addTo(map)
    });
    if(mapElement.dataset.marker) {
      const marker = JSON.parse(mapElement.dataset.marker);
        new mapboxgl.Marker()
            .setLngLat([ marker.lng, marker.lat ])
            .addTo(map);
            fitMapToMarker(map, marker);
      };

    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);
          new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });
          fitMapToMarkers(map, markers);
    }

  };

export { initMapbox };
