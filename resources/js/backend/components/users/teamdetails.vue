<template>
    <div>


        <section id="topbar">
            <div class="title">
                       <a href="javascript:void(0)" @click="$router.go(-1)" ><i class="fa fa-angle-left"></i></a>
                <p>{{ $t('Team_Report.value') }}</p>
                <LanguageComponent/>
            </div>
        </section>

        <section id="listmenus">
            <div class="details">
                <div class="container">
                    <div class="detail">
                        <p>{{ $t('Total_of_Recharge.value') }}</p>
                        <span>{{ row.depositamount }}</span>
                    </div>
                    <div class="detail">
                        <p>{{ $t('Direct_Invites.value') }}</p>
                        <span>{{ row.Direct_Invites }}</span>
                    </div>
                    <div class="detail">
                        <p>{{ $t('Members.value') }}</p>
                        <span>{{ row.total_member }}</span>
                    </div>
                    <div class="detail">
                        <p>{{ $t('Active_Members.value') }}</p>
                        <span>{{ row.total_ActiveMember }}</span>
                    </div>
                    <div class="detail">
                        <p> {{ $t('Team_task_bonus.value') }} </p>
                        <span>{{ parseFloat(row.refer_task_bonus).toFixed(2)  }}</span>
                    </div>
                    <div class="detail">
                        <p> {{ $t('Team_Recharge_Bonus.value') }} </p>
                        <span>{{ parseFloat(row.refer_commisition).toFixed(2)  }}</span>
                    </div>

                </div>
            </div>
        </section>




    </div>
</template>
<script>
export default {
    data(){
        return {
            row:{},
        }
    },
    methods: {
         async getData(){
            var id = localStorage.getItem('userid');
            var res = await this.callApi('get',`/api/front/teamdetails?id=${id}`,[]);
            this.row = res.data;
        },
    },
    mounted() {
            this.getData();

    },
}
</script>
