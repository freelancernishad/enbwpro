<template>
    <div>


        <loader v-if="Tableloader" object="#ff9633" color1="#ffffff" color2="#17fd3d" size="5" speed="2" bg="#343a40" objectbg="#999793" opacity="80" name="circular"></loader>

        <!-- User Interface controls -->
        <b-row>
            <b-col lg="6" class="my-1" v-if="SortOptionsStaus">
                <b-form-group label="Sort" label-for="sort-by-select" label-cols-sm="3" label-align-sm="right"
                    label-size="sm" class="mb-0" v-slot="{ ariaDescribedby }">
                    <b-input-group size="sm">
                        <b-form-select id="sort-by-select" v-model="sortBy" :options="sortOptions"
                            :aria-describedby="ariaDescribedby" class="w-75">
                            <template #first>
                                <option value="">-- none --</option>
                            </template>
                        </b-form-select>
                        <b-form-select v-model="sortDesc" :disabled="!sortBy" :aria-describedby="ariaDescribedby"
                            size="sm" class="w-25">
                            <option :value="false">Asc</option>
                            <option :value="true">Desc</option>
                        </b-form-select>
                    </b-input-group>
                </b-form-group>
            </b-col>
            <b-col lg="6" class="my-1" v-if="SortOptionsStaus">
                <b-form-group label="Initial sort" label-for="initial-sort-select" label-cols-sm="3"
                    label-align-sm="right" label-size="sm" class="mb-0">
                    <b-form-select id="initial-sort-select" v-model="sortDirection" :options="['asc', 'desc', 'last']"
                        size="sm"></b-form-select>
                </b-form-group>
            </b-col>
            <b-col lg="6" class="my-1" v-if="Filter">
                <b-form-group label="Filter" label-for="filter-input" label-cols-sm="3" label-align-sm="right"
                    class="mb-0">
                    <b-input-group>
                        <b-form-input id="filter-input" v-model="filter" type="search" placeholder="Type to Search">
                        </b-form-input>
                        <b-input-group-append>
                            <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
                        </b-input-group-append>
                    </b-input-group>
                </b-form-group>
            </b-col>
            <b-col lg="6" class="my-1" v-if="AllUpdate != ''">
                <form class="d-flex" style="justify-content: space-evenly;" @submit.stop.prevent="onSubmit">
                    <div class="form-group m-0" style="width:48%">
                        <select class="form-control" v-model="f.paymentType" required>
                            <option value="">Select</option>
                            <option value="Postpaid">Postpaid</option>
                            <option value="Prepaid">Prepaid</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-info" style="width:48%">Update all</button>

                </form>
            </b-col>
            <b-col lg="6" class="my-1 text-right" v-if="AddNew != ''">

                <router-link :to="{ name: AddNew }" class="btn btn-info">Add New</router-link>
            </b-col>

<!-- 
            <b-col lg="6" class="my-1" v-if="FilterOn">
                <b-form-group v-model="sortDirection" label="Filter On"
                    description="Leave all unchecked to filter on all data" label-cols-sm="3" label-align-sm="right"
                    label-size="sm" class="mb-0" v-slot="{ ariaDescribedby }">
                    <b-form-checkbox-group v-model="filterOn" :aria-describedby="ariaDescribedby" class="mt-1">
                        <b-form-checkbox value="username" checked="true">username</b-form-checkbox>
                    </b-form-checkbox-group>
                </b-form-group>
            </b-col> -->


            <b-col sm="5" md="6" class="my-1" v-if="PerPage">
                <b-form-group label="Per page" label-for="per-page-select" label-cols-sm="6" label-cols-md="4"
                    label-cols-lg="3" label-align-sm="right" label-size="sm" class="mb-0">
                    <b-form-select id="per-page-select" v-model="perPage" :options="pageOptions" size="sm">
                    </b-form-select>
                </b-form-group>
            </b-col>
        </b-row>
        <!-- <input type="checkbox" id="checkboxid" v-model="selectall" @change="selectAllFun"> <label for="checkboxid">Select All</label> -->
        <div class="form-check" v-if="SelectOption">
            <input type="checkbox" id="checkboxid" v-model="selectall" @change="selectAllFun" class="form-check-input">
            <label for="checkboxid" class="form-check-label">Select All</label>
        </div>



        <!-- Main table element -->
        <b-table :items="Items" :fields="Fields" :current-page="currentPage" :per-page="PerPageData" :filter="filter"
            :filter-included-fields="filterOn" :sort-by.sync="sortBy" :sort-desc.sync="sortDesc"
            :sort-direction="sortDirection" stacked="md" show-empty small @filtered="onFiltered">
            <template #cell(id)="row">
                <div class="form-check">
                    <input type="checkbox" :value="row.item.id" v-model="select" class="form-check-input">
                    <label class="form-check-label customcheckbox"></label>
                </div>
            </template>
            <template #cell(statuses)="row">
                <span size="sm" class="btn btn-success mr-1 mt-1" v-if="row.item.status == 'active'">
                    {{ row.item.status }}
                </span>
                <span size="sm" class="btn btn-danger mr-1 mt-1" v-else-if="row.item.status == 'banned'">
                    {{ row.item.status }}
                </span>
            </template>
            <template #cell(users)="row">
                <router-link :to="{name:'UsersView',params:{id:row.item.users.id}}">{{ row.item.users.username }}</router-link>

            </template>
            <template #cell(actions)="row">
                <span size="sm" @click="deletefun(row.item, row.index, $event.target)" v-if="DeleteRoute != ''"
                    class="btn btn-danger mr-1 mt-1">
                    Delete
                </span>
                <router-link size="sm" :to="{ name: EditRoute, params: { id: row.item.id } }" v-if="EditRoute != ''"
                    class="btn btn-info mr-1 mt-1">
                    Edit
                </router-link>

                <router-link size="sm" :to="{ name: ViewRoute, params: { id: row.item.id } }" v-if="ViewRoute != ''"
                    class="btn btn-info mr-1 mt-1">
                    View
                </router-link>

                <!-- <span size="sm" @click="info(row.item, row.index, $event.target)" v-if="ViewRoute != ''"
                    class="btn btn-info mr-1 mt-1">
                    View
                </span> -->
                <!-- <router-link size="sm" :to="{name:ViewRoute,params:{id:row.item.id}}" @click="info(ApproveRoute,row.item.id,ApproveData, $event.target)"  v-if="ViewRoute!=''" class="btn btn-success mr-1">
                    View
                </router-link> -->
                <span size="sm" @click="approve(ApproveRoute, row.item.id, ApproveData, $event.target, ApproveType,row.item)"
                    v-if="ApproveRoute != '' && row.item.payment_status == 'Unpaid'" class="btn btn-success mr-1 mt-1">
                    Approve
                </span>
                <span size="sm" @click="approve('/api/sonod', row.item.id, ApproveData, $event.target, 'apiAction',row.item)"
                    v-else-if="ApproveRoute != '' && row.item.payment_status == 'Paid'"
                    class="btn btn-success mr-1 mt-1">
                    Approve
                </span>
                <span size="sm" @click="paynow(PayRoute, row.item.id, $event.target)"
                    v-if="row.item.payment_status == 'Unpaid' && row.item.stutus == 'approved' && PayRoute != ''"
                    class="btn btn-info mr-1 mt-1">
                    Pay Now
                </span>
                <a :href="'/invoice/d/' + row.item.id" target="_blank" size="sm" v-if="row.item.stutus == 'approved'"
                    class="btn btn-info mr-1 mt-1">
                    রশিদ
                </a>
                <a :href="'/sonod/d/' + row.item.id" target="_blank" size="sm"
                    v-if="row.item.stutus == 'approved' && row.item.payment_status == 'Paid'"
                    class="btn btn-info mr-1 mt-1">
                    সনদ
                </a>
                <!--
                <router-link size="sm" :to="{name:ApproveRoute,params:{id:row.item.id}}"  v-if="ApproveRoute!='' && ApproveType=='vueAction'" class="btn btn-success mr-1">
                    Approve
                </router-link> -->





                <span size="sm" @click="cancel(CancelRoute, row.item.id, 'active', $event.target)"
                    v-if="CancelRoute != '' && row.item.status=='banned'" class="btn btn-success mr-1 mt-1">
                    Active
                </span>


                <span size="sm" @click="cancel(CancelRoute, row.item.id, 'approved', $event.target)"
                    v-else-if="CancelRoute != '' && row.item.status=='reject'" class="btn btn-success mr-1 mt-1">
                    Approve
                </span>

                <span size="sm" @click="cancel(CancelRoute, row.item.id, Canceltext, $event.target)"
                    v-else-if="CancelRoute != '' && row.item.status!='reject'" class="btn btn-danger mr-1 mt-1">
                   {{ Canceltext.toUpperCase() }}
                </span>

            </template>
            <template #row-details="row">
                <b-card>
                    <ul>
                        <li v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value }}</li>
                    </ul>
                </b-card>
            </template>
        </b-table>
        <b-pagination v-model="currentPage" :total-rows="TotalRows" :per-page="PerPageData" first-text="First"
            prev-text="Prev" next-text="Next" last-text="Last" align="right"></b-pagination>
        <!-- Info modal -->
        <b-modal :id="infoModal.id" size="xl" :title="infoModal.title" ok-only @hide="resetInfoModal">



            <!-- <pre>{{ infoModal.content_id }}</pre> -->
        </b-modal>

        <!-- Info modal -->
        <b-modal :id="prottoyonModal.id" size="xl" :title="prottoyonModal.title" ok-only @hide="resetInfoModal">



            <!-- <pre>{{ infoModal.content_id }}</pre> -->
        </b-modal>
        <!-- Info modal -->
        <b-modal :id="viewModal.id" size="xl" :title="viewModal.title" ok-only @hide="resetInfoModal">

        </b-modal>
    </div>
</template>
<script>
export default {
    props: {
        SonodType: {
            type: String,
            default: ''
        },
        AllUpdate: {
            type: String,
            default: ''
        },
        Canceltext: {
            type: String,
            default: ''
        },
        AddNew: {
            type: String,
            default: ''
        },
        SortOptionsStaus: {
            type: Boolean,
            default: false
        },
        Filter: {
            type: Boolean,
            default: false
        },
        FilterOn: {
            type: Array,
            default: []
        },
        PerPage: {
            type: Boolean,
            default: false
        },
        SelectOption: {
            type: Boolean,
            default: false
        },
        Tableloader: {
            type: Boolean,
            default: false
        },
        Items: {
            type: Array,
            default: [],
        },
        Fields: {
            type: Array,
            default: [],
        },
        PerPageData: {
            type: String,
            default: 10,
        },
        TotalRows: {
            type: String,
            default: 1,
        },
        DeleteRoute: {
            type: String,
            default: '',
        },
        EditRoute: {
            type: String,
            default: '',
        },
        ViewRoute: {
            type: String,
            default: '',
        },
        ApplicationRoute: {
            type: String,
            default: '',
        },
        ApproveRoute: {
            type: String,
            default: '',
        },
        PayRoute: {
            type: String,
            default: '',
        },
        ApproveData: {
            type: String,
            default: 'approved',
        },
        ApproveType: {
            type: String,
            default: 'apiAction',
        },
        CancelRoute: {
            type: String,
            default: '',
        },
        ApproveComponent: {
            type: String,
            default: '',
        }
    },
    data() {
        return {
            // totalRows: 1,
            currentPage: 1,
            perPage: 5,
            // pageOptions: [5, 10, 15, { value: 100, text: "Show a lot" }],
            sortBy: '',
            sortDesc: false,
            sortDirection: 'asc',
            filter: null,
            filterOn: [],
            select: [],
            selectall: false,
            nidverify: false,
            dobverify: false,
            f: {
                paymentType: '',
                district: '',
            },
            b: {
                reson: '',
            },
            infoModal: {
                id: 'info-modal',
                title: '',
                content: '',
                content_id: '',
            },
            prottoyonModal: {
                id: 'prottoyon-modal',
                title: '',
                content: '',
                content_id: '',
            },
            viewModal: {
                id: 'view-modal',
                title: '',
                content: '',
                content_id: '',
            }
        }
    },
    computed: {
        sortOptions() {
            // Create an options list from our fields
            return this.Fields
                .filter(f => f.sortable)
                .map(f => {
                    return { text: f.label, value: f.key }
                })
        }
    },
    mounted() {
        // Set the initial number of items
        // this.totalRows = this.Items.length
        this.filterOn = this.FilterOn;
    },
    methods: {
        selectAllFun() {
            this.select = [];
            if (this.selectall) {
                this.Items.forEach((element, key) => {
                    this.select[key] = element.id
                });
            } else {
                this.select = [];
            }
        },
        age(dateOf = '2001-08-25') {
            var dateofbirth = dateOf.split("-");
            var y1 = dateofbirth[0];
            var m1 = dateofbirth[1];
            var d1 = dateofbirth[2];
            var date = new Date();
            var d2 = date.getDate();
            var m2 = 1 + date.getMonth();
            var y2 = date.getFullYear();
            var month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            if (d1 > d2) {
                d2 = d2 + month[m2 - 1];
                m2 = m2 - 1;
            }
            if (m1 > m2) {
                m2 = m2 + 12;
                y2 = y2 - 1;
            }
            var d = d2 - d1;
            var m = m2 - m1;
            var y = y2 - y1;
            return y + ' Years ' + m + ' Months ' + d + ' Days ';
        },
        async info(item, index, button) {
            this.viewModal.title = `${item.applicant_name}`
            this.viewModal.content = item

            var applicant_national_id_number = item.applicant_national_id_number;
            var applicant_birth_certificate_number = item.applicant_birth_certificate_number;

            var nidVerify = await this.callApi('get', `/api/niddob/verify?applicant_national_id_number=${applicant_national_id_number}`, []);
            var dobVerify = await this.callApi('get', `/api/niddob/verify?applicant_birth_certificate_number=${applicant_birth_certificate_number}`, []);
            if (nidVerify.data == 1) {
                this.nidverify = true
            } else {
                this.nidverify = false

            }
            if (dobVerify.data == 1) {
                this.dobverify = true;
            } else {
                this.dobverify = false;

            }
            // console.log(nidVerify);
            // console.log(dobVerify);
            this.$root.$emit('bv::show::modal', this.viewModal.id, button)
        },
        resetInfoModal() {
            this.infoModal.title = ''
            this.infoModal.content = ''
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            // this.totalRows = filteredItems.length
            this.currentPage = 1
        },
        sonodList() {
            return this.$emit('event-name')
        },
        async approve(route, id, status, button, ApproveType,item) {



            if (ApproveType == 'vueAction') {
                this.infoModal.content_id = `${id}`;
                this.$root.$emit('bv::show::modal', this.infoModal.id, button)
            } else if (ApproveType == 'apiAction') {


                if(this.Users.position=='Secretary'){
                    if(item.sonod_name=='প্রত্যয়নপত্র' || item.sonod_name=='বিবিধ প্রত্যয়নপত্র'){
                            this.infoModal.content_id = `${id}`;
                            this.$root.$emit('bv::show::modal', this.infoModal.id, button)
                    }else{
                            Swal.fire({
                                title: 'Are you sure?',
                                text: `${status} this data!`,
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: `Yes, ${status} it!`
                            }).then(async (result) => {
                                if (result.isConfirmed) {
                                    var res = await this.callApi('get', `${route}/${status}/${id}`, []);
                                    Notification.customSuccess(`Your data has been ${status}`);
                                    this.$emit('event-name')
                                }
                            })
                    }
                }else{
                     Swal.fire({
                                title: 'Are you sure?',
                                text: `${status} this data!`,
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: `Yes, ${status} it!`
                            }).then(async (result) => {
                                if (result.isConfirmed) {
                                    var res = await this.callApi('get', `${route}/${status}/${id}`, []);
                                    Notification.customSuccess(`Your data has been ${status}`);
                                    this.$emit('event-name')
                                }
                            })
                }









            }
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
        async paynow(route, id, button) {
            Swal.fire({
                title: 'Are you sure?',
                text: `Pay this data!`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: `Yes, Pay it!`
            }).then(async (result) => {
                if (result.isConfirmed) {
                    var res = await this.callApi('get', `${route}/${id}`, []);
                    Notification.customSuccess(`Your data has been Paid`);
                    this.$emit('event-name')
                }
            })
        },
        deletefun(item, index, event) {
            // console.log('item: '+item.id, 'index: '+index, 'event: '+event)
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: `Yes, Delete it!`
            }).then(async (result) => {
                if (result.isConfirmed) {
                    var res = await this.callApi('delete', `${this.DeleteRoute}/${item.id}`, []);
                    Notification.customdelete(`Your data has been Deleted!`);
                    this.$emit('event-name')
                }
            })
        },
        async onSubmit() {

            this.f.district = this.Users.district;
            var res = await this.callApi('post', this.AllUpdate, this.f);
            this.$emit('event-name')
            // console.log(res)
            // this.getunionInfo();
            //     this.$router.push({ name: 'unionlist'})
            Notification.customSuccess('Payment Info Update Successfuly Done');


        },

        async formcancel() {
            var id = this.infoModal.content_id;
            this.b['names'] = this.Users.names;
            this.b['user_id'] = this.Users.id;
            this.b['position'] = this.Users.position;
            this.b['unioun'] = this.Users.unioun;
            this.b['status'] = 'cancel';
            this.b['sonod_id'] = id;

            var res = await this.callApi('post', `${this.CancelRoute}/cancel/${id}`, this.b);
            // console.log(res)
            this.$root.$emit('bv::hide::modal', 'info-modal')
            this.$emit('event-name')


            this.infoModal.title = ''
            this.infoModal.content = ''
            this.b = {
                reson: '',
            }
            Notification.customError(`Your data has been Canceled`);

        }

    }
}
</script>
<style>
.modal-dialog.modal-xl {
    max-width: 1200px;
}

.app-heading {
    text-align: center;
    margin: 32px 0;
    font-size: 23px;
    border-bottom: 1px solid #159513;
    color: #159513;
}

.customcheckbox {
    padding: 0 !important;
    width: 22px;
    height: 26px;
}
</style>
