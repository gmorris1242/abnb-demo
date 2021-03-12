// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import Hosts from 'packs/components/hosts.vue'
import Host from 'packs/components/host.vue'
import Listings from 'packs/components/listings.vue'
import Listing from 'packs/components/listing.vue'
import CalendarMonth from "packs/components/CalendarMonth.vue";

Vue.use(TurbolinksAdapter)

Vue.component('app', App)
Vue.component('hosts', Hosts)
Vue.component('host', Host)
Vue.component('listings', Listings)
Vue.component('listing', Listing)
Vue.component('calendar-month', CalendarMonth)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]'
  })
})