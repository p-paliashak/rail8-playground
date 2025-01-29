import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { delay: Number };
  timeout = null;

  submit() {
    clearTimeout(this.timeout);
    const form = this.element.querySelector("form");
    if (!form) return; // Safeguard in case the form is not found

    this.timeout = setTimeout(() => {
      form.requestSubmit(); // Submit the form after the delay
    }, this.delayValue || 300); // Default delay is 300ms
  }

  showSpinner() {
    document.getElementById("loading-spinner").classList.remove("hidden");
  }

  hideSpinner() {
    setTimeout(() => {
      document.getElementById("loading-spinner").classList.add("hidden");
    }, 500);
  }
}
