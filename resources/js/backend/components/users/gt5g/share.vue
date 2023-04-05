<template>
    <div>

        <header class="header-text" style="background-color: var(--defaltColor);margin-bottom: -16px;">
        <p class="py-2 text-white"> Share </p>
    </header>

    <main class="main-bg-absulate">

        <div class="bg-white mx-4 px-4 text-center shadow-lg lh-1">
          <div>

            <p class="mb-0 pt-2">My Invitation Code</p>
                <p class="fs-5 fw-bold mb-2">{{ row.user.username }}</p>
             <button class="copyBtn btn fw-bold mb-4 mt-2 rounded-0 text-white w-100" :data-clipboard-text="ref"  style="background-color: var(--defaltColor);">Copy Link</button>
             <!-- <button class="copyBtn btn fw-bold mb-4 mt-2 rounded-0 text-white w-100"  @click="copyref" style="background-color: var(--defaltColor);">Copy Link</button> -->
             <!-- <button class="copyBtn" data-clipboard-text="Copy me!">Copy</button> -->


            </div>
          <div style="background-color: #f1f1f1;" class="mb-3 py-3">
            <p>My QR code</p>
            <img :src="'https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl='+ref+'&choe=UTF-8'" class="img-thumbnail w-75" :alt='ref'/>
          </div>
          <p class="pb-5 px-5 py-2">The app provides an exclusive link and an exclusive QR code, send it to your friends, and you will get a 10% rebate.</p>
        </div>
        <div class="bg-white mx-4 px-4  shadow-lg lh-1 mb-5">
            <p class="border-bottom  py-2 topp text-center">Invite friends to register, each reward ৳5, total reward ৳100.</p>

            <div class="d-flex">
                <div class="w-75">
                    <p class="fw-bold m-0 py-2">Invitation to sign up bonus</p>
                    <p class="fw-bold m-0 py-2 defaltColor">Mission Rewards5.00</p>
                </div>
                <div class="w-25 text-end">
                    <button class="btn fw-bold  rounded-0 text-white " style="background-color: var(--defaltColor);"> <span v-if="row.user.refercount>20">Finished</span> <span v-else>Unfinished</span></button>
                    <p class="m-0 me-3 defaltColor py-2">{{ row.refercount }} / 20</p>
                </div>
            </div>
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
