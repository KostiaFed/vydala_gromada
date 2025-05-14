import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  openDialogByID(event) {
    document.getElementById(event.params.id).showModal();
  }

  closeDialogByID(event) {
    document.getElementById(event.params.id).close();
  }
}
