<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="red lighten-1" dark flat>
          <v-toolbar-title>Форма регистрации</v-toolbar-title>
        </v-toolbar>
        <v-card-text v-if="formError" class="error white--text">
          {{ formError }}
        </v-card-text>
        <v-card-text>
          <v-form @submit.prevent="login">
            <v-text-field
              label="Имя"
              name="name"
              type="text"
              v-model="formName"
              color="red lighten-1"
            ></v-text-field>

            <v-text-field
              label="Email"
              name="email"
              type="email"
              v-model="formEmail"
              color="red lighten-1"
            ></v-text-field>

            <v-text-field
              label="Профессия"
              name="profession"
              type="text"
              v-model="formProfession"
              color="red lighten-1"
            ></v-text-field>

            <v-text-field
              id="password"
              label="Пароль"
              name="password"
              type="password"
              v-model="formPassword"
              color="red lighten-1"
            ></v-text-field>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="red lighten-1" class="white--text" type="submit"
                >Войти</v-btn
              >
            </v-card-actions>
          </v-form>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      formError: null,
      formEmail: '',
      formName: '',
      formProfession: '',
      formPassword: ''
    }
  },
  methods: {
    async login() {
      try {
        await this.$store.dispatch('login', {
          name: this.formName,
          email: this.formEmail,
          profession: this.formProfession,
          password: this.formPassword
        })
        this.formName = ''
        this.formEmail = ''
        this.formProfession = ''
        this.formPassword = ''
        this.formError = null
        this.$router.push('/profile')
      } catch (e) {
        this.formError = e.message
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.v-btn__content {
  color: white !important;
}
</style>
