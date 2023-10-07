import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-form"
export default class extends Controller {
  static targets = [ "commentForm", "submit" ]
  connect() {
    this.validateForm();
  }

  validateForm() {
    if (this.commentFormTarget.value) {
     this.submitTarget.removeAttribute("disabled");
    } else {
      this.submitTarget.setAttribute("disabled", "disabled");
    }
  }
}
