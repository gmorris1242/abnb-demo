<template>
  <div class='row' id="listing">
    <div class="column lg-4">
      <div class="text-center lg-text-left mb-2">
        <img v-bind:src="JSON.parse(listing)['picture_url']" alt="">
      </div>
    </div>
    <div class="column lg-8">
      <h2 class='mb-hr'>{{JSON.parse(listing)['name']}}</h2>
      <h3 class='mb-hr'>{{JSON.parse(listing)['localized_city']}}</h3>
      <h3 class='mb-hr'>${{JSON.parse(listing)['nightly_price_as_guest']}}</h3>
    </div>
  </div>
</template>

<script>
export default {
  props: ['listing'],
}
</script>

<style scoped>

</style>
