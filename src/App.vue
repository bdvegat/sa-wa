<template>
  <div id="app">
    <UserForm @graphql:petition="createUserGraphql" @rest:petition="createUserRest"/>
    <div v-if="this.typeOfRequest!=' '" id = "user-data" class="container">
        {{typeOfRequest}} id: {{this.createdUser.id}}, nombre: {{this.createdUser.firstName}}, apellido: {{this.createdUser.lastName}}, nombre de usuario: {{this.createdUser.username}} 
    </div>
  </div>
</template>

<script>

import UserForm from './components/UserForm.vue'
import axios from 'axios'
 
export default {
  name: 'app',
  components: {
    UserForm,
  },
  data() {
    return {
      createdUser: {
          firstName: '',
          lastName: '',
          username: '',
          password: '',
        },
        typeOfRequest:' '
      }
    },
  methods: {
    createUserRest(user) {
      axios.post('http://localhost:4000/sa-auth-ms/resources/users',{
        firstName:user.firstName,
        lastName:user.lastName,
        username: user.username,
        password:user.password
        })
          .then(response => {
      // JSON responses are automatically parsed.
              this.createdUser=response.data
              this.typeOfRequest="Usuario creado satisfactoriamente desde Microservicio:"
    }).catch()
    },
    createUserGraphql(user) {
    axios.post('http://localhost:5000/graphql',{query: `mutation {
  createUser(user: {
    firstName: "${user.firstName}"
    lastName: "${user.lastName}"
    username: "${user.username}"
    password: "${user.password}"
  }) {
    id
    firstName
    lastName
    username
  }
}`})
          .then(response => {
      // JSON responses are automatically parsed.
              this.createdUser=response.data.data.createUser
              this.typeOfRequest="Usuario creado satisfactoriamente desde API Gateway:"
    }).catch()
    },
  }
}

</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
