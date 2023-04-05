<template>
    <div>
        <header class="header-text defaltColorBg" style="margin-bottom: -16px">
            <p class="py-2 text-white">Earnings</p>
        </header>

        <main class="main-bg-absulate">



            <table border="1" width="100%" style="    width: 90%;
    margin: 39px auto;
    position: relative;">

                <thead>
                    <tr>
                        <th style="border: 1px solid;">Daily Income</th>
                        <th style="border: 1px solid;">Estimated Income</th>
                        <th style="border: 1px solid;">Investment Price</th>
                        <th style="border: 1px solid;">Income</th>
                        <th style="border: 1px solid;">Valid</th>
                    </tr>
                </thead>

                <tbody>
                    <tr v-for="(list,index) in lists" :key="index">
                        <td  style="border: 1px solid;">৳{{ list.dailyearn }}</td>
                        <td  style="border: 1px solid;">৳{{ list.estimatedEarn }}</td>
                        <td  style="border: 1px solid;">৳{{ list.deposit }}</td>
                        <td  style="border: 1px solid;">৳{{ list.totalEarn }}</td>
                        <td  style="border: 1px solid;">{{ list.endDate }}</td>
                    </tr>

                </tbody>
                <tfoot>
                    <td colspan="6" style="text-align: center; border: 1px solid;">
                        <span>৳{{ earndata.user.receiveable }}</span><br>
                        <button class="btn fw-bold mb-4 mt-2 rounded-0 text-white defaltColorBg" @click="orderSubmit">Collect</button>
                    </td>
                </tfoot>

            </table>

        </main>

        <Preload :Isactive="isActive" />
        <Message :Isactive="Messageactive" :Message="Message" />
    </div>
</template>

<script>
export default {
    data() {
        return {
            isActive: true,
            Messageactive: false,
            Message: "",
            earndata: {user:{eceiveable:0}},
            form: {},
            lists: {},
        };
    },
    methods: {
        notifiy(mess) {
            this.Messageactive = true;
            this.Message = mess;
            setTimeout(() => {
                this.Messageactive = false;
            }, 1000);
        },

        async getData(trx_type = "increase") {
            this.trxType = trx_type;
            this.isActive = true;
            var id = localStorage.getItem("userid");

            this.isActive = false;
        },

        async getdata() {
            var id = localStorage.getItem("userid");

            var res = await this.callApi("get", `/api/admin/user/${id}`, []);
            this.earndata = res.data;

            var res1 = await this.callApi(
                "get",
                `/api/get/earning/history?id=${id}&trx_type=increase&remark=task_comisition`,
                []
            );
            this.lists = res1.data;

            this.isActive = false;
        },

        async orderSubmit() {
            this.isActive = true;
            this.form["user_id"] = this.row.user.id;
            var res = await this.callApi("post", `/api/admin/task`, this.form);
            if (res.data == 444) {
                this.notifiy(`Already Received`);
            } else {
                this.notifiy("Received Completed");
            }
            this.getdata();
        },
    },
    mounted() {
        this.getdata();
    },
};
</script>

<style scoped>

.cotent {
    margin-bottom: 12px;
    background-color: #fff;
    box-shadow: 0 1px 2px #ccc;
    padding: 10px;
}
.cotent .on {
    text-align: center;
    background-color: #0036ca;
    width: 120px;
    height: 22px;
    line-height: 22px;
    position: absolute;
    z-index: 10;
    right: 10px;
    font-size: 12px;
    color: #fff;
    float: right;
}
.cotent .th {
    display: flex;
    font-size: 12px;
    color: #b3b7bc;
    flex-wrap: nowrap;
    overflow: hidden;
    justify-content: space-between;
}

.cotent .one {
    width: 100%;
    height: 200px;
    margin-bottom: 20px;
}

.cotent .to {
    display: flex;
    font-size: 15px;
    color: #333;
    font-weight: 700;
    justify-content: space-between;
}
.cotent .last {
    margin-top: 20px;
    background-color: #f1f1f1;
    text-align: center;
    width: 100%;
    font-size: 12px;
    font-family: PingFang SC;
    padding: 10px 0;
    color: #333;
    line-height: 28px;
    justify-content: space-between;
    box-sizing: border-box;
}
.cotent .last .three {
    color: #b3b7bc;
}
.uni-image {
    width: 320px;
    height: 240px;
    display: inline-block;
    overflow: hidden;
    position: relative;
}

</style>
