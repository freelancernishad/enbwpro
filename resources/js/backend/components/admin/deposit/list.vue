<template>
    <div>

        <div class="breadcrumbs-area">
            <h3>Deposit List</h3>
            <ul>
                <li>
                    <router-link :to="{ name: 'Dashboard' }">Home</router-link>
                </li>
                <li>Deposit List</li>
            </ul>
        </div>
        <div class="card">
            <div class="card-body">
                <table-component :sonod-type="$route.params.name" :sort-options-staus="sortstatus" :Filter="Filter"
                    :filter-on="FilterOn" :per-page="PerPage" :Items="items" :Fields="fields" :add-new="AddNew"
                    :per-page-data="PerPageData" :total-rows="TotalRows" :delete-route="deleteRoute"
                    :edit-route="editRoute" :application-route="applicationRoute" :view-route="viewRoute"
                    :approve-route="approveRoute" :pay-route="payRoute" :cancel-route="cancelRoute" :canceltext="canceltext"
                    :approve-type="approveType" :approve-data="approveData"  :Tableloader="tableloader" @event-name="UserList">
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
                { key: 'created_at', label: 'Date', sortable: true,
                formatter: (value, key, item) => {
                       return this.dateformatglobal(value)[6]
                    }
            },
                { key: 'trx', label: 'Trx Number', sortable: true },
                { key: 'users', label: 'Username', sortable: true },
                { key: 'methods', label: 'Method', sortable: true,
                formatter: (value, key, item) => {
                       return value.name
                    } },
                { key: 'amount', label: 'Amount', sortable: true,


                formatter: (value, key, item) => {
                       return parseFloat(value/item.rate).toFixed(2)
                    }
            },
                { key: 'charge', label: 'Charge', sortable: true },
                { key: 'amount', label: 'After Charge', sortable: true },
                { key: 'rate', label: 'Rate', sortable: true },
                { key: 'after_charge', label: 'Payable', sortable: true },
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
            FilterOn: [],
            PerPage: false,
            tableloader: false,
            deleteRoute: '',
            AddNew: '',
            editRoute: '',
            applicationRoute: '/document',
            viewRoute: 'depositView',
            approveRoute: '',
            cancelRoute: '/api/deposit',
            canceltext: 'reject',
            approveType: '',
            approveData: '',
            payRoute: '',
            PerPageData: '20',
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
            this.tableloader = true
            var res = await this.callApi('get', `/api/admin/deposit?status=${this.$route.params.status}`, []);
            this.items = res.data
            this.TotalRows = `${this.items.length}`;
            this.tableloader = false




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
