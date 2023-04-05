import Vue from 'vue'
require('../bootstrap');


// require('../bootstrap');
// import "datatables.net-dt/js/dataTables.dataTables";
// import 'datatables.net-buttons-bs4'
// // import 'datatables.net-buttons'


// Vue.use(moment)
// import { Datetime } from 'vue-datetime';
// import 'vue-datetime/dist/vue-datetime.css'
// Vue.component('datetime', Datetime);




import VueYoutube from 'vue-youtube'

Vue.use(VueYoutube)


// Vue.use(require('vue-moment'));

// require( 'jszip' );
// require( 'pdfmake' );
// require( 'semantic-ui-button' );
// require( 'datatables.net-autofill-dt' );

// require( 'datatables.net-dt' );
// require( 'datatables.net-buttons-dt' );
// require( 'datatables.net-bs5' );
// require( 'datatables.net-buttons-bs5' );
// require( 'datatables.net-bs4' );
// require( 'datatables.net-buttons-bs4' );

// require( 'datatables.net-buttons/js/buttons.colVis.js' );
// require( 'datatables.net-buttons/js/buttons.html5.js' );
// require( 'datatables.net-buttons/js/buttons.print.js' );

// require( 'datatables.net-buttons/js/buttons.colVis.js' )();
// require( 'datatables.net-buttons/js/buttons.html5.js' )();
// require( 'datatables.net-buttons/js/buttons.print.js' )();


// require( 'datatables.net-colreorder-dt' );
// require( 'datatables.net-datetime' );
// require( 'datatables.net-fixedcolumns-dt' );
// require( 'datatables.net-fixedheader-dt' );
// require( 'datatables.net-keytable-dt' );
// require( 'datatables.net-responsive-dt' );
// require( 'datatables.net-rowgroup-dt' );
// require( 'datatables.net-rowreorder-dt' );
// require( 'datatables.net-scroller-dt' );
// require( 'datatables.net-searchbuilder-dt' );
// require( 'datatables.net-searchpanes-dt' );
// require( 'datatables.net-select-dt' );
// require( 'datatables.net-staterestore-dt' );
import Multiselect from 'vue-multiselect'
Vue.component('multiselect', Multiselect)

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

// Import Bootstrap and BootstrapVue CSS files (order is important)
// import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

import Swal from 'sweetalert2'
window.Swal = Swal;

import VueRouter from 'vue-router'
Vue.use(VueRouter)
import {routes} from './routes';

import store from './store'


import tablecom from '../table.vue'
Vue.component('TableComponent', tablecom);



import { Bar } from 'vue-chartjs/legacy'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

Vue.component('Bar', Bar);



import loader from "vue-ui-preloader";

Vue.use(loader);


// import { VueEditor, Quill } from "vue2-editor";
// Vue.component('vue-editor', VueEditor);

window.Reload = new Vue();
const router = new VueRouter({
  routes,
  mode: 'history'
})




import languageComponent from '../language.vue'
Vue.component('LanguageComponent', languageComponent);


import VueI18n from 'vue-i18n';
Vue.use(VueI18n);




import Language from './../Helpers/lang/Language';


var enLang =  Language.en();
var bnLang =  Language.bn();
// console.log(bnLang)

const messages = {

    en: enLang,
    bn: bnLang


  };
//   console.log(messages)
var languageSelected = 'en';
  if(localStorage.getItem('language')){
    languageSelected = localStorage.getItem('language');
  }


  const i18n = new VueI18n({
    locale: languageSelected,
    messages
  });
  Vue.config.productionTip = false




const app = new Vue({
    el: '#app',
    router,
    store,
    i18n
});


