import sys
from PySide2 import QtSql
from PySide2.QtGui import QFontDatabase
from PySide2.QtQml import *
from PySide2.QtWidgets import QApplication

import dataProcess
import tcpclient
import usclient
import opcFacility
import time
import setproctitle

database = QtSql.QSqlDatabase.addDatabase('QSQLITE')
database.setDatabaseName('SQLite.db')
database.open()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    config = dataProcess.ConfigurationQml()
    opcua = usclient.opcClient()
    runInfo = dataProcess.RunningInfoQml()
    alarmLog = dataProcess.AlarmLogQml()
    weldResult = dataProcess.WeldResultQml()
    opcfacility1 = opcFacility.opcClient()
    opcfacility2 = opcFacility.opcClient()
    opcfacility3 = opcFacility.opcClient()
    opcfacility4 = opcFacility.opcClient()
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
    proc_title = "new_proc_title"
    setproctitle.setproctitle(proc_title)
    import os
    path = os.path.dirname(__file__) + os.sep + 'main.qml'
    engine.load(path)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
