<template>
<div>

    <form action="/logout" name="logout" method="post">

    </form>
    <Preload :Isactive="isActive"/>
    <Message :Isactive="Messageactive" :Message="Message"/>
</div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            isActive:true,
            PackPurchase:false,
            Messageactive:false,
            Message:'',
        }
    },

	created(){
        User.loggedOut();
        this.isActive = false
        this.notifiyGlobal('Logout successfully Complete');
    axios.post('/logout').then(()=>{
    window.location.href = '/'
})
	}
}
</script>

<style lang="css" scoped>
</style>
