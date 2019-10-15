<template>
  <div id="user-form" class="container">

        <div class="form-group">
            <label>first name </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.firstName"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>last name </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.lastName"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>user name </label>
            <input 
                class="form-control"
                type="text" 
                v-model="user.username"
                value="Doe"
            />
        </div>
        <div class="form-group">
            <label>password </label>
            <input 
                class="form-control"
                type="password" 
                v-model="user.password"
                value="Doe"
            />
        </div>
        <button v-on:click="rest_petition" class="btn btn-primary">Crear con REST</button>
        <button v-on:click="graphql_petition" class="btn btn-primary">Crear con GraphQL</button>
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
           console.log("rest_petition")
       },
       graphql_petition(){
           this.$emit('graphql:petition', this.user)
           console.log("graphql_petition")
       }
    },
  }
</script>

<style scoped></style>