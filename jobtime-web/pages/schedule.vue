<template>
  <v-container>
  <v-row>
    <v-col>
      <h2>{{ yearmonth }}</h2>
      <table>
        <tbody>
          <tr>
            <th>日付</th>
            <th>出勤</th>
            <th>退勤</th>
            <th>休憩（分）</th>
            <th>勤務時間（時間）</th>
          </tr>
          <tr v-for="timecard in timecards" :key="timecard.id">
            <td>{{ timecard.created_at | toMonth }} 月 {{ timecard.created_at | toDate }} 日</td>
            <td>{{ timecard.in_at | toHour }}：{{ timecard.in_at | toMinute }}</td>
            <td v-if="timecard.out_at">{{ timecard.out_at | toHour }}：{{ timecard.in_at | toMinute }}</td>
            <td v-else></td>
            <td>{{ timecard.breaktime }}</td>
            <td v-if="timecard.working_hours">{{ (timecard.working_hours / 3600) | toFixed }}</td>
            <td v-else></td>
          </tr>
        </tbody>
      </table>
    </v-col>
    </v-row>
</v-container>
</template>
  
<script>
import firebase from '@/plugins/firebase'
import axios from '@/plugins/axios'

export default{
  data(){
    return{
      yearmonth: this.$dayjs().locale('ja').format('YYYY MMM'),
      // axiosで取得するデータの入れ物
      timecards: []
    }
  },
  methods: {
  },
  // mountedでVueインスタンスのDOM作成完了直後に読み込み
  mounted(){
    // getリクエストでjsonデータを取得
    axios.get('/v1/timecards/schedule.json', {
      params: {
        id: this.$store.state.currentUser.id
      }
    })
    // dataで用意したデータの入れ物timecards[]に取得したデータを突っ込む
    .then(response => (this.timecards = response.data))
  },
  filters: {
    toMonth(val){
      var date = new Date(val);
      return date.getMonth() + 1;
    },
    toDate(val){
      var date = new Date(val)
      return date.getDate();
    },
    toHour(val){
      var date = new Date(val);
      return date.getHours();
    },
    toMinute(val){
      var date = new Date(val);
      return date.getMinutes();
    },
    toFixed(val){
      return val.toFixed(1);
    }
  }
}
</script>

<style scoped>
th{
  width: 20%;
}
td{
  width: 20%;
  text-align: center;
}
table{
  margin-top: 20px;
  width: 100%;
  border-collapse: collapse;
}

table th, table td {
  border: solid 1px #ffffff;
}
</style>