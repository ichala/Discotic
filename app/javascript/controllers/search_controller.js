import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form","SearchBar"];
  timeout = null;

  submit_query() {
    if (this.formTarget.query.value.length > 1) {
      clearTimeout(this.timeout);
      this.debounce(() => this.formTarget.requestSubmit());
    }
   
  }

  debounce(callback) {
    //Add a delay to the search query
    this.timeout = setTimeout(callback, 400);
  }

}
