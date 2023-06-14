import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="create-post"
export default class extends Controller {
    static targets = ["form"]

    connect() {
        // on submit console log sth
        this.formTarget.addEventListener("submit", (event) => {
            console.log("submitting form")
            // LOADING SPINNER
        })
    }
}
