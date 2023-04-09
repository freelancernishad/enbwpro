<template>
    <div>



        <main class="background" style="padding: 0 15px !important;">
<!--
        <h2 class="title">Invite friends</h2>
        <p class="one">invite friends to join and earn rewards</p> -->

        <!-- <button class="ivite-btn border-0">invitation rules</button> -->




        <div class="boxs">
            <div class="b-title">
                <span>invitation process</span>
            </div>
            <div class="d-flex justify-content-between muen px-3 my-2">
                <div class="m-item text-center">
                    <div class=""> <i class="icon fa-solid fa-link"></i></div>
                    <div class="m-item-text">
                        <span>Share the link with your friends</span>
                    </div>
                </div>
                <div class="m-item text-center">
                    <div class=""> <i class="icon fa-solid fa-link"></i></div>
                    <div class="m-item-text">
                        <span>Registraion success</span>
                    </div>
                </div>
                <div class="m-item text-center">
                    <div class=""> <i class="icon fa-solid fa-link"></i></div>
                    <div class="m-item-text">
                        <span>Earn Rewards</span>
                    </div>
                </div>



            </div>
            <div class="m-btn copyBtn" style="cursor: pointer;" :data-clipboard-text="ref">Click to copy the link to invite friends</div>
        </div>


        <div class="boxs mt-4">
            <div class="b-title">
                <span>Detailed description</span>
            </div>

            <p class="detailed-description my-3">
                You will get a bonus of Rs.5 20 successful referrals.
 <br>
                Your friend will get 10% bonus if they deposit.
            </p>
            <!-- <div class="mt-4 text-center">
                <a class="text-decoration-none " href="#">Invitation Reward Details >></a>
            </div> -->
        </div>



    </main>







    <Message :Isactive="Messageactive" :Message="Message"/>
    </div>
</template>

<script>
import ClipboardJS from 'clipboard';
export default {
    created(){

        const clipboard = new ClipboardJS('.copyBtn');
        clipboard.on('success', (e)=> {
                  this.notifiy('Refer link copied success')
        });
        clipboard.on('error', (e)=> {
            this.notifiy('Failed to copy to clipboard!');
        });
    },
    data() {
        return {
            ref: '',
            Messageactive:false,
            Message:'',
            rows:{}
        }
    },
    methods: {
        notifiy(mess){
            this.Messageactive = true
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false
            }, 1000);
        },
        copyref() {
                navigator.clipboard.writeText(this.ref);
                this.notifiy('Refer link copied success')
            },
            async getData() {
             var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.ref = window.location.origin+'/register?ref='+res.data.user.username
            this.rows = res.data;

        },

    },
    mounted() {

        this.getData();
    },
}
</script>
