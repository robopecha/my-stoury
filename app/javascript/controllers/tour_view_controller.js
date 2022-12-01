import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tour-view"
export default class extends Controller {
  static targets = ["sites", "siteBtn"];

  connect() {
    console.log("connected to tour view controller");
  }

  siteToggleHide() {
    this.sitesTarget.classList.toggle("hide");
    this.siteBtnTarget.classList.toggle("red");
  }
}
