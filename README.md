# Robot

##### 1. Directory

        RotobAdapter/
        ├── config/
        │   └── config.ini
        ├── log/
        │   └── YYMMDD.log
        ├── wx/
        │   ├── config.ini
        │   ├── wx_cashier_proxy.dll
        │   └── wx_relay_service.exe
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
    cahp_exe=".\wx\wx_relay_service.exe"

###### wwb

    [config]
    type=2
    cahp_exe=".\wwb\relay_service.exe"

##### 3. RobotAdapter
1）Main program `RobotAdapter.exe`;

2）Read the `RotobAdapter\config\config.ini` and execute `wx_relay_service.exe` or `relay_service.exe`;

3）Handling membership levels:
* When creating a new rate plan, it will compare with the backend of the billing software and set the same name for the membership levels.
* Import based on the name of the membership level, for example, "Gold Member" will be imported with a full character match;

##### 4. How to call the robot

    [config]
    charge_type=2
    robot_adapter_port=8053
    robot_adapter_ip="127.0.0.1"
