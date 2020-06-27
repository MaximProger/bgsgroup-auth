<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-toolbar-title>Форма регистрации</v-toolbar-title>
        </v-toolbar>
        <v-card-text>
          <v-form>
            <v-text-field
              v-model="name"
              label="Имя"
              name="login"
              type="text"
            ></v-text-field>

            <v-text-field
              label="Email"
              name="email"
              type="email"
              v-model="email"
            ></v-text-field>

            <v-text-field
              label="Должность"
              name="profession"
              type="text"
              v-model="profession"
            ></v-text-field>

            <v-text-field
              id="password"
              label="Пароль"
              name="password"
              type="password"
              v-model="password"
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary">Регистрация</v-btn>
        </v-card-actions>
        <v-card-text>
          Уже зарегистрированы? <nuxt-link to="/login">Войти</nuxt-link>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data: () => ({
    name: '',
    email: '',
    profession: '',
    password: ''
  }),
  methods: {
    register() {
      const data = {
        name: this.name,
        email: this.email,
        profession: this.profession,
        password: this.password
      }
      this.$store
        .dispatch('register', data)
        .then(() => this.$router.push('/profile'))
        .catch(err => console.log(err))
    }
  }
}
</script>

<style lang="scss" scoped></style>
