<template>
    <div>
        <loader v-if="proloader" object="#ff9633" color1="#ffffff" color2="#17fd3d" size="5" speed="2" bg="#343a40" objectbg="#999793" opacity="80" name="circular"></loader>
        <div class="breadcrumbs-area">
            <h3>SMS</h3>
            <ul>
                <li>
                    <router-link :to="{ name: 'Dashboard' }">Home</router-link>
                </li>
                <li>SMS</li>
            </ul>
        </div>
        <form  @submit.stop.prevent="sentSms">

            <div class="form-group">
                <label for="">Sms Body</label>
                <textarea v-model="message" style="border: 1px solid black;height: 100px;resize: none;" class="form-control"></textarea>
            </div>


            <button type="submit" class="btn btn-info">Sent Sms </button>




        </form>



    </div>
</template>

<script>
export default {
    data() {
        return {
            message:'',
            proloader:false,
        }
    },
    methods: {
        async sentSms(){
            this.proloader = true
            var res = await this.callApi('post',`/api/sent/notice/sms?message=${this.message}`,[]);
            if(res.status==200){
                this.proloader = false
                Notification.customSuccess(`Success`);
                this.$router.push({name:'Dashboard'});

            }
        }
    },
}
</script>
