import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  static targets = ["submitBtn", "tweetField", "drummerField", "drummerHiddenField"];

  connect() {
    this.validateForm();
  }
  
  validateForm() {
      if (this.tweetFieldTarget.value && this.drummerFieldTarget.value) {
          this.submitBtnTarget.removeAttribute("disabled");
      } else {
          this.submitBtnTarget.setAttribute("disabled", "disabled");
      }
  }


  submitForm(event) {
    const form = this.element;
    form.addEventListener("turbo:submit-end", () => {
      // フォームの内容をリセット
      this.tweetFieldTarget.value = "";  // 各フィールドを個別にリセット
      this.drummerFieldTarget.value = "";
      this.drummerHiddenFieldTarget.value = "";

      // ボタンを無効にする
      this.submitBtnTarget.setAttribute("disabled", "disabled");
    });
  }

  get tweetFieldTarget() {
    return this.targets.find("tweetField");
  }

  get drummerFieldTarget() {
    return this.targets.find("drummerField");
  }

  get drummerHiddenFieldTarget() {
    return this.targets.find("drummerHiddenField");
  }
}
