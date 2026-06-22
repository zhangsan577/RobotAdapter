# Robot

##### 1. Directory

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
        │   ├── wwb_proxy.dll
        │   └── relay_service.exe
        └── RobotAdapter.exe

##### 2. Config files

Robot config file ：`RotobAdapter\config\config.ini`.

there can only be one billing method. The configuration file needs to be modified according to the billing environment.

###### wx

    [config]
    type=1
    cahp_exe=".\wx\cahps.exe"
    cahp_port=8032
    cahp_ip="127.0.0.1"

###### wwb

    [config]
    type=2
    cahp_exe=".\wwb\relay_service.exe"
    cahp_port=9100
    cahp_ip="127.0.0.1"


##### 3. RobotAdapter
1）Main program `RobotAdapter.exe`;

2）Read the `RotobAdapter\config\config.ini` and execute `cahp.exe` or `relay_service.exe`;

3）处理会员等级：
  * 在新建费率方案的时候会对比计费软件后台，设置名字一样的会员等级。
  * 第一优先级，按会员等级的名字，例如`黄金会员`全字符匹配导入；
  * 第二优先级，等级名字没有匹配的，导入时选择当前费率方案中的最低会员等级；
  * 最低会员等级标准，会员积分最低等。

##### 4. How to call the robot

    [config]
    charge_type=2
    robot_adapter_port=8053
    robot_adapter_ip="127.0.0.1"
