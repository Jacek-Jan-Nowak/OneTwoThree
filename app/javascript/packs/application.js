// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("particles.js")
require("vanilla-tilt")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  particlesJS('particles-js', 'particlesjs-config.json');
  // Call your functions here, e.g:
  // initSelect2();
});

particlesJS('particles-js', 'particlesjs-config.json');

VanillaTilt.init(document.querySelector(".home-card"),{
  reverse: false,
  max: 10,
  easing: "cubic-bezier(.03,.98,.52,.99)",
  scale: 1.2,
  speed: 100,
  transition: true,
  axis: null,
  glare: true,
  "max-glare": 0.2,
  "glare-prerender": false,
  "mouse-event-element": null,
  reset: true
});
