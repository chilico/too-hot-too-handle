import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log("loaded")

    this.map = new mapboxgl.Map({
      container: this.element,
      // style: "mapbox://styles/chilico/cl4e9q3sj002g14qs4jbgvhb8"
      style: "mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  // #addMarkersToMap() {
  //   new mapboxgl.Marker()
  //     .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
  //     .addTo(this.map)
  // }

  #addMarkersToMap() {
    const popup = new mapboxgl.Popup().setHTML(this.markersValue.info_window)

    // Create a HTML element for your custom marker
    const customMarker = document.createElement("div")
    customMarker.className = "marker"
    customMarker.style.backgroundImage = `url('${this.markersValue.image_url}')`
    customMarker.style.backgroundSize = "contain"
    customMarker.style.width = "50px"
    customMarker.style.height = "50px"

    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(customMarker)
      .setLngLat([this.markersValue.lng, this.markersValue.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
