<template>
  <v-card class="mx-auto" max-width="434" tile>
    <v-card-text v-if="formError" class="error">
      {{ formError }}
    </v-card-text>
    <v-img
      height="100%"
      src="https://cdn.vuetifyjs.com/images/cards/server-room.jpg"
    >
      <v-row align="end" class="fill-height">
        <v-col align-self="start" class="pa-0" cols="12">
          <v-avatar class="profile" color="grey" size="164" tile>
            <v-img
              src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"
            ></v-img>
          </v-avatar>
        </v-col>
        <v-col class="py-0">
          <v-row class="align-center">
            <v-col>
              <v-list-item color="rgba(0, 0, 0, .4)" dark>
                <v-list-item-content>
                  <v-list-item-title class="title"
                    >Marcus Obrien</v-list-item-title
                  >
                  <v-list-item-title>Email</v-list-item-title>
                  <v-list-item-subtitle>Network Engineer</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-col>
            <v-col>
              <v-btn color="yellow" @click="logout">Выйти</v-btn>
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
    formError: null,
    formEmail: '',
    formPassword: ''
  }),
  methods: {
    async logout() {
      try {
        await this.$store.dispatch('/api/logout')
        this.$router.push('/login')
      } catch (e) {
        this.formError = e.message
      }
    }
  }
}
</script>
