<!--页脚部分-->
<template>
  <footer id="footer">
    <ul>
      <li>【版权所有 ©2022 <a href="https://blog.csdn.net/qq_43378689">瓜月二十三</a> 保留所有权利】</li>
    </ul>
  </footer>
</template>

<script>
  export default {
    name: "myFooter"
  }
</script>

<style scoped>
#footer a {
  color: #0195ff;
  font-size: 14px;
}
#footer a:hover {
  color: #075c7b;
  font-size: 14px;
}
#footer {
  background-color: #eee;
  position:sticky;
  bottom: 0px;
}
#footer ul {

  /* border-top: 1px solid #d5d5d5; */
  display: flex;
  justify-content: center;
  height: 80px;
  line-height: 80px;
}
#footer ul li {
  color: #0195ff;
  font-size: 14px;
}
</style>
