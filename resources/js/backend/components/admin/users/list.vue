<template>
    <div>
        <loader v-if="proloader" object="#ff9633" color1="#ffffff" color2="#17fd3d" size="5" speed="2" bg="#343a40" objectbg="#999793" opacity="80" name="circular"></loader>

        <div class="breadcrumbs-area">
            <h3>User List</h3>
            <ul>
                <li>
                    <router-link :to="{ name: 'Dashboard' }">Home</router-link>
                </li>
                <li>User List</li>
            </ul>
        </div>
        <div class="card">
            <div class="card-body">

                <div class="form-group">
                    <label for="">Username</label>
                    <input type="text" v-model="filterUser" @input="filterFun">
                </div>

                <div class="form-group">
                    <label for="">Task</label>
                    <input type="text" v-model="filterTask" @input="filterFunTask">
                </div>

<!--
                <div class="form-group">
                    <label for="">Ip Addre</label>
                    <input type="text" v-model="filterTask" @input="filterFunTask">
                </div> -->



                <table class="table">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Phone</th>
                            <!-- <th>Plan</th> -->
                            <!-- <th>Task Available</th> -->
                            <th>Balance</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in items">
                            <td>{{ item.username }}</td>
                            <td>{{ item.mobile }}</td>
                            <!-- <td>{{ item.plans.name }}</td> -->
                            <!-- <td>{{ item.task }}</td> -->
                            <td>{{ item.balance }}</td>
                            <td>{{ item.status }}</td>
                            <td>

                                <router-link size="sm" :to="{ name: viewRoute, params: { id: item.id } }" v-if="viewRoute != ''"
                    class="btn btn-info mr-1 mt-1">
                    View
                </router-link>


                <span size="sm" @click="cancel(cancelRoute, item.id, 'active', $event.target)"
                    v-if="cancelRoute != '' && item.status=='banned'" class="btn btn-success mr-1 mt-1">
                    Active
                </span>


                <span size="sm" @click="cancel(cancelRoute, item.id, 'approved', $event.target)"
                    v-else-if="cancelRoute != '' && item.status=='reject'" class="btn btn-success mr-1 mt-1">
                    Approve
                </span>

                <span size="sm" @click="cancel(cancelRoute, item.id, canceltext, $event.target)"
                    v-else-if="cancelRoute != '' && item.status!='reject'" class="btn btn-danger mr-1 mt-1">
                   {{ canceltext.toUpperCase() }}
                </span>


                            </td>
                        </tr>
                    </tbody>
                </table>


<nav aria-label="Page navigation example">
   <ul class="pagination  justify-content-end">
      <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->

      <li class="page-item" v-for="(pag,index) in Totalpage" :key="'p'+index" v-if="index==0 && pag.url"><router-link class="page-link" :to="{name:'Userslist',params:{status:$route.params.status},query:{page:pag.url.split('?')[1].split('=')[1]}}" v-html="pag.label"></router-link> </li>



      <li class="page-item" v-for="(pag,index) in Totalpage" :key="'i'+index" :class="{active:pag.active,'disabled':pag.label=='...'}" v-if="index!=0 && index!=14"><router-link class="page-link" :to="{name:'Userslist',params:{status:$route.params.status},query:{page:pag.label}}" v-html="pag.label"></router-link></li>



      <li class="page-item" v-for="(pag,index) in Totalpage" :key="'l'+index" v-if="index==14  && pag.url"><router-link class="page-link" :to="{name:'Userslist',params:{status:$route.params.status},query:{page:pag.url.split('?')[1].split('=')[1]}}" v-html="pag.label"></router-link></li>

      <!-- <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
   </ul>
</nav>





<!--
                <table-component :sonod-type="$route.params.name" :sort-options-staus="sortstatus" :Filter="Filter"
                    :filter-on="FilterOn" :per-page="PerPage" :Items="items" :Fields="fields" :add-new="AddNew"
                    :per-page-data="PerPageData" :total-rows="TotalRows" :delete-route="deleteRoute"
                    :edit-route="editRoute" :application-route="applicationRoute" :view-route="viewRoute"
                    :approve-route="approveRoute" :pay-route="payRoute" :cancel-route="cancelRoute" :canceltext="canceltext"
                    :approve-type="approveType" :approve-data="approveData"  :Tableloader="tableloader" @event-name="UserList">
                </table-component> -->
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
        this.fields =  [
                { key: 'username', label: 'Username', sortable: true },
                { key: 'mobile', label: 'Phone', sortable: true },
                { key: 'plans', label: 'Plan', sortable: true,
                formatter: (value, key, item) => {
                       return value.name
                    } },
                { key: 'balance', label: 'Balance', sortable: true },
                { key: 'status', label: 'Status', sortable: true },
            ]
            this.fields.push( { key: 'actions', label: 'Actions' });
    },
    data() {
        return {
            proloader: false,
            preLooding: true,
            access: '',
            sortstatus: false,
            Filter: false,
            FilterOn: ['username','mobile'],
            PerPage: false,
            tableloader: false,
            deleteRoute: '',
            AddNew: '',
            editRoute: '',
            applicationRoute: '/document',
            viewRoute: 'UsersView',
            approveRoute: '',
            cancelRoute: '/api/user',
            canceltext: 'banned',
            approveType: '',
            approveData: '',
            payRoute: '',
            PerPageData: '20',
            TotalRows: '1',
            Totalpage: {},
            Type: '',
            filterUser: '',
            filterTask: '',
            unionsInfos: {
                payment_type:''
            },
            items: [],
            fields: [
                [
                { key: 'username', label: 'Username', sortable: true },
                { key: 'mobile', label: 'Phone', sortable: true },
                { key: 'statuses', label: 'Status' },
                { key: 'actions', label: 'Actions' },
            ]
            ],
        }
    },
    // updated(){
    //  this.sonodList();
    // },
    watch: {
        '$route': {
            handler(newValue, oldValue) {

                if(this.filterUser){

                    this.filterFun();
                }else if(this.filterTask){
                    this.filterFunTask();

                }else{

                    this.UserList();
                }


            },
            deep: true
        }
    },
    methods: {


        filterFun(){
            this.UserList(true,this.filterUser);
        },

        filterFunTask(){
            this.UserList(true,this.filterUser,this.filterTask);
        },

        async UserList(auto = false,username='',task='') {
           if(!auto)this.proloader = true
           var page = 1;
           if(this.$route.query.page)page = this.$route.query.page;

           if(task){
               var res = await this.callApi('get', `/api/admin/user?status=${this.$route.params.status}&username=${username}&task=${task}&page=${page}`, []);

            }else{
               var res = await this.callApi('get', `/api/admin/user?status=${this.$route.params.status}&username=${username}&page=${page}`, []);

           }


                this.Totalpage = res.data.links
                this.items = res.data.data
                console.log(res)









                if(!auto)this.proloader = false



        },


        async cancel(route, id, status, button) {


Swal.fire({
    title: 'Are you sure?',
    text: `${status} this Data!`,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: `Yes, ${status} it!`
}).then(async (result) => {
    if (result.isConfirmed) {
        var res = await this.callApi('get', `${route}/${status}/${id}`, []);
        Notification.customSuccess(`Your data has been ${status} Success`);
        this.$emit('event-name')
    }
})

},

    },
    mounted() {




        this.UserList();

    }
}
</script>
<style>
th.position-relative {
    font-size: 13px;
}
td {
    font-size: 14px;
}
</style>
