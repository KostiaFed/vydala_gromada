import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sections"
export default class extends Controller {
  book() {
    document.getElementById("book_section").classList.remove("hidden");
    document.getElementById("contacts_section").classList.add("hidden");
    if (document.getElementById("rewards_section")) {
      document.getElementById("rewards_section").classList.add("hidden");
    }

    document.getElementsByClassName("selected-line")[0].classList.remove("hidden")
    document.getElementsByClassName("selected-line")[1].classList.add("hidden")
    document.getElementsByClassName("selected-line")[2].classList.add("hidden")

    document.getElementsByClassName("click-svg")[0].style = "filter: invert(57%) sepia(74%) saturate(451%) hue-rotate(28deg) brightness(85%) contrast(99%);"
    document.getElementsByClassName("click-svg")[1].style = ""
    document.getElementsByClassName("click-svg")[2].style = ""
  }

  rewards() {
    document.getElementById("book_section").classList.add("hidden");
    document.getElementById("contacts_section").classList.add("hidden");
    document.getElementById("rewards_section").classList.remove("hidden");

    document.getElementsByClassName("selected-line")[0].classList.add("hidden")
    document.getElementsByClassName("selected-line")[1].classList.remove("hidden")
    document.getElementsByClassName("selected-line")[2].classList.add("hidden")

    document.getElementsByClassName("click-svg")[1].style = "filter: invert(57%) sepia(74%) saturate(451%) hue-rotate(28deg) brightness(85%) contrast(99%);"
    document.getElementsByClassName("click-svg")[0].style = ""
    document.getElementsByClassName("click-svg")[2].style = ""
  }

  contacts() {
    document.getElementById("book_section").classList.add("hidden");
    document.getElementById("contacts_section").classList.remove("hidden");
    if (document.getElementById("rewards_section")) {
      document.getElementById("rewards_section").classList.add("hidden");
    }

    document.getElementsByClassName("selected-line")[0].classList.add("hidden")
    document.getElementsByClassName("selected-line")[1].classList.add("hidden")
    document.getElementsByClassName("selected-line")[2].classList.remove("hidden")

    document.getElementsByClassName("click-svg")[2].style = "filter: invert(57%) sepia(74%) saturate(451%) hue-rotate(28deg) brightness(85%) contrast(99%);"
    document.getElementsByClassName("click-svg")[1].style = ""
    document.getElementsByClassName("click-svg")[0].style = ""
  }
}
