<template>
  <div class="container">
    <el-empty description=" " class="item"/>
    <div class="container item">
      <div class="not-found-text">
        404
      </div>
      <div class="not-found-text">
        Page Not Found
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "404"
}
</script>

<style scoped>

.container {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
}

.item {
  flex: 0 0 auto;
}

.not-found-text {
  font-weight: lighter;
  font-size: 40px;
}

</style>