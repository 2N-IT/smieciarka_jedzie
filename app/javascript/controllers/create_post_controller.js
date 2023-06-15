import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="create-post"
export default class extends Controller {
    static targets = ["form"]

    connect() {
        // on submit console log sth
        this.formTarget.addEventListener("submit", (event) => {
            document.getElementById('post_image_input_container').classList.add('hidden')
            document.getElementById('form_skeleton').classList.remove('hidden')
        })
    }
}
