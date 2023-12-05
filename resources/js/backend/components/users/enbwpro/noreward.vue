<template>
    <div>
        <header class="header-text mb-5 defaltColorBg" style="margin-bottom: -16px !important;">
        <p class="py-2 text-white">  </p>
    </header>
    <main class="mb-5 pb-5">
        <div>

            <!-- <p class="px-3">
                When you sign up for the APP, you will get ৳100 signup bonus per account. At the same time, you can
                complete the daily sign-in reward, and you can claim it again after 7 days. Through the app, you can
                invest in products of different values, each with a different investment amount and a different daily
                return. You can have multiple products and different products at the same time. The more advanced the
                product, the higher the profit.</p>
            <p class="px-3">
                Please refer to the figure below for details:
            </p> -->


            <div class="bg-gd p-3  text-white">
                <p class="fs-4 fw-bold text-center">Afex 247 Investment Program
                </p>
                <div class="bg-gdd p-3 rounded-1">
                    <table style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Equipment</th>
                                <th>Price</th>
                                <th>Every Day</th>
                                <th>Per Month</th>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr  v-for="packag in packages" :key="'package'+packag.id">
                                <td>{{ packag.name }}</td>
                                <td>{{ packag.packagePrice }}</td>
                                <td>{{ packag.packageEarn }}</td>
                                <td>{{ packag.packageEarn*30 }}</td>
                                <td>{{ packag.packageEarn*packag.packageDuration }}</td>

                            </tr>


                        </tbody>
                    </table>
                </div>
                <!-- <p class="font-monospace lh-1 lh-sm mb-0 mb-2 pb-0 px-3 py-3">When your 1 team members invest, you will directly earn 10% of their return on investment.
If your Tier 1 member earns $100 per day, you will get 6% of 100 per day. If your tier 2 members earn 100 per day, you will get 3% of 100 per day.
If your TA 3 members earn 100 per day, you get 2% of 100 per day. to it. If your team has 10 members or 100 members, this will be a gender-term.</p> -->
            </div>

        </div>
        <div class="mt-5">

            <!-- <p class="mt-3 px-3">

                An exclusive link and an exclusive QR code will be provided in the app, and you can send your own
                exclusive link or exclusive QR code to anyone. Invite friends to register and join GT-5G, and get ৳5
                immediately, which will be automatically added to your wallet balance. The more invites, the more
                rewards. Rewards are capped at ৳100. When your Tier 1 team members invest, you will directly receive 10%
                of their investment back. You can also earn an extra daily commission every day (8% of your daily
                earnings for level 1 members, 3% for level 2 members, 1% for level 3 members). If your Tier 1 member
                earns ৳100 per day, you will get 8% of ৳100 per day. If your level 2 member earns ৳100 per day, you will
                get 3% of ৳100 per day. If your level 3 member earns ৳100 per day, you get 1% of 100 per day. etc. This
                is a long term benefit if your team has 10 members or ৳100 members..</p>
            <p class="px-3">
                See the Sales Incentive Chart below:</p> -->

                <div class="bg-gd p-3  text-white">
                    <p class="fs-4 fw-bold text-center">Afex 247 Team Commission Program
                    </p>
                    <div class="bg-gdd p-3 rounded-1">
                        <table style="width: 100%;">
                            <thead>
                                <tr>
                                    <th>Device Name</th>
                                    <th>price </th>
                                    <th>percentage </th>
                                    <th>money</th>
                                    <th>Team</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr  v-for="packag in packages" :key="'teamProfit'+packag.id">
                                <td>{{ packag.name }}</td>
                                <td>{{ packag.packagePrice }}</td>
                                <td>{{ levels[0].comission }}</td>
                                <td>{{ (packag.packagePrice*levels[0].comission)/100 }}</td>
                                <td>{{ levels[0].task_commisition }}%  {{ levels[1].task_commisition }}%  {{ levels[2].task_commisition }}%</td>

                            </tr>






                            </tbody>
                        </table>
                    </div>
                    <!-- <p class="font-monospace lh-1 lh-sm mb-0 mb-2 pb-0 px-3 py-3">
                        When your Tier 1 team members invest, you will directly
                        earn 10% of their return on investment. If your Tier 1
                        member earns $100 per day, you will get 8% of 100 per
                        day. If your tier 2 members earn 100 per day, you will
                        get 3% of 100 per day. If your tier 3 member earns 100
                        per day, you get 1% of 100 per day. etc. If your team has
                        10 members or 100 members, this will be a longer-term benifit</p> -->
                </div>

        </div>
        <!-- <div class="px-3">

            <p class="mt-3">When your Team 1/2/3 team members invest, you will directly earn 10% 4% 2% return on their investment.</p>
            <p class="mt-3">If your Team 1 member earns $100 per day, you will receive 6% of the 100 per day.</p>
            <p class="mt-3">If your Team 2 member earns $100 per day, you will receive 3% of the 100 per day.</p>
            <p class="mt-3">If your Team 3 member earns $100 per day, you will receive 2% of the 100 per day. etc</p>
            <p>If you have 100/500/1000 member investment in your team, it will be a long term benefit for you to get bonus from the company. thank you</p>



        </div> -->

    </main>


    </div>
</template>

<script>
export default {
    data(){
        return {
            levels:{},
            packages:{},
        }
    },
    methods: {
        async getPackages(){
            var res = await this.callApi('get',`/api/get/packages`,[]);
            this.packages = res.data

            var resLevels = await this.callApi('get', `/api/admin/level`, []);
                this.levels = resLevels.data


        },
    },
    mounted() {
        this.getPackages();
    },
}
</script>

<style scoped>

.bg-gd {
    background: var(--defaltColor);
    /* background: linear-gradient(90deg, rgb(175 74 0) 0%, rgb(168 69 134) 45%, rgb(194 171 9) 100%); */
}

th {
    border: 1px solid white;
    font-size: 14px;
    text-align: center;
    padding: 3px;
    color: black;
}
td {

    border: 1px solid white;
    background: var(--defaltColor);
    text-align: center;
    font-size: 10px;
}

thead {
    background: #6B5CA1;
}
.bg-gdd {
    background: rgb(219 255 19);
    /* background: linear-gradient(180deg, #fff113 0%, rgb(36 205 102) 45%, rgb(255 183 138) 100%); */

}
</style>
