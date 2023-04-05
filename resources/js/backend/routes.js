let adminlayout = require('./components/layouts/adminlayout.vue').default;
let blanklayout = require('./components/layouts/blanklayout.vue').default;



// Auth Components

let logout = require('./components/auth/logout.vue').default;
// admin
let home = require('./components/home.vue').default;
let Settings = require('./components/Settings.vue').default;


let Userslist = require('./components/admin/users/list.vue').default;
let UsersView = require('./components/admin/users/view.vue').default;
let Usersform = require('./components/admin/users/form.vue').default;
let transitionslist = require('./components/admin/transitions/list.vue').default;


let withdrawllist = require('./components/admin/withdrawal/list.vue').default;
let withdrawalView = require('./components/admin/withdrawal/view.vue').default;
let withdrawalform = require('./components/admin/withdrawal/form.vue').default;

let plans = require('./components/admin/plans/list.vue').default;
let plansView = require('./components/admin/plans/view.vue').default;
let plansform = require('./components/admin/plans/form.vue').default;






let levels = require('./components/admin/levels/list.vue').default;
let levelsView = require('./components/admin/levels/view.vue').default;
let levelsform = require('./components/admin/levels/form.vue').default;


let withdrawlMethods = require('./components/admin/method/list.vue').default;
let methodView = require('./components/admin/method/view.vue').default;
let methodform = require('./components/admin/method/form.vue').default;

let depositlist = require('./components/admin/deposit/list.vue').default;
let depositView = require('./components/admin/deposit/view.vue').default;
let depositform = require('./components/admin/deposit/form.vue').default;

//package
let packages = require('./components/admin/package/list.vue').default;
let packageform = require('./components/admin/package/form.vue').default;

//blogs
let blogs = require('./components/blogs/list.vue').default;
let blogform = require('./components/blogs/form.vue').default;
//category
let category = require('./components/blogs/category/list.vue').default;
let categoryform = require('./components/blogs/category/form.vue').default;





let Tags = require('./components/Tags/index.vue').default;
let role = require('./components/assignRole.vue').default;
/////////////////////////////users//////////////////////////////////////////







let Authuser = require('./components/users/enbwpro/index.vue').default;
let Earning = require('./components/users/enbwpro/earning.vue').default;
let team = require('./components/users/enbwpro/team.vue').default;
let share = require('./components/users/enbwpro/share.vue').default;
let account = require('./components/users/enbwpro/account.vue').default;
let treasure = require('./components/users/enbwpro/treasure.vue').default;
let banlance = require('./components/users/enbwpro/banlance.vue').default;

let Recharge = require('./components/users/recharge/RechargeAmount.vue').default;
let rechargepage = require('./components/users/recharge/RechargePage.vue').default;
let rechargepageUsd = require('./components/users/recharge/rechargepageUsd.vue').default;
let rechargecheckout = require('./components/users/recharge/rechargecheckout.vue').default;
let rechargecheckoutUsd = require('./components/users/recharge/rechargecheckoutUsd.vue').default;
let rechargesuccess = require('./components/users/recharge/rechargesuccess.vue').default;
let rechargeFailed = require('./components/users/recharge/rechargeFailed.vue').default;

let RechargeRecord = require('./components/users/enbwpro/RechargeRecord.vue').default;
let withdraw = require('./components/users/enbwpro/withdraw.vue').default;
let WithdrawalRecord = require('./components/users/enbwpro/WithdrawalRecord.vue').default;
let aboutus = require('./components/users/enbwpro/aboutus.vue').default;
let noreward = require('./components/users/enbwpro/noreward.vue').default;
let peraccpass = require('./components/users/enbwpro/peraccpass.vue').default;
let pullmoney = require('./components/users/enbwpro/pullmoney.vue').default;
let password = require('./components/users/enbwpro/password.vue').default;
let teamdaily = require('./components/users/enbwpro/teamdaily.vue').default;
let packagesView = require('./components/users/enbwpro/packages.vue').default;
let records = require('./components/users/enbwpro/records.vue').default;
let faq = require('./components/users/enbwpro/faq.vue').default;





let Useraccount = require('./components/users/account.vue').default;
let UserTeam = require('./components/users/team.vue').default;
let Usertask = require('./components/users/task.vue').default;
let UsertaskComplete = require('./components/users/taskcomplete.vue').default;
//////////////////
let companyPro = require('./components/users/companyPro.vue').default;
let license = require('./components/users/license.vue').default;
let teamdetails = require('./components/users/teamdetails.vue').default;
let teamMember = require('./components/users/teamMember.vue').default;
let teamIntro = require('./components/users/teamIntro.vue').default;




// let Packages = require('./components/users/plans/Package.vue').default;
let earning = require('./components/users/plans/earning.vue').default;






// let Recharge = require('./components/users/Recharge2.vue').default;
// let RechargePage = require('./components/users/RechargePage.vue').default;


let Withdraw = require('./components/users/Withdraw.vue').default;
let invite = require('./components/users/invite.vue').default;
let information = require('./components/users/information.vue').default;




let orders = require('./components/users/orders.vue').default;
let rechargeHistory = require('./components/users/rechargeHistory.vue').default;
let WithdrawHistory = require('./components/users/WithdrawHistory.vue').default;
let Announcement = require('./components/users/Announcement.vue').default;
let bankAccount = require('./components/users/bankAccount.vue').default;
let RechangePass = require('./components/users/RechangePass.vue').default;
let help = require('./components/users/help.vue').default;
let promotion = require('./components/users/promotion.vue').default;
let memberSystem = require('./components/users/memberSystem.vue').default;
let support = require('./components/users/support.vue').default;
let accountDetails = require('./components/users/accountDetails.vue').default;


let USDT = require('./components/users/USDT.vue').default;
let instraction = require('./components/users/instraction.vue').default;
let rechargeHelp = require('./components/users/rechargeHelp.vue').default;
let withdrawalHelp = require('./components/users/withdrawalHelp.vue').default;
let brokerHelp = require('./components/users/brokerHelp.vue').default;



let TikTok = require('./components/users/tiktok/t.vue').default;



let index = require('./components/vuex/index.vue').default;

let sendsms = require('./components/sendsms.vue').default;

let PageNotFound = require('./components/404.vue').default;


let prefix = '/dashboard/adddmin'
let prefixuser = '/dashboard/user'
export const routes = [

  //Auth Routes

  { path: `${prefix}/logout`, component: logout, name:'logout',meta: { layout: blanklayout } },




  { path:  `${prefix}/`, component: home, name:'Dashboard',meta: { layout: adminlayout } },

  { path:  `${prefix}/sent/sms/notice`, component: sendsms, name:'sendsms',meta: { layout: adminlayout } },



  { path:  `${prefix}/Settings`, component: Settings, name:'Settings',meta: { layout: adminlayout } },
  { path:  `${prefix}/plans`, component: plans, name:'MembersPlans',meta: { layout: adminlayout } },
  { path:  `${prefix}/plans/add`, component: plansView, name:'plansAdd',meta: { layout: adminlayout } },
  { path:  `${prefix}/plans/:id`, component: plansView, name:'plansView',meta: { layout: adminlayout } },

  { path:  `${prefix}/refercomition`, component: levels, name:'Refercomition',meta: { layout: adminlayout } },
  { path:  `${prefix}/refercomition/:id`, component: levelsView, name:'levelsView',meta: { layout: adminlayout } },


  { path:  `${prefix}/userlist/:status`, component: Userslist, name:'Userslist',meta: { layout: adminlayout } },
  { path:  `${prefix}/userlist/view/:id`, component: UsersView, name:'UsersView',meta: { layout: adminlayout } },
  { path:  `${prefix}/userlist/form/:id`, component: Usersform, name:'Usersform',meta: { layout: adminlayout } },


  { path:  `${prefix}/withdrawls/:status`, component: withdrawllist, name:'withdrawls',meta: { layout: adminlayout } },
  { path:  `${prefix}/withdraw/view/:id`, component: withdrawalView, name:'withdrawalView',meta: { layout: adminlayout } },
  { path:  `${prefix}/withdraw/form/:id`, component: withdrawalform, name:'withdrawalform',meta: { layout: adminlayout } },



//   { path:  `${prefix}/levels/:status`, component: levels, name:'levels',meta: { layout: adminlayout } },
//   { path:  `${prefix}/levels/view/:id`, component: levelsView, name:'levelsView',meta: { layout: adminlayout } },
//   { path:  `${prefix}/levels/form/:id`, component: levelsform, name:'levelsform',meta: { layout: adminlayout } },


  { path:  `${prefix}/method/list`, component: withdrawlMethods, name:'withdrawlMethods',meta: { layout: adminlayout } },
  { path:  `${prefix}/method/view/:id`, component: methodView, name:'methodView',meta: { layout: adminlayout } },
  { path:  `${prefix}/method/form`, component: methodform, name:'methodformAdd',meta: { layout: adminlayout } },
  { path:  `${prefix}/method/form/:id`, component: methodform, name:'methodform',meta: { layout: adminlayout } },


  { path:  `${prefix}/deposit/:status`, component: depositlist, name:'Diposit',meta: { layout: adminlayout } },
  { path:  `${prefix}/deposit/view/:id`, component: depositView, name:'depositView',meta: { layout: adminlayout } },
  { path:  `${prefix}/deposit/form/:id`, component: depositform, name:'depositform',meta: { layout: adminlayout } },


  { path:  `${prefix}/transitions/list/:userid`, component: transitionslist, name:'transitionslist',meta: { layout: adminlayout } },










// users
//menu
{ path:  `${prefixuser}/TikTok`, component: TikTok, name:'TikTok',meta: { layout: blanklayout } },


  { path:  `${prefixuser}`, component: Authuser, name:'Authuser',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/earning`, component: Earning, name:'Earning',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/team`, component: team, name:'team',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/share`, component: share, name:'share',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/account`, component: account, name:'account',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/treasure`, component: treasure, name:'treasure',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/banlance`, component: banlance, name:'banlance',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/Recharge`, component: Recharge, name:'Recharge',meta: { layout: blanklayout } },

  { path:  `${prefixuser}/onepay/Recharge`, component: rechargepage, name:'rechargepage',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/usd/Recharge`, component: rechargepageUsd, name:'rechargepageUsd',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/onepay/checkout`, component: rechargecheckout, name:'rechargecheckout',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/usd/checkout`, component: rechargecheckoutUsd, name:'rechargecheckoutUsd',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/onepay/patment/success`, component: rechargesuccess, name:'rechargesuccess',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/onepay/patment/failed`, component: rechargeFailed, name:'rechargeFailed',meta: { layout: blanklayout } },

  { path:  `${prefixuser}/recharge/record`, component: RechargeRecord, name:'RechargeRecord',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/withdraw`, component: withdraw, name:'withdraw',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/withdrawal/record`, component: WithdrawalRecord, name:'WithdrawalRecord',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/aboutus`, component: aboutus, name:'aboutus',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/noreward`, component: noreward, name:'noreward',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/peraccpass`, component: peraccpass, name:'peraccpass',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/pullmoney`, component: pullmoney, name:'pullmoney',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/password`, component: password, name:'password',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/teamdaily`, component: teamdaily, name:'teamdaily',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/packages`, component: packagesView, name:'package',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/records`, component: records, name:'records',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/faq`, component: faq, name:'faq',meta: { layout: blanklayout } },




  { path:  `${prefixuser}/account`, component: Useraccount, name:'Useraccount',meta: { layout: blanklayout } },
//   { path:  `${prefixuser}/team`, component: UserTeam, name:'UserTeam',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/task`, component: Usertask, name:'Usertask',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/task/:id`, component: UsertaskComplete, name:'UsertaskComplete',meta: { layout: blanklayout } },
  /////////////



  /////////////////////////////
  { path:  `${prefixuser}/license`, component: license, name:'license',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/companyPro`, component: companyPro, name:'companyPro',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/teamdetails`, component: teamdetails, name:'teamdetails',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/teamMember`, component: teamMember, name:'teamMember',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/teamIntro`, component: teamIntro, name:'teamIntro',meta: { layout: blanklayout } },







//   { path:  `${prefixuser}/Packages`, component: Packages, name:'Packages',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/earning`, component: earning, name:'earning',meta: { layout: blanklayout } },




//   { path:  `${prefixuser}/Recharge`, component: Recharge, name:'Recharge',meta: { layout: blanklayout } },
//   { path:  `${prefixuser}/Recharge/:method`, component: RechargePage, name:'RechargePage',meta: { layout: blanklayout } },

  { path:  `${prefixuser}/Withdraw`, component: Withdraw, name:'Withdraw',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/invite`, component: invite, name:'invite',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/information`, component: information, name:'information',meta: { layout: blanklayout } },

  { path:  `${prefixuser}/orders`, component: orders, name:'orders',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/rechargeHistory`, component: rechargeHistory, name:'rechargeHistory',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/WithdrawHistory`, component: WithdrawHistory, name:'WithdrawHistory',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/Announcement`, component: Announcement, name:'Announcement',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/bankAccount`, component: bankAccount, name:'bankAccount',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/RechangePass`, component: RechangePass, name:'RechangePass',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/help`, component: help, name:'help',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/promotion`, component: promotion, name:'promotion',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/memberSystem`, component: memberSystem, name:'memberSystem',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/support`, component: support, name:'support',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/accountDetails`, component: accountDetails, name:'accountDetails',meta: { layout: blanklayout } },

  { path:  `${prefixuser}/USDT`, component: USDT, name:'USDT',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/instraction`, component: instraction, name:'instraction',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/rechargeHelp`, component: rechargeHelp, name:'rechargeHelp',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/withdrawalHelp`, component: withdrawalHelp, name:'withdrawalHelp',meta: { layout: blanklayout } },
  { path:  `${prefixuser}/brokerHelp`, component: brokerHelp, name:'brokerHelp',meta: { layout: blanklayout } },


//packages
{ path:  `${prefix}/packages`, component: packages, name:'packages',meta: { layout: adminlayout } },
{ path:  `${prefix}/packages/add`, component: packageform, name:'packageform',meta: { layout: adminlayout } },
{ path:  `${prefix}/packages/edit/:id`, component: packageform, name:'packagesdit',meta: { layout: adminlayout } },


//blogs
{ path:  `${prefix}/blogs`, component: blogs, name:'blogs',meta: { layout: adminlayout } },
{ path:  `${prefix}/blogs/add`, component: blogform, name:'blogform',meta: { layout: adminlayout } },
{ path:  `${prefix}/blogs/edit/:id`, component: blogform, name:'blogedit',meta: { layout: adminlayout } },

//category
{ path:  `${prefix}/category`, component: category, name:'category',meta: { layout: adminlayout } },
{ path:  `${prefix}/category/add`, component: categoryform, name:'categoryform',meta: { layout: adminlayout } },
{ path:  `${prefix}/category/edit/:id`, component: categoryform, name:'categoryedit',meta: { layout: adminlayout } },





  { path:  `${prefixuser}/tags`, component: Tags, name:'tags',meta: { layout: adminlayout } },
  { path:  `${prefixuser}/role`, component: role, name:'role',meta: { layout: adminlayout } },

  { path:  `${prefixuser}/index`, component: index, name:'index',meta: { layout: adminlayout } },

  { path: "*", component: PageNotFound }

]
