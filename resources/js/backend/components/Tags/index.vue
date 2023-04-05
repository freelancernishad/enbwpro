<template>
<div>
<table-component :sort-options-staus="sortstatus" :Filter="Filter" :filter-on="FilterOn"  :per-page="PerPage" :Items="items" :Fields="fields" :per-page-data="PerPageData" :total-rows="TotalRows"  delete-route="/api/sonod/delete" edit-route=""  view-route=""  @event-name="" >

</table-component>
    </div>
</template>

<script>

export default {

  mounted () {


  },
  data(){
    return {
            sortstatus:false,
            Filter:true,
            FilterOn:false,
            PerPage:false,
            PerPageData:'10',
            TotalRows:'1',

            fields: [
                { key: 'name', label: 'নাম', sortable: true },
                { key: 'type', label: 'পিতার/স্বামীর নাম', sortable: true },
                { key: 'year', label: 'গ্রাম/মহল্লা', sortable: true },
                { key: 'country', label: 'ন্যাশনাল আইডি', sortable: true },
                { key: 'date', label: 'আরো তথ্য', sortable: true },
                { key: 'actions', label: 'Actions' }
            ],
    items: [
      {
        name: 'Nolan',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Edgar',
        type: 'bmw',
        year: '2020',
        country:'belgium',
        date: '08/11/2020'
      },
      {
        name: 'John',
        type: 'bmw',
        year: '2019',
        country: 'england',
        date: '07/09/2022'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      },
      {
        name: 'Axel',
        type: 'mercedes',
        year: '2020',
        country: 'england',
        date: '08/01/2020'
      }
    ]
    }
  },
  methods: {
    },
    mounted() {
        this.TotalRows = `${this.items.length}`;
    },
}
</script>
