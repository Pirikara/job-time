<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col cols="12" md=4>
          <h1>{{ now }}</h1>
        </v-col>
        <v-col cols="12" md="4">
          <v-btn @click="handleJobin">出勤</v-btn>
          <v-btn @click="handleJobout">退勤</v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
export default {
  data(){
    return {
      now: '',
    }
  },
  mounted(){
    this.now = this.$dayjs().locale('ja').format('LLLL')
  },
  methods: {
    handleJobin(){
      this.$emit("submit", this.now);
      console.log(this.now)
    },
    handleJobout(){
      this.$emit("submit", this.now)
      console.log(this.now)
    }
  },
  wathch: {

  }
}
</script>

<style scoped>

</style>