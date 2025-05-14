import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  submit(event) {
    event.preventDefault()

    const amountInput = this.formTarget.querySelector("input[name='amount']")
    const amount = parseFloat(amountInput.value)

    if (isNaN(amount) || amount <= 0) {
      alert("Будь ласка, введіть суму більше нуля.")
      return
    }

    const formData = new FormData(this.formTarget)

    fetch(this.formTarget.action, {
      method: "POST",
      body: formData
    })
      .then((res) => {
        if (!res.ok) throw new Error("Помилка сервера")
        return res.json()
      })
      .then((data) => {
        const form = document.createElement("form")
        form.action = data.url
        form.method = "POST"

        for (const key in data.params) {
          const input = document.createElement("input")
          input.type = "hidden"
          input.name = key
          input.value = data.params[key]
          form.appendChild(input)
        }

        document.body.appendChild(form)
        form.submit()
      })
      .catch((error) => {
        console.error(error)
        alert("Виникла помилка при надсиланні платежу.")
      })
  }
}
