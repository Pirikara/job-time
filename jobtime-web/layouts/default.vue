<template>
  <v-app dark>
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    >
      <v-toolbar-title v-text="title" />
      <v-spacer />
      <v-btn
        icon
        @click.stop="rightDrawer = !rightDrawer"
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>
    <v-content>
      <v-container>
        <nuxt />
      </v-container>
    </v-content>
    <v-navigation-drawer
      v-model="rightDrawer"
      :right="right"
      temporary
      fixed
    >
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'JOBTIME'
    }
  },
  computed: {
    user(){
      return this.$store.state.currentUser;
    },
    items(){
      if (this.user) {
        return [
          {
            icon: 'mdi-apps',
            title: 'HOME',
            to: '/'
          },
          {
            icon: 'mdi-apps',
            title: '勤務表',
            to: '/schedule'
          },
          {
            icon: 'mdi-chart-bubble',
            title: 'MYPAGE',
            to: '/mypage'
          }
        ];
      } else {
        return [
          {
            icon: "mdi-apps",
            title: "SIGN IN",
            to: "/login"
          },
          {
            icon: "mdi-chart-bubble",
            title: "SIGN UP",
            to: "/signup"
          }
        ]
      }
    }
  }
}
</script>

<style scoped>
.v-toolbar__title{
  font-size: 40px;
  font-weight: 800;
}

.v-list-item__title{
  font-weight: 800;
  font-size: 20px;
}
</style>