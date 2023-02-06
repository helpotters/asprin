import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["button", "input"]
  connect() {
  }
  submit(e){
    e.preventDefault
    this.buttonTarget.click();
    this.inputTarget.clear
  }
  clear(event){
    console.log(event)
    if(event.detail.success == true){
      console.log("success")
      this.textareaTarget.reset
    }
  }
}
