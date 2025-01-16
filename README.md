# 前端环境搭建

```shell
# 配置Vue环境
cd exam-view
npm install
```

# 后端环境搭建

```shell
# 配置Java环境
cd exam-server
mvn clean
mvn install
# 配置python环境
cd src/main/python
pip install -r requirements
```

# 配置数据库

```shell
cd exam-server
mysql -u [用户名] -p -e "source online_exam.sql"
```

