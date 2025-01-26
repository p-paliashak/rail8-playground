import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove();
    }, 5000)
  }

  close() {
    this.element.remove()
  }
}
