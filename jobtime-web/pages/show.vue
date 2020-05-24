<template>
  <v-container>
  <v-row>
    <v-col cols="10">
      <v-data-table
        :headers="headers"
        :items="serverDatas"
      >
      </v-data-table>

    </v-col>
    </v-row>
</v-container>
</template>
  
<script>
export default{
  data(){
    return{
      headers: [
        {
          text: '日付',
          value: 'date',
          soatable: false
        },
        {
          text: '出勤',
          value: 'in_time',
          soatable: false
        },
        {
          text: '退勤',
          value: 'out_time',
          soatable: false
        },
        {
          text: '休憩時間',
          value: 'breaktime',
          soatable: false
        },
        {
          text: '勤務時間',
          value: 'worktime',
          soatable: false
        }
      ],
      serverDatas: [

      ]
    }
  },
  methods: {

  },
  mounted(){
  }
}
</script>

<style>
</style>