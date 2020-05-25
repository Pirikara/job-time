<template>
  <div v-if="user">
    <p class="user_name">Welcome {{ user.name }}</p>
    <AddTimecard @submit="addTimecard" />
  </div>
</template>

<script>
import AddTimecard from "@/components/AddTimecard";

export default {
  components: {
    AddTimecard,
  },
  computed: {
  user(){
    // storeにある状態をコンポーネント内で引き出す
    return this.$store.state.currentUser
      }
  },
  data(){
    return {
      timecards: []
    }
  },
  methods: {
    addTimecard(data){
      this.timecards.push({
        data
      })
    }
  },
  fetch({ store, redirect }){
    // storewatchでstoreのcurrentUserと言うキーを監視
    store.watch(
      state => state.currenrUser,
      (newUser, oldUser) => {
        if(!newUser) {
          return redirect("/login")
        }
      }
    )
  }
};
</script>

<style scoped>
.user_name{
  font-size: 20px;
  margin-top: 30px;
}
</style>