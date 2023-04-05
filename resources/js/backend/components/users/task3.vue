<template>
    <div class="swiper-container">
    <div class="video-container" style="    width: 320px ;
    margin: 0 auto;">

            <video width="320" height="240" @click="toggoleplay('video')" id="video" :src="tiktokData.price" ref="videoid"   />
             <svg width="512" height="512" viewBox="0 0 512 512" @click="toggoleplay('video')" v-show="!playstatus">
                <path d="M152.443 136.417l207.114 119.573-207.114 119.593z" fill="#fff" />
            </svg>

            <div style="position: absolute;top: calc(48% - 35px);left: calc(83% - 35px);width: 90px;height: 90px;z-index: 10;cursor: pointer;">
                <i v-if="desabled" style="font-size: 44px;" :style="[liked ? {'color': '#2170b3'} : {'color': '#ffffff'}]" class="fas fa-thumbs-up" ></i>
                <i v-else @click="orderSubmit(tiktokData.id)" style="font-size: 44px;" :style="[liked ? {'color': '#2170b3'} : {'color': '#ffffff'}]" class="fas fa-thumbs-up" ></i>
                <br>
                <span style="color: white;font-size: 16px;">{{ totalLiked }}</span>
            </div>

            <div style="position: absolute;top: calc(48% - 35px);left: calc(19% - 35px);width:21px;height: 105px;z-index: 10;cursor: pointer;">
                <!-- <i style="font-size: 44px;color:white" class="fa fa-long-arrow-up"></i> -->
                <!-- <br> -->
                <i @click="nexvideo" style="font-size: 35px;
    color: white;
    margin-top: 14px;
    padding: 16px 16px;
    background: #000000b5;" class="fa fa-long-arrow-down"></i>


                <!-- <i v-if="desabled" style="font-size: 44px;" :style="[liked ? {'color': '#2170b3'} : {'color': '#ffffff'}]" class="fas fa-thumbs-up" ></i>
                <i v-else @click="orderSubmit(tiktokData.id)" style="font-size: 44px;" :style="[liked ? {'color': '#2170b3'} : {'color': '#ffffff'}]" class="fas fa-thumbs-up" ></i> -->


            </div>



    </div>
    </div>
</template>
<script>

export default {
    created() {


        if(User.dateformat()[9]<=23){
            if(User.dateformat()[9]>=10){
                // this.$router.push({ name: 'Authuser' });
            }else{
                alert('কাজের সময় সকাল ১০টা থেকে রাত ১২টা পযর্ন্ত')
                this.$router.push({ name: 'Useraccount' });
            }
        }else{
            alert('কাজের সময় সকাল ১০টা থেকে রাত ১২টা পযর্ন্ত')
            this.$router.push({ name: 'Useraccount' });
        }


    },

    data() {
        return {
            showindicator: false,
            playstatus: false,
            playIndex: 0,
            tiktokData: {},
            receive: false,
            orderpage: false,
            desabled: true,
            liked: true,
            totalLiked: '0',
            random: 0,
            row: {
                user: {},
            },
            form: {
                task_comisition: 0
            },
            taskProduct: '',
        }
    },
    methods: {


        nexvideo(){
            this.getData();

        },


        toggoleplay(id) {
            const video = document.getElementById(id);
            if (this.playstatus) {
                video.pause()
                this.playstatus = false
            } else {
                video.play()
                this.playstatus = true
            }
        },
        playVideo(id) {
            const video = document.getElementById(id);
            video.play()
            this.playstatus = true
        },
        pauseVideo(id) {
            const video = document.getElementById(id);
            video.pause()
            this.playstatus = false
        },

        async getData() {
            var resb = await this.callApi('get', `/api/get/blog/list?type=random`, [])
            this.tiktokData = resb.data
            this.checkvideo(this.tiktokData.id);
            setTimeout(() => {
                this.playVideo('video');
            }, 1000);


        },

        async checkvideo(blog_id) {
            var user_id = localStorage.getItem('userid');

            var res = await this.callApi('get', `/api/admin/task?user_id=${user_id}&blog_id=${blog_id}`, [])

            this.liked = res.data.liked
            if(!this.liked)this.desabled = false
            this.totalLiked = `${res.data.totalLiked}`
            // console.log(res)
            // this.tiktokData = resb.data


        },
        async orderSubmit(blog_id) {
            this.desabled = true
            if(this.liked){
                Notification.customError(`Already liked this video`);
            }else{
            this.form['user_id'] = localStorage.getItem('userid');
            this.form['blog_id'] = blog_id;
            var res = await this.callApi('post', `/api/admin/task`, this.form);
            if (res.data == 444) {
                Notification.customError(`You Can't Complete any order Today`);
            } else {
                Notification.customSuccess('Task Completed');
                this.checkvideo(blog_id);
            }
            }
        }
    },
    mounted() {
        this.getData();
    },
}
</script>
<style scoped>

.tiktok {
    position: relative;
    width: 100%;
    height: 100%;
}
video {
    aspect-ratio: 348/520;
    height: auto;
    position: relative;
    min-width: 300px;
    margin: 0 auto;
}
svg {
    position: absolute;
    top: calc(50% - 35px);
    left: calc(50% - 35px);
    width: 90px;
    height: 90px;
    z-index: 10;
}
</style>
