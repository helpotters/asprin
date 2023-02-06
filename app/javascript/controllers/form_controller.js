import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log("connected")
  }
  submit(){
    console.log("test")
    this.buttonTarget.click();
  }
}
