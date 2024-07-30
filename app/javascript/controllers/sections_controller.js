import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sections"
export default class extends Controller {
  book() {
    document.getElementById("book_section").classList.remove("hidden");
    document.getElementById("contacts_section").classList.add("hidden");
    if (document.getElementById("rewards_section")) {
      document.getElementById("rewards_section").classList.add("hidden");
    }
  }

  rewards() {
    document.getElementById("book_section").classList.add("hidden");
    document.getElementById("contacts_section").classList.add("hidden");
    document.getElementById("rewards_section").classList.remove("hidden");
  }

  contacts() {
    document.getElementById("book_section").classList.add("hidden");
    document.getElementById("contacts_section").classList.remove("hidden");
    if (document.getElementById("rewards_section")) {
      document.getElementById("rewards_section").classList.add("hidden");
    }
  }
}
