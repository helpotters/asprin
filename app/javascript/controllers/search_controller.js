import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="suggestions"
export default class extends Controller {
  static targets = ["suggestions", "input"]
  connect() {
  }

  suggestions(){
    const query = this.inputTarget.value;
    const url = this.element.dataset.suggestionsUrl;

    clearTimeout(this.timeout);
    this.timeOut = setTimeout(() => {
      this.requestSuggestions(query, url);
    }, 250); // checks every 250ms
  }
  requestSuggestions(query, url) {
    if (query.length === 0 ){
      this.hideSuggestions();
      return;
    }
    this.showSuggestions();
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({query: query}),
    }).then(response => {
      response.text().then((html) => {
        document.body.insertAdjacentHTML("beforeend", html);
      })
    })
  }

  showSuggestions(){
    this.suggestionsTarget.classList.remove("hidden");
  }
  hideSuggestions(){
    this.suggestionsTarget.classList.add("hidden");
  }

}
