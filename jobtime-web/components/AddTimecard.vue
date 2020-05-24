<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col cols="12" md=4>
          <h1>{{ now }}</h1>
        </v-col>
        <v-col cols="12" md="4">
          <v-btn @click="handleJobin" :disabled="jobin_pushed">出勤</v-btn>
          <v-btn @click="handleJobout" :disabled="jobout_pushed">退勤</v-btn>
          <p>{{ error }}</p>
        </v-col>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
import firebase from "@/plugins/firebase"
import axios from '@/plugins/axios'

export default {
  data(){
    return {
      now: '',
      jobin_pushed: false,
      jobout_pushed: false,
      error: ''
    }
  },
  mounted(){
    this.now = this.$dayjs().locale('ja').format('LLLL')
  },
  methods: {
    handleJobin(){
      const timecard = {
        user_id: this.$store.state.currentUser.id
      };
      axios.post("/v1/timecards/jobin", { timecard })
      this.jobin_pushed = true
      this.error = "出勤済みです"
    },
    handleJobout(){
      const timecard = {
        user_id: this.$store.state.currentUser.id
      };
      axios.put("/v1/timecards/jobout", { timecard })
      this.jobout_pushed = true
      this.error = "退勤済みです"
    }
  },
  wathch: {
  }
}
</script>

<style scoped>
</style>