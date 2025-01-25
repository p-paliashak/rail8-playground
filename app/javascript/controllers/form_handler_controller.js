import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-handler"
export default class extends Controller {
  connect() {
    console.log("Stimulus form handler connected!");
  }

  resetForm() {
    this.element.reset();
  }
}

