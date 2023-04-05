<template>
    <div>
 <!-- <loader v-if="preLooding" object="#ff9633" color1="#ffffff" color2="#17fd3d" size="5" speed="2" bg="#343a40" objectbg="#999793" opacity="80" name="circular"></loader> -->

<div class="breadcrumbs-area">
    <h3>Category List</h3>
    <ul>
        <li>
            <router-link :to="{name:'Dashboard'}">Home</router-link>
        </li>
        <li>Category List</li>
    </ul>
</div>




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

            preLooding:false,
            access:'',
            sortstatus:false,
            Filter:true,
            addNew:'categoryform',
            FilterOn:false,
            PerPage:false,
            deleteRoute:'/api/get/category/delete',
            editRoute:'categoryedit',
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
                { key: 'name', label: 'নাম', sortable: true },
                { key: 'slug', label: 'Slug', sortable: true },
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


        sonodname(){
            this.preLooding = true
              axios.get(`/api/get/category/list`)
                .then(({ data }) => {
                  this.items = data
                  this.TotalRows = `${this.items.length}`;
                  this.preLooding = false
                })
                .catch()
        },

    },
    mounted() {

        this.sonodname();


    }


}
</script>
