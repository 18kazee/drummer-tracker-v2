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

  submitForm(event) {
    const form = this.element;
    form.addEventListener("turbo:submit-end", () => {
      // フォームの内容をリセット
      this.commentFormTarget.value = "";  // 各フィールドを個別にリセット

      // ボタンを無効にする
      this.submitTarget.setAttribute("disabled", "disabled");
    });
  }

  get commentFormTarget() {
    return this.targets.find("commentForm");
  }

}
