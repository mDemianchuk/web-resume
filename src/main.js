import Vue from 'vue';
import App from './App.vue';
import VueMeta from 'vue-meta';
import vuetify from './plugins/vuetify';
import router from './router';
import './layouts';

Vue.config.productionTip = process.env.NODE_ENV === 'production';

Vue.use(VueMeta, {
  refreshOnceOnNavigation: true,
});

new Vue({
  vuetify,
  router,
  render: h => h(App),
}).$mount('#app');