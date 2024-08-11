import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-limit"
export default class extends Controller {
  static targets = ["field", "text"];

  update() {
    this.textTarget.innerHTML = `${this.fieldTarget.value.length}/300`
  }
}
