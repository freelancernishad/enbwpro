<template>
<div>

  <!-- <label for="">Type</label>
  <select v-model="selectedType">
    <option value="" disabled selected hidden>Type</option>
    <option value="mercedes">Mercedes</option>
    <option value="bmw">BMW</option> -->
  </select>

  <label for="">From</label>
  <input type="date" v-model="startDate">

  <label for="">To</label>
  <input type="date" v-model="endDate">

<!-- <datetime v-model="max"></datetime> -->
<!-- <input type="text" v-model="filtername"> -->

<input type="text" id="setach" v-model="search" @input="onkeysearch" placeholder="datatables search"/>
 <table id="datatable" class="table" >
    <thead>
        <tr>
             <th>name</th>
                <th>type</th>
                <th>year</th>
                <th>country</th>
                <th>date</th>

        </tr>
    </thead>
    <tbody>
        <tr v-for="(item, index) in filterItem">
                <td>{{ item.name }}</td>
                <td>{{ item.type }}</td>
                <td>{{ item.year }}</td>
                <td>{{ item.country }}</td>
                <td>{{ item.date }}</td>


            </tr>

    </tbody>
 </table>
    </div>
</template>

<script>

import moment from 'moment';
export default {

  mounted () {


var table=  $('#datatable').DataTable(

    {
            'processing': true,
            // searching:false,
            "order": [

                [ 1, "asc" ]
            ],
            responsive: true,
            info: false,

        dom: 'Bfrtip',
        buttons: ['copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'print']
    });

  $('#setach').off().keyup( ()=> {
      table.search(this.search).draw();
    //  table.fnFilter(this.search);
  });

  },
  data(){
    return {
    search: '',
    selectedType: '',
    startDate:null,
    endDate:null,
    filtername:'',
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

computed: {
   filterItem: function () {




                // return this.filterProductsByRange(this.items)


      // let filterType = this.selectedType
      // let filternames = this.filtername
      // if (!filterType) return this.items;  // when filterType not selected
      // if (filternames=='' || filternames==null) return this.items;  // when filterType not selected

      let startDate = this.startDate && new Date(this.startDate);
      let endDate = this.endDate && new Date(this.endDate);

// if(filternames!='' || filternames!=null){
//     this.items.filter(item => {
//         console.log(item)
//         return item.name == filternames;

//       })
// }
// filter(item => {
//         return item.type == filterType;
//       }).filter(item => {
      //   return item.name == filternames;
      // })

      return this.items.filter(item => {
        const itemDate = new Date(item.date)
        if (startDate && endDate) {
          return startDate <= itemDate && itemDate <= endDate;
        }
        if (startDate && !endDate) {
          return startDate <= itemDate;
        }
        if (!startDate && endDate) {
          return itemDate <= endDate;
        }
        return true;  // when neither startDate nor endDate selected
      })

    }

  },

  methods: {






            // filterProductsByName: function(products) {
            //     // return products.filter(product => !product.name.indexOf(this.filtername))
            //     return products.filter(product => {
            //      return  product.name.toLowerCase().match(this.filtername.toLowerCase()) || product.type.match(this.filtername) || product.year.match(this.filtername) || product.country.match(this.filtername)
            //       })

            // },

    //   filterProductsByRange: function(products){

    //   let startDate = this.startDate && new Date(this.startDate);
    //   let endDate = this.endDate && new Date(this.endDate);
    //    if (!startDate && !endDate) return products;
    //  products.filter(item => {
    //     const itemDate = new Date(item.date)

    //     if (startDate && endDate) {
    //       return startDate <= itemDate && itemDate <= endDate;
    //     }
    //     if (startDate && !endDate) {
    //       return startDate <= itemDate;
    //     }
    //     if (!startDate && endDate) {
    //       return itemDate <= endDate;
    //     }
    //     return  true;  // when neither startDate nor endDate selected
    //   })

    //         },

  localizeDate(date) {

return moment(date).format("MM/DD/YYYY");
    //   if (!date || !date.includes('-')) return date
    //   const [yyyy, mm, dd] = date.split('-')
    //   return new Date(`${mm}/${dd}/${yyyy}`)
    },
    formatDate(date) {
      return new Intl.DateTimeFormat('en-US', { dateStyle: 'long' }).format(new Date(date))
    },
onkeysearch(){
//   this.tablefun().search(this.search).draw() ;
},



    }
}
</script>
