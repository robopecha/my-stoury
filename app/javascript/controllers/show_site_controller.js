import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-site"
export default class extends Controller {
  static targets = ["site"]

  connect() {
    console.log("show-site controller is connected")
  }

  switch(event) {
    console.log(event.currentTarget.dataset.siteId)
    const url = `/sites/${event.currentTarget.dataset.siteId}`
    console.log(this.siteTarget.innerHTML === "")
    if (this.siteTarget.innerHTML === "") {
      fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.siteTarget.innerHTML = data
      })
    }
    else {
      fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        if (this.siteTarget.innerHTML === data)
          {this.siteTarget.innerHTML = ""}
        else {
          this.siteTarget.innerHTML = data
        }

      })
    }
  }
}
