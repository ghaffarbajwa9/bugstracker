import { Application } from "@hotwired/stimulus"

const application = Application.start()
//= require nested_selects

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
