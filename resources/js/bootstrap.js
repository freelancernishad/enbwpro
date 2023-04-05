import Vue from 'vue'
if(window.location.port=='8000'){
    Vue.prototype.$asseturl = '/'
}else{
    Vue.prototype.$asseturl = '/public/'
}

Vue.prototype.$localStorage = localStorage
window.ASSETURL = Vue.prototype.$asseturl
// Vue.prototype.$appName = process.env.MIX_FILE_PATH
// console.log(process.env.MIX_FILE_PATH)
import User from './helpers/User';
window.User = User
import Notification from './helpers/Notification';
window.Notification = Notification
import common from './common'
Vue.mixin(common)


import Popups from './backend/components/users/gt5g/confirmPopup';
Vue.component('Popups', Popups);

import Preload from './backend/components/users/gt5g/preLoad';
Vue.component('Preload', Preload);

import message from './backend/components/users/gt5g/message';
Vue.component('Message', message);


// window._ = require('lodash');
window.Noty = require('noty');
try {
    window.$ = window.jQuery = require('jquery');
} catch (e) {}
window.axios = require('axios');
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
window.RootUrl = window.location.origin;
// window.ASSETURL = '/public/';
// window.ASSETURL = '/';

