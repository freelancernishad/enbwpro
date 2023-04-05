<template>
    <div>

        <main>
            <div class="border mx-4 pt-3 rounded bg-white mb-4" v-for="packag in packages" :key="packag.id">
                <div class="d-flex justify-content-between mx-4 align-items-center">
                    <div class="d-flex gap-3 align-items-center">
                        <img src="http://resource.ppppssss.com/crmebimage/public/user/2022/12/08/1ceb15e79a77401cbc84189a44658d4ap4ec1ax9ig.png" alt="" style="width: 27px;">

                        <div class="">
                                <!-- <img src="http://m.ppppssss.com/static/hrzt/vip/vip1.png" alt="" style="width: 55px;"> -->
                                <p style="  color: #7d91a1; font-size: 13px;margin-top: 7px;">{{ packag.packageId }}</p>
                        </div>
                    </div>
                    <button type="button" class="btn btn-success" @click="upgrade(packag)">Upgrade</button>
                   </div>
                   <hr style="width: 95%;
                   margin: auto;">
                   <div class="d-flex justify-content-between mx-4 fw-bold">

                    <div>
                        <p class="mb-2 text-body-secondary">Price</p>
                        <p>{{ packag.packagePrice }} bdt</p>
                    </div>

                    <div>
                        <p class="mb-2 text-body-secondary">Duration</p>
                        <p>{{ packag.packageDuration }} Days</p>
                    </div>

                    <div>
                        <p class="mb-2 text-body-secondary">Earn</p>
                        <p>{{ packag.packageEarn }} bdt</p>
                    </div>
                 </div>
            </div>

        </main>


    </div>
</template>


<script>
export default {
    data(){
        return {

            packages:{},
        }
    },
    methods: {
        async getPackages(){
            var res = await this.callApi('get',`/api/get/packages`,[]);
            this.packages = res.data
        },
        async upgrade(packag){

            var userid = localStorage.getItem('userid');

            Swal.fire({
                title: 'Are you sure?',
                text: "You Purchase this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Purchase it!'
            }).then(async (result) => {
            if (result.isConfirmed) {
                var res = await this.callApi('post',`/api/package/upgrade/${userid}`,packag)
// console.log(res.data)
                if(res.data==1){

                    Swal.fire(
                    'Success!',
                    'Purchase Successfully completed',
                    'success'
                    )
                }else if(res.data==44){
                    Swal.fire(
                    "Opps!",
                    "You don't have enough balance",
                    "error"
                    )
                }

            }
            })







        }
// 01988720908
    },
    mounted() {
        this.getPackages();




    },
}
</script>

