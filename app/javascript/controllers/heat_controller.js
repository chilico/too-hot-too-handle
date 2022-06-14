import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="heat"
export default class extends Controller {
  static targets = ["mild", "medium", "hot", "extreme", "text"]
  connect() {
    console.log("Hello from heat")
  }

  mouseOverMild() {
    this.mildTarget.classList.add("chilli-mild-heat")
    this.textTarget.innerText = "Mild"
  }

  mouseOutMild() {
    this.mildTarget.classList.remove("chilli-mild-heat")
    this.textTarget.innerText = "No heat"
  }

  mouseOverMedium(){
    this.mildTarget.classList.add("chilli-mild-heat")
    this.mediumTarget.classList.add("chilli-medium-heat")
    this.textTarget.innerText = "Medium"
  }

  mouseOutMedium() {
    this.mildTarget.classList.remove("chilli-mild-heat")
    this.mediumTarget.classList.remove("chilli-medium-heat")
    this.textTarget.innerText = "No heat"
  }

  mouseOverHot(){
    this.mildTarget.classList.add("chilli-mild-heat")
    this.mediumTarget.classList.add("chilli-medium-heat")
    this.hotTarget.classList.add("chilli-hot-heat")
    this.textTarget.innerText = "Hot"
  }

  mouseOutHot() {
    this.mildTarget.classList.remove("chilli-mild-heat")
    this.mediumTarget.classList.remove("chilli-medium-heat")
    this.hotTarget.classList.remove("chilli-hot-heat")
    this.textTarget.innerText = "No heat"
  }

  mouseOverExtreme(){
    this.mildTarget.classList.add("chilli-mild-heat")
    this.mediumTarget.classList.add("chilli-medium-heat")
    this.hotTarget.classList.add("chilli-hot-heat")
    this.extremeTarget.classList.add("chilli-extreme-heat")
    this.textTarget.innerText = "Extreme"
  }

  mouseOutExtreme() {
    this.mildTarget.classList.remove("chilli-mild-heat")
    this.mediumTarget.classList.remove("chilli-medium-heat")
    this.hotTarget.classList.remove("chilli-hot-heat")
    this.extremeTarget.classList.remove("chilli-extreme-heat")
    this.textTarget.innerText = "No heat"
  }
}
