<template>
    <div>
 <!-- <loader v-if="preLooding" object="#ff9633" color1="#ffffff" color2="#17fd3d" size="5" speed="2" bg="#343a40" objectbg="#999793" opacity="80" name="circular"></loader> -->

<div class="breadcrumbs-area">
    <h3>Packages List</h3>
    <ul>
        <li>
            <router-link :to="{name:'Dashboard'}">Home</router-link>
        </li>
        <li>Packages List</li>
    </ul>
</div>



        <!-- <button class="btn btn-info" v-if="reseting">Reseting.....</button>
        <button class="btn btn-info" @click="restAllPost" v-else>Reset All Post</button> -->


        <div class="card">
        <div class="card-body">
<table-component :sonod-type="$route.params.name" :sort-options-staus="sortstatus" :Filter="Filter" :filter-on="FilterOn"  :per-page="PerPage" :Items="items" :Fields="fields" :per-page-data="PerPageData" :total-rows="TotalRows"  :delete-route="deleteRoute" :edit-route="editRoute" :application-route="applicationRoute"  :view-route="viewRoute"    :approve-route="approveRoute" :pay-route="payRoute" :cancel-route="cancelRoute"   :approve-type="approveType" :approve-data="approveData" :add-new="addNew"  @event-name="sonodname" >

</table-component>

<!-- <approve-component></approve-component> -->

    </div>

            </div>
        </div>
</template>

<script>

export default {

     computed: {



    },
    created() {


    },
    data() {
        return {

            reseting:false,
            preLooding:false,
            access:'',
            sortstatus:false,
            Filter:true,
            addNew:'packageform',
            FilterOn:[],

            PerPage:false,
            deleteRoute:'',
            editRoute:'packagesdit',
            applicationRoute:'',
            viewRoute:'',
            approveRoute:'',
            cancelRoute:'',
            approveType:'',
            approveData:'',
            payRoute:'',
            PerPageData:'10',
            TotalRows:'1',
            Type:'',
            items: [],
            fields: [
                { key: 'name', label: 'Name', sortable: true },
                { key: 'packagePrice', label: 'Price', sortable: true },
                { key: 'packageEarn', label: 'Daily Earn', sortable: true },
                { key: 'packageDuration', label: 'Duration', sortable: true },
                { key: 'actions', label: 'Actions' }
            ],


        }
    },
    // updated(){

    //  this.sonodList();

    // },

  watch: {
        '$route':  {
            handler(newValue, oldValue) {

        // hello


      },
      deep: true



        }
    },

    methods: {


       async sonodname(){
            this.preLooding = true
            var res = await this.callApi('get',`/api/get/packages/list`,[])


                  this.items = res.data
                  this.TotalRows = `${this.items.length}`;
                  this.preLooding = false


        },


       async restAllPost(){

           this.reseting = true
            var res = await this.callApi('get',`/api/reset/blog`,[]);
            console.log(res)
           this.reseting = false
           this.sonodname();
            Notification.customSuccess(`Blog Reset Successfuly Complete`);
        }


    },
    mounted() {

        this.sonodname();


    }


}
</script>
