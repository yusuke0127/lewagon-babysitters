import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "startTime", "endTime", "totalPrice"]

  calculate(event) {
    const duration = (new Date(this.endTimeTarget.value) - new Date(this.startTimeTarget.value) ) /1000 / 60 / 60
    const pricePerHour = this.totalPriceTarget.dataset.pricePerHour
    this.totalPriceTarget.innerText = "¥" + duration * pricePerHour

  }
}
