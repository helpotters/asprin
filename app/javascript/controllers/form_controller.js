import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["button", "input", "tab", "panel"]
  connect() {
    console.log("Connected")
    this.initialize();
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

  initialize() {
    this.showTab(0); // Show the first tab initially
  }

  switchTab(event) {
    const index = event.currentTarget.dataset.index;
    this.showTab(index);
  }

  showTab(index) {
    console.log(this.tabTargets.length)
    console.log(this.tabTargets.length)
    this.tabTargets.forEach((tab, i) => {
      if (i == index) {
        tab.classList.add("bg-white", "text-gray-900");
      } else {
        tab.classList.remove("bg-white", "text-gray-900");
      }
    });

    this.panelTargets.forEach((panel, i) => {
      if (i == index) {
        panel.classList.remove("hidden");
      } else {
        panel.classList.add("hidden");
      }
    });
  }
}
