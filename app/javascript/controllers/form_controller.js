import { Controller } from "@hotwired/stimulus"
import {markdown} from 'markdown';

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["button", "input", "tab", "panel", "previewArea", "textarea"]
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
    console.log("Continuing")
    this.renderPreview(); // Render initial preview
  }

  renderPreview() {
    console.log("Markdown")
    const markdownInput = this.textareaTarget.value;
    const renderedHTML = markdown.toHTML(markdownInput);
    console.log(renderedHTML)
    this.previewAreaTarget.innerHTML = renderedHTML;
  }

  switchTab(event) {
    const index = event.currentTarget.dataset.index;
    this.showTab(index);
  }

  showTab(index) {
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
