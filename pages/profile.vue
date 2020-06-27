<template>
  <v-card class="mx-auto" max-width="434" tile>
      <v-row align="end" class="fill-height red lighten-1">
        <v-card-text v-if="formError" class="error white--text">
      {{ formError }}
    </v-card-text>
        <v-col align-self="start" class="pa-0" cols="12">
          <v-avatar class="profile" color="grey" size="164" tile>
            <v-img
              :src="require('../assets/profile.jpg')"
            ></v-img>
          </v-avatar>
        </v-col>
        <v-col class="py-0">
          <v-row class="align-center">
            <v-col>
              <v-list-item color="rgba(0, 0, 0, .4)" dark>
                <v-list-item-content>
                  <v-list-item-title class="title"
                    >{{authUser.name}}</v-list-item-title
                  >
                  <v-list-item-title>
                    {{authUser.email}}
                    </v-list-item-title>
                  <v-list-item-subtitle>{{authUser.profession}}</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-col>
            <v-col>
              <v-btn color="white" @click="logout">Выйти</v-btn>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-img>
  </v-card>
</template>

<script>

export default {
  middleware: 'auth',
  data: () => ({
    formError: null
  }),
  computed: {
    authUser() {
      return this.$store.state.authUser
    }
  },
  methods: {
    async logout() {
      try {
        await this.$store.dispatch('logout')
        await this.$router.push('/')
      } catch (e) {
        this.formError = e.message
      }
    }
  }
}
</script>
