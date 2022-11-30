import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    markers: Array,
  };

  connect() {
    // mapboxgl.accessToken = this.apiKeyValue;
    mapboxgl.accessToken =
      "pk.eyJ1IjoibW1rcnR5IiwiYSI6ImNsYWF5aHhvbjA5NGEzcHFycXcwYmZlbmQifQ.8pNcwiBefjJDe0_UAJ62AA";
    console.log("hello");

    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v10",
      center: [0, 0],
      zoom: 0.4,
    });

    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
    });

    document.getElementById("geocoder").appendChild(geocoder.onAdd(map));
    geocoder.on("result", function (e) {
      let geoInput = document.querySelector(".mapboxgl-ctrl-geocoder--input");
      console.log(geoInput);
      document.getElementById("site_name").value = e.result.place_name;
      document.getElementById("site_address").value = geoInput.value;
      document.getElementById("site_longitude").value = e.result.center[0];
      document.getElementById("site_latitude").value = e.result.center[1];
      console.log(e.result);
    });

    this.#addMarkersToMap(map);
    this.#fitMapToMarkers(map);

    // this.map.addControl(
    //   new MapboxGeocoder({
    //     accessToken: mapboxgl.accessToken,
    //     mapboxgl: mapboxgl,
    //   })
    // );
  }

  // #addMarkersToMap(map) {
  //   this.markersValue.forEach((marker) => {
  //     new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
  //   });
  // }

  #fitMapToMarkers(map) {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #addMarkersToMap(map) {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // Add this
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // Add this
        .addTo(map);
    });
  }
}
