// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// require("utilities/sorting.js")
// import 'bootstrap/dist/js/bootstrap'
// import 'bootstrap/dist/css/bootstrap'
// require("stylesheets/application.scss")
import "bootstrap"
import "../stylesheets/application"
import "utilities/sorting"
import "utilities/password"
import "utilities/form_inline"
import "utilities/progress_bar"
import "utilities/timer"


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
require.context('../images', true)
