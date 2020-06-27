<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-toolbar-title>Форма входа</v-toolbar-title>
        </v-toolbar>
        <v-card-text v-if="formError" class="error">
          {{ formError }}
        </v-card-text>
        <v-card-text>
          <v-form @submit.prevent="login">
            <v-text-field
              label="Email"
              name="email"
              type="email"
              v-model="formEmail"
            ></v-text-field>

            <v-text-field
              id="password"
              label="Пароль"
              name="password"
              type="password"
              v-model="formPassword"
            ></v-text-field>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" type="submit">Войти</v-btn>
            </v-card-actions>
          </v-form>
        </v-card-text>
        <v-card-text>
          Еще не зарегистрированы? <nuxt-link to="/">Регистрация</nuxt-link>
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
      formPassword: ''
    }
  },
  methods: {
    async login() {
      try {
        await this.$store.dispatch('login', {
          email: this.formEmail,
          password: this.formPassword
        })
        this.formEmail = ''
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

<style lang="scss" scoped></style>
