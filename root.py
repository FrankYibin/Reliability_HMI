import os
import ctypes, sys
from PySide2 import QtSql
from PySide2.QtGui import QFontDatabase, QIcon
from PySide2.QtQml import *
from PySide2.QtWidgets import QApplication
from PySide2.QtCore import QUrl
from PySide2.QtCore import QObject, Signal, Slot, Property
import dataProcess
import tcpclient
import usclient
import opcFacility
import psutil
database = QtSql.QSqlDatabase.addDatabase('QSQLITE')
database.setDatabaseName('SQLite.db')
database.open()
# pipenv shell //激活虚拟环境以便打包 目的：python打包会把安装的所有模块一起打进去 虚拟环境只安装pyside2、psutil和opcua
# pyinstaller -w -n[name] -i log.png --add-data "main.qml:." --onefile root.py  打包后把资源文件和qml文件考入dist文件夹即可 打包后exe文件图标在dist目录不会显示  放在其他目录即可
# exit()
application_path = (
    os.path.dirname(sys.executable)
    if getattr(sys, "frozen", False)
    else os.path.dirname(os.path.abspath(__file__))
)


class kill(QObject):
    def __init__(self):
        QObject.__init__(self)

    @Slot()
    def suicide(self):
        # 根据pid杀死进程
        mpid = QApplication.applicationPid()
        pids = psutil.pids()
        for pid in pids:
            if pid == mpid:
                p = psutil.Process(pid)
                cmd = 'taskkill /F /IM "{}"'.format(p.name())
                os.system(cmd)



if __name__ == '__main__':
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    config = dataProcess.ConfigurationQml()
    opcua = usclient.opcClient()
    runInfo = dataProcess.RunningInfoQml()
    alarmLog = dataProcess.AlarmLogQml()
    weldResult = dataProcess.WeldResultQml()
    app.setWindowIcon(QIcon("images/log.ico"))
    opcfacility1 = opcFacility.opcClient()
    opcfacility2 = opcFacility.opcClient()
    opcfacility3 = opcFacility.opcClient()
    opcfacility4 = opcFacility.opcClient()
    killme = kill()
    opcfacility1.machId = 1
    opcfacility2.machId = 2
    opcfacility3.machId = 3
    opcfacility4.machId = 4
    opcfacility1.weldData.connect(weldResult.insertWeld)
    opcfacility2.weldData.connect(weldResult.insertWeld)
    opcfacility3.weldData.connect(weldResult.insertWeld)
    opcfacility4.weldData.connect(weldResult.insertWeld)

    # qmlRegisterType(dataProcess.ConfigurationQml, 'ConfigurationQml', 1, 0, 'ConfigurationQml')
    # qmlRegisterType(dataProcess.RunningInfoQml, 'RunningInfoQml', 1, 0, 'RunningInfoQml')
    # qmlRegisterType(dataProcess.AlarmLogQml, 'AlarmLogQml', 1, 0, 'AlarmLogQml')
    # qmlRegisterType(dataProcess.WeldResultQml, 'WeldResultQml', 1, 0, 'WeldResultQml')
    # engine.rootContext().setContextProperty('numberGenerator', config)
    engine.rootContext().setContextProperty("ConfigurationQml", config)
    engine.rootContext().setContextProperty("opcua", opcua)
    # engine.rootContext().setContextProperty("TcpClient", tcp)
    engine.rootContext().setContextProperty("runInfo", runInfo)
    engine.rootContext().setContextProperty("AlarmLog", alarmLog)
    engine.rootContext().setContextProperty("weldResult", weldResult)
    engine.rootContext().setContextProperty("opcFacility1", opcfacility1)
    engine.rootContext().setContextProperty("opcFacility2", opcfacility2)
    engine.rootContext().setContextProperty("opcFacility3", opcfacility3)
    engine.rootContext().setContextProperty("opcFacility4", opcfacility4)
    engine.rootContext().setContextProperty("kill", killme)
    import os

    file = os.path.join(application_path, "main.qml")
    engine.load(QUrl.fromLocalFile(file))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


