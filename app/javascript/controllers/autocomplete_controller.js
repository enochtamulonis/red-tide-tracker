import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="autocomplete"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    const options = {
      fields: ["formatted_address", "geometry", "name"],
      strictBounds: false,
      types: ["establishment"],
    };
    const autocomplete = new google.maps.places.Autocomplete(
      this.inputTarget,
      options
    );
  }
}
