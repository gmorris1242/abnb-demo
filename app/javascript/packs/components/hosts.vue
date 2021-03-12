<template>
  <div class='row' id="hosts">
    <div class="column lg-6" v-for="host in JSON.parse(hosts)">
      <div class="host mb-1">
        <div class="flex ai-center jc-center lg-jc-space-between flex-wrap">
          <div class="img-wrapper">
            <img v-bind:src="host['thumbnail_url']" alt="">
          </div>
          <div class="details mx-1">
            <h2>{{host['first_name']}}</h2>
            <p>{{host['location']}}</p>
          </div>
          <div class="btn-wrapper">
            <a v-bind:href="'hosts/' + host['id']" class='btn'>View Host</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['hosts'],
}
</script>

<style scoped>

</style>
