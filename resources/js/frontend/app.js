require('../bootstrap');
import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
import {routes} from './routes';
import User from '../helpers/User';
window.User = User
import Notification from '../helpers/Notification';
window.Notification = Notification
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
    i18n
});
