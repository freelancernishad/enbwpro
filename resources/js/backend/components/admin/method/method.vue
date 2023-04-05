<template>
    <div>

        <div class="breadcrumbs-area">
            <h3>Withdrawal Methods</h3>
            <ul>
                <li>
                    <router-link :to="{ name: 'Dashboard' }">Home</router-link>
                </li>
                <li>Withdrawal Methods</li>
            </ul>
        </div>
        <div class="card">
            <div class="card-body">
                <table-component :sonod-type="$route.params.name" :sort-options-staus="sortstatus" :Filter="Filter"
                    :filter-on="FilterOn" :per-page="PerPage" :Items="items" :Fields="fields" :add-new="AddNew"
                    :per-page-data="PerPageData" :total-rows="TotalRows" :delete-route="deleteRoute"
                    :edit-route="editRoute" :application-route="applicationRoute" :view-route="viewRoute"
                    :approve-route="approveRoute" :pay-route="payRoute" :cancel-route="cancelRoute" :canceltext="canceltext"
                    :approve-type="approveType" :approve-data="approveData" @event-name="UserList">
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
        this.fields =  [
                { key: 'name', label: 'Name', sortable: true },
                { key: 'currency', label: 'Currency', sortable: true },
                { key: 'percent_charge', label: 'Charge', sortable: true },
                { key: 'min_amount', label: 'Minimum', sortable: true },
                { key: 'max_amount', label: 'Max', sortable: true },
                { key: 'processtime', label: 'Processing Time', sortable: true },

                { key: 'status', label: 'Status', sortable: true },
            ]
            this.fields.push( { key: 'actions', label: 'Actions' });
    },
    data() {
        return {
            preLooding: true,
            access: '',
            sortstatus: false,
            Filter: true,
            FilterOn: false,
            PerPage: false,
            deleteRoute: '',
            AddNew: '',
            editRoute: '',
            applicationRoute: '/document',
            viewRoute: 'withdrawalView',
            approveRoute: '',
            cancelRoute: '/api/withdraw',
             canceltext: 'reject',
            approveType: '',
            approveData: '',
            payRoute: '',
            PerPageData: '10',
            TotalRows: '1',
            Type: '',
            unionsInfos: {
                payment_type:''
            },
            items: [],
            fields: [
                [
                { key: 'username', label: 'Username', sortable: true },
                { key: 'mobile', label: 'Phone', sortable: true },
                { key: 'actions', label: 'Actions' },
                { key: 'status', label: 'Status' },
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

                this.UserList();

            },
            deep: true
        }
    },
    methods: {

        async UserList(auto = false) {

                var res = await this.callApi('get', `/api/admin/withdrawal/gateway`, []);
                this.items = res.data
                this.TotalRows = `${this.items.length}`;



        }
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
