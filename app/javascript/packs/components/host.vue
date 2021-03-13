<template>
  <div class='row' id="host">
    <div class="column lg-4">
      <div class="text-center lg-text-left mb-2">
        <img v-bind:src="JSON.parse(host)['picture_url']" alt="">
      </div>
    </div>
    <div class="column lg-8">
      <h2 class='mb-2'>{{JSON.parse(host)['first_name']}}</h2>
      <h3 class='mb-hr'>About</h3>
      <p class='mb-1'>{{JSON.parse(host)['about']}}</p>
      <div class="text-center lg-text-left">
        <a v-bind:href="'/listings?host_id=' + JSON.parse(host)['id']" class='btn'>View Listings</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['host'],
}
</script>

<style scoped>

</style>
