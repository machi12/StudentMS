# StudentMS

### 简介：

这是一个基于javabean+servlet+jsp的学生管理系统<br/>
前端使用了Bootstrap和JQuery,可视化图表使用了echarts<br/>
.sql文件中是整个项目的数据库.<br/>

### 配置

clone该项目到本地后要进行下面操作：<br/>

1.进入到如下路径：StudentMS/src/sms/conn，打开该路径下的Conn.java文件，该文件为数据库中包含了数据库连接的相关配置信息，需要根据本地环境修改常量url，name和pwd，其中url为mysql数据库的路径，name为登录名，pwd为登陆密码。<br/>

2.在mysql数据库中导入项目根目录下的course_pick_sys.sql文件，该文件中包含该项目所有需要的数据。

### 最后

如果感觉该项目对你有所帮助，希望点个star。
