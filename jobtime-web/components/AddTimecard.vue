<template>
  <v-form>
    <v-container>
      <v-row>
        <div class="now_time">
          <h1>{{ now }}</h1>
        </div>
        <v-col cols="12" md="4">
          <v-btn @click="handleJobin" :disabled="jobin_pushed">出勤</v-btn>
          <v-btn @click="handleJobout" :disabled="jobout_pushed">退勤</v-btn>
        </v-col>
      </v-row>
      <p>{{ error }}</p>
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
  }
}
</script>

<style scoped>
.now_time{
  width: 100vw;
  font-size: 20px;
  margin: 20px 20px;
}
.col-md-4{
  display: flex;
  justify-content: center;
}
.v-btn{
  height: 80px !important;
  width: 150px;
  font-size: 20px;
  font-weight: 600;
  margin-right: 40px;
}
</style>