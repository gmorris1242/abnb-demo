<template>
  <div class='row' id="listings">
    <div class="column">
      <table>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>City</th>
          <th>Price</th>
        </tr>
        <tr v-for="(listing, index) in JSON.parse(listings)">
          <td>{{index + 1}}</td>
          <td>
            <a v-bind:href="'/listings/' + listing['id']" class='primary-color underline'>{{listing['name']}}</a>
          </td>
          <td>{{listing['localized_city']}}</td>
          <td>${{listing['nightly_price_as_guest']}}</td>
        </tr>
      </table>
    </div>
  </div>
</template>


<script>
export default {
  props: ['listings'],
}
</script>

<style scoped>

</style>
