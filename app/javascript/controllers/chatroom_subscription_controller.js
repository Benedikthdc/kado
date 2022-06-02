import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { projectId: Number }
  static targets = ["messages"]

  connect() {
      this.channel = consumer.subscriptions.create(
        { channel: "ProjectChannel", id: this.projectIdValue },
        {received: data => this.#insertMessageAndScrollDown(data) }
      )
    console.log(`Subscribe to the chatroom with the id ${this.projectIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    console.log("message received");
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
