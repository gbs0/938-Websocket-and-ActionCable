import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="chatroom"
export default class extends Controller {
  static values = {id: Number}
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.idValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(this.channel);
    console.log(`Subscribe to the ID ${this.idValue}`)
  }

  resetForm(event) {
    event.target.reset()
  }

}
