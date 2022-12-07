import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tour-view"
export default class extends Controller {
  static targets = ["sites", "siteBtn", "siteForm", "siteFormBtn"];

  connect() {
    console.log("connected to tour view controller");
  }

  siteToggleHide() {
    this.sitesTarget.classList.toggle("hide");
    this.siteBtnTarget.classList.toggle("red");
  }

  siteFormToggleHide() {
    console.log("toggled yeh");
    this.siteFormTarget.classList.toggle("hide");
    this.siteFormBtnDisplay();
  }

  siteFormShow() {
    this.siteFormTarget.classList.remove("hide");
    this.siteFormBtnDisplay();
  }

  siteFormBtnDisplay() {
    if (this.siteFormTarget.classList.contains("hide")) {
      this.siteFormBtnTarget.innerHTML = `<i class="fa-solid fa-angle-down"></i>`;
    } else {
      this.siteFormBtnTarget.innerHTML = `<i class="fa-solid fa-angle-up"></i>`;
    }
  }
}
