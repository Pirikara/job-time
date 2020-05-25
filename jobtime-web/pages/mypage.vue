<template>
  <div>
    <div v-if="user">
      <div class="user_information">
        <p>EMAIL...  {{user.email}}</p>
        <p>USER...  {{user.name}}</p>
      </div>
    </div>
    <div class="logout_button">
      <v-btn @click="logOut">LOG OUT</v-btn>
    </div>
  </div>
</template>

<script>
import firebase from "@/plugins/firebase";
export default {
  computed: {
    user() {
      return this.$store.state.currentUser;
    }
  },
  methods: {
    logOut() {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$store.commit("setUser", null);
          this.$router.push("/login");
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
p{
  padding-top: 10px;
  font-size: 20px;
  font-weight: 500;
}
.logout_button{
  width: 100%;
  text-align: center;
}
.v-btn{
  margin-top: 15px;
  height: 80px !important;
  width: 150px;
  font-size: 20px;
  font-weight: 600;
}
.user_information{
  text-align: center;
}
</style>