import { createRouter, createWebHashHistory } from 'vue-router'


const routes = [
  {
    path: '/',
    name: 'login',
    component: ()=>import(/* webpackChunkName: "login" */ '../components/common/login.vue')
  },
  {
    path: '/student',
    name: 'student',
    component: () => import(/* webpackChunkName: "student" */'../components/student/index'),
    children: [
      {path:"/",component: ()=> import('../components/student/myExam')},
      {path: '/manager', component: () => import('../components/student/manager')},
      {path: '/examMsg', component: () => import('../components/student/examMsg')},
      {path: '/message', component: () => import('../components/student/message')},
      {path: '/studentScore', component: () => import("../components/student/answerScore")},
      {path: '/scoreTable', component: () => import("../components/student/scoreTable")},
    ]
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
