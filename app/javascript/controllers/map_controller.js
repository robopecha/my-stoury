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
      // document.getElementById("site_name").value =
      //   e.result.place_name.split(" ")[0];
      document.getElementById("site_address").value = geoInput.value;
      document.getElementById("site_longitude").value = e.result.center[0];
      document.getElementById("site_latitude").value = e.result.center[1];
      console.log(e.result);
    });

    this.#addMarkersToMap(map);
    this.#fitMapToMarkers(map);
    this.#openInfoWindow(map);

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

      const customMarker = document.createElement("div");
      customMarker.className = "marker";
      customMarker.style.backgroundImage = `url('https://cdn-icons-png.flaticon.com/512/169/169471.png')`;
      customMarker.style.backgroundSize = "contain";
      customMarker.style.width = "25px";
      customMarker.style.height = "25px";

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // Add this
        .addTo(map);

      // newMarker.getElement().dataset.markerId = marker.id;
      // // Put a microphone on the new marker listening for a mouseenter event
      // newMarker
      //   .getElement()
      //   .addEventListener("mouseenter", (e) => this.#toggleCardHighlighting(e));
      // // We put a microphone on listening for a mouseleave event
      // newMarker
      //   .getElement()
      //   .addEventListener("mouseleave", (e) => this.#toggleCardHighlighting(e));
    });
  }

  #openInfoWindow(map) {
    // Select all cards
    console.log(map);
    const cards = document.querySelectorAll(".site-card");
    cards.forEach((card, index) => {
      // Put a microphone on each card listening for a mouseenter event
      card.addEventListener("mouseenter", () => {
        // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
        map._markers[index].togglePopup();
      });
      // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
      card.addEventListener("mouseleave", () => {
        map._markers[index].togglePopup();
      });
    });
  }

  #toggleCardHighlighting(event) {
    // We select the card corresponding to the marker's id
    const card = document.querySelector(
      `[data-site-id="${event.currentTarget.dataset.markerId}"]`
    );
    // Then we toggle the class "highlight github" to the card
    card.classList.toggle("highlight");
  }
}
