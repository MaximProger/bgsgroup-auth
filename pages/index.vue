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
              v-model.trim="formName"
              :error-messages="nameErrors"
              @input="$v.formName.$touch()"
              @blur="$v.formName.$touch()"
              color="red lighten-1"
              required
            ></v-text-field>

            <v-text-field
              label="Email"
              name="email"
              type="email"
              v-model.trim="formEmail"
              color="red lighten-1"
              required
            ></v-text-field>

            <v-text-field
              label="Профессия"
              name="profession"
              type="text"
              v-model.trim="formProfession"
              :error-messages="professionErrors"
              @input="$v.formProfession.$touch()"
              @blur="$v.formProfession.$touch()"
              color="red lighten-1"
              required
            ></v-text-field>

            <v-text-field
              id="password"
              label="Пароль"
              name="password"
              type="password"
              v-model.trim="formPassword"
              color="red lighten-1"
              required
            ></v-text-field>

            <v-text-field
              id="avatar"
              label="Аватар"
              name="avatar"
              ref="file"
              type="file"
              v-model="formAvatar"
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
import { validationMixin } from 'vuelidate'
import { required } from 'vuelidate/lib/validators'
export default {
  data: () => ({
    formError: null,
    formEmail: '',
    formName: '',
    formProfession: '',
    formPassword: '',
    formAvatar: ''
  }),
  mixins: [validationMixin],
  validations: {
    formName: { required },
    formProfession: { required }
  },
  computed: {
    nameErrors() {
      const errors = []
      if (!this.$v.formName.$dirty) return errors
      !this.$v.formName.required && errors.push('Введите имя')
      return errors
    },
    professionErrors() {
      const errors = []
      if (!this.$v.formProfession.$dirty) return errors
      !this.$v.formProfession.required &&
        errors.push('Поле "Профессия" не должно быть пустым')
      return errors
    }
  },
  methods: {
    async login() {
      if (this.$v.$invalid) {
        this.$v.$touch()
        return
      }

      try {
        await this.$store.dispatch('login', {
          name: this.formName,
          email: this.formEmail,
          profession: this.formProfession,
          password: this.formPassword,
          avatar: this.formAvatar
        })
        this.$v.$reset()
        this.formName = ''
        this.formEmail = ''
        this.formProfession = ''
        this.formPassword = ''
        this.formAvatar = ''
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
