<template>
    <div id = "user-data" class="container">
        {{request}} nombre:{{firstName}},apellido:{{lastName}},nombre de usuario:{{username}} 
    </div>
</template>

<script>
export default {
    name:'graphql',
    props:['request','firstName,lastName,username,password']
}

</script>

<style scoped></style>