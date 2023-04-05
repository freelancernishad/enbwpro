<template>
    <div>
        <section id="orderpage">
            <div class="container-fluid">
                <h2></h2>
            </div>
        </section>
        <section id="topbar">
            <div class="title">
                <p>Orders</p>
                <LanguageComponent />
                <router-link :to="{name:'orders'}"><img :src="$asseturl + 'frontend/img/tasks.png'" alt="logo">
                </router-link>
            </div>
        </section>
        <section>
            <div class="row">
                <div class="col-md-12">
                    <youtube :video-id="videoId" ref="youtube" @playing="playVideo" width="100%" height="100%"
                        @paused="pauseVideo('menual')"></youtube>
                    <h3> Stay on This Tab: {{ time }} second</h3>
                    <!-- <button @click="playVideo">play</button>
                    <button @click="pauseVideo">pauseVideo</button>
                    <button @click="stopVideo">Stop</button> -->
                </div>
            </div>
        </section>
    </div>
</template>
<script>
export default {
    created() {
        this.getData();
        this.videoId = this.$route.params.id;
        document.addEventListener('visibilitychange', (event) => {
            if (document.hidden) {
                if (this.playStatus == 'Play') Notification.customError(`You can't leave this tab.You must stay on this tab untill task end.`);
                this.pauseVideo()
            } else {
                // console.log('is visible');
            }
        });
    },
    data() {
        return {
            videoId: 'lG0Ys-2d4MA',
            fitParent: true,
            receive: false,
            orderpage: false,
            time: 60,
            playStatus: 'Pause',
            setIntervalFun: null,
            settings: {},
            row: {
                user: {},
            },
            form: {
                task_comisition: 0
            },
            products: [
                // 'mainproduct.jpeg',
                '1.jpeg',
                '2.jpeg',
                '3.jpeg',
                '4.jpeg',
                '5.jpeg',
                '6.jpeg',
                '7.jpeg',
                '8.jpeg',
                '9.jpeg',
                '10.jpeg',
                '11.jpeg',
            ],
            taskProduct: '',
        }
    },
    computed: {
        player() {
            return this.$refs.youtube.player
        }
    },
    methods: {
        playVideo() {
            this.playStatus = 'Play'
            this.time = this.settings.worktime
            this.recievefun()
            this.setIntervalFun = setInterval(() => {
                this.taskDuration()
            }, 1000);
            //   this.player.playVideo()
        },
        pauseVideo(action = "") {
            this.time = this.settings.worktime
            if (action == 'menual') Notification.customError(`You must complete ${this.time} second video`);
            this.playStatus = 'Pause';
            this.player.stopVideo()
            clearInterval(this.setIntervalFun);
            // this.taskDuration()
        },
        taskDuration() {
            if (this.playStatus == 'Play') {
                this.time--;
                if (this.time <= 0) {
                    this.pauseVideo()
                    this.orderSubmit()
                }
            } else if (this.playStatus == 'Pause') {
                this.time = this.settings.worktime
            }
            // console.log(this.time)
        },
        recievefun() {
            if (Number(this.row.user.task) < 1) {
                Notification.customError(`You Can't Complete any order Today`);
                this.pauseVideo()
            } else {
                setTimeout(() => {
                    var task_comisition = ((this.row.user.balance * this.row.plans.comission_rate) / 100);
                    this.form.task_comisition = parseFloat(task_comisition).toFixed(2)
                }, 3000);
            }
        },
        async getData() {
            var resN = await this.callApi('get', `/api/admin/setting`, [])
            this.settings = resN.data
            this.time = resN.data.worktime
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get', `/api/admin/user/${id}`, []);
            this.row = res.data;
        },
        async orderSubmit() {
            this.form['user_id'] = this.row.user.id;
            var res = await this.callApi('post', `/api/admin/task`, this.form);
            if (res.data == 444) {
                Notification.customError(`You Can't Complete any order Today`);
            } else {
                Notification.customSuccess('Task Completed');
            }
            this.$router.push({ name: 'Usertask' })
        }
    },
}
</script>
<style>
button.OrderReceive {
    border: 0;
    background: linear-gradient(90deg, #9b057a, #00c56a);
    color: white;
    display: block;
    width: 100%;
    font-size: 22px;
    padding: 8px 5px;
    margin: 16px 0px;
}
.orderamount {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    border: 2px solid #478fa5;
    background: #000000b8;
    font-size: 25px;
    padding: 11px 15px;
}
</style>
