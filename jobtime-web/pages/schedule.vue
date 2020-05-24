<template>
  <v-container>
  <v-row>
    <v-col cols="10">
      <v-data-table
        :headers="headers"
        :items="timecards"
      >
      </v-data-table>

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
      // axiosで取得するデータの入れ物
      timecards: [],
      headers: [
        {
          text: '日付',
          value: this.$dayjs().locale('ja').format('MM月DD日 dddd'),
          soatable: false
        },
        {
          text: '出勤',
          value: 'in_at',
          soatable: false
        },
        {
          text: '退勤',
          value: 'out_at',
          soatable: false
        },
        {
          text: '休憩',
          value: 'breaktime',
          soatable: false
        },
        {
          text: '勤務時間',
          value: 'working_hours',
          soatable: false
        }
      ]
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
  }
}
</script>

<style>
</style>