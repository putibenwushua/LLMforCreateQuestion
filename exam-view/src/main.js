import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import installElementPlus from './plugins/element'
import store from './vuex/store'; // 确保路径正确
import useCookies from 'vue3-cookies';

const app = createApp(App)
installElementPlus(app)
app.use(router)
    .use(store)
    .use(useCookies)
    .mount('#app')