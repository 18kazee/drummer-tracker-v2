import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  static targets = [ "deleteBtn" ]
  connect() {
    this.currentUserId = document.body.dataset.currentUserId;
    this.deleteBtnTargets.forEach((btn, index) => {
      const commentUserId = btn.closest('[data-comment-user-id]').dataset.commentUserId;

      if (commentUserId == this.currentUserId) {
        btn.style.display = 'inline-block';
      } else {
        btn.style.display = 'none';
      }
    });
  }
}
