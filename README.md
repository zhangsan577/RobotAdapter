# 机器人

##### 1. 文件与目录结构

        RotobAdapter/
        ├── config/
        │   └── config.ini
        ├── log/
        │   └── YYMMDD.log
        ├── wx/
        │   ├── cahp.dll
        │   └── cahps.exe
        ├── wwb/
        │   ├── config.ini
        │   ├── version.dll
        │   └── relay_service.exe
        └── RobotAdapter.exe

##### 2. 计费环境与配置文件

机器人配置文件：`RotobAdapter\config\config.ini`。

网吧环境内只可能存在一种计费，需按计费环境修改配置文件。

###### 万象

    [config]
    type=1
    cahp_exe=".\wx\cahps.exe"
    cahp_port=8032
    cahp_ip="127.0.0.1"

###### 旺旺吧

    [config]
    type=2
    cahp_exe=".\wwb\relay_service.exe"
    cahp_port=9100
    cahp_ip="127.0.0.1"


##### 3. 主程序说明
1）主程序`RobotAdapter.exe`；

2）主程序读取配置文件，按路径执行`cahp.exe`或`relay_service.exe`;

3）处理会员等级，处理规则如下：
  * 在新建费率方案的时候会对比计费软件后台，设置名字一样的会员等级。
  * 第一优先级，按会员等级的名字，例如`黄金会员`全字符匹配导入；
  * 第二优先级，等级名字没有匹配的，导入时选择当前费率方案中的最低会员等级；
  * 最低会员等级标准，会员积分最低等。

##### 4. 外部软件调用

    [config]
    charge_type=2
    robot_adapter_port=8053
    robot_adapter_ip="127.0.0.1"
