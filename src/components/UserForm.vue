<template>
  <div id="user-form" class="container">

        <div class="form-group">
            <label>Nombre </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.firstName"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>Apellido </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.lastName"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>Nombre de usuario </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.username"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>contraseña </label>
            <input 
                class="form-control"
                type="password" 
                v-model="user.password"
                value="Doe"
            />
        </div>
        <table class="table" >
        <td><button v-on:click="rest_petition" class="btn btn-primary">Crear con REST</button></td>
        <td><button v-on:click="graphql_petition" class="btn btn-primary">Crear con GraphQL</button></td>
        </table>
  </div>
</template>

<script>
  export default {
    name: 'user-form',
    data() {
      return {
        user: {
            firstName: '',
            lastName: '',
            username: '',
            password: '',
        },
      }
    },
    methods: {
       rest_petition(){
           this.$emit('rest:petition', this.user)
       },
       graphql_petition(){
           this.$emit('graphql:petition', this.user)
       }
    },
  }
</script>

<style scoped></style>