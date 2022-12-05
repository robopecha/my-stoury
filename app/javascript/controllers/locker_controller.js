import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="locker"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }

  switch(event) {
    event.currentTarget.classList.toggle("fa-lock")
    event.currentTarget.classList.toggle("fa-lock-open")
    const url = `${window.location.origin}/tours/${event.currentTarget.dataset.id}/lock`
    fetch(url, {
      method: "GET",
      headers: {headers: {"Accept": "text/plain"}},
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
