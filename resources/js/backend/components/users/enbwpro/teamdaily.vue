<template>
    <div>

        <header class="header-text mb-5" style="background-color: var(--defaltColor);margin-bottom: -16px;">
            <p class="py-2 text-white"> Team Details {{ $route.query.level }} </p>
        </header>


        <div class="bigbox">
            <div style="display: flex;">
                <div class="box">
                    <div class="one">Recharge today</div>
                    <div class="three defaltColor">0.00</div>
                    <!-- <div style="margin-top: 5px; font-size: 12px; color: rgb(153, 153, 153); text-align: center;">23/03/19</div> -->
                </div>
                <div class="box" style="margin-left: 10px;">
                    <div class="one">Recharge count</div>
                    <div class="three defaltColor">0</div>
                    <!-- <div style="margin-top: 5px; font-size: 12px; color: rgb(153, 153, 153); text-align: center;">23/03/19</div> -->
                </div>
            </div>
        </div>



        <div v-for="(level1,index) in teams" :key="index" style="display: flex; margin: 10px 15px; line-height: 40px; justify-content: space-around; background: rgb(255, 255, 255); border-top: 1px solid var(--defaltColor); box-shadow: rgb(204, 204, 204) 0px 1px 2px;">
            <div style="display: block;">
                <div style="color: rgb(51, 51, 51); font-size: 14px; font-weight: bold;">{{ level1.mobile.substring(0, 4) }}****{{ level1.mobile.substring(8, 10) }}</div>
                <div style="color: var(--defaltColor);">Team Size:0</div>
            </div>
            <div>
                <div style="display: block; color: rgb(102, 102, 102);">Consumption:</div>
                <div style="color: var(--defaltColor); font-size: 20px;"><p class="m-0"
                    >
                    <span v-if="level1.package_buys_sum_price">{{ parseFloat(level1.package_buys_sum_price).toFixed(2) }}</span>
                    <span v-else>{{ parseFloat(0).toFixed(2) }}</span>
                </p></div>
            </div>
        </div>







        <Preload :Isactive="isActive" />
    </div>
</template>

<script>
export default {
    data() {
        return {
            isActive: true,
            Messageactive: false,
            Message: '',
            team:{},
            levelTeam: {
                level1: {},
                level2: {},
                level3: {},
            },
            teams:{}
        }
    },
    methods: {

        notifiy(mess) {
            this.Messageactive = true
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false
            }, 1000);
        },


        generator() {
            return '#' + (Math.random() * 0xFFFFFF << 0).toString(16);
        },
        async getData() {
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get',`/api/front/teamdetails?id=${id}`,[]);
            this.team = res.data;

            var res = await this.callApi('get', `/api/user/multi/refer?id=${id}`, []);
            this.levelTeam = res.data;

            if(this.$route.query.level=='Level1'){
                this.teams = this.levelTeam.level1

            }else if(this.$route.query.level=='Level2'){
                this.teams = this.levelTeam.level2

            }else if(this.$route.query.level=='Level3'){
                this.teams = this.levelTeam.level3

            }


            this.isActive = false
        },
        copyURL() {
            var Url = this.$refs.mylink;
            Url.innerHTML = window.location.href;
            console.log(Url.innerHTML)
            Url.select();
            document.execCommand("copy");
        }
    },
    mounted() {
        this.getData();
    },
}
</script>

<style scoped>
.bigbox {
    display: flex;
    justify-content: space-around;
}

.bigbox .box {
    padding-top: 13px;
    box-sizing: border-box;
    width: 166px;
    height: 92px;
    background: #fff;
    color: #333;
    box-shadow: 0 1px 2px #ccc;
    margin-top: 12px;
    position: relative;
    border-top: 4px solid var(--defaltColor);
}

.bigbox .box .one {
    height: 15px;
    font-size: 12px;
    font-family: PingFang SC;
    font-weight: 700;
    line-height: 15px;
    text-align: center;
}

.bigbox .box .three {
    margin-top: 10px;
    height: 15px;
    font-size: 15px;
    font-family: PingFang SC;
    font-weight: 700;
    color: #0036ca;
    line-height: 15px;
    text-align: center;
}</style>
