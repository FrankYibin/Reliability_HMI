import sys

from PySide2 import QtSql
from PySide2.QtGui import QFontDatabase
from PySide2.QtQml import *
from PySide2.QtWidgets import QApplication

import dataProcess
import tcpclient
import usclient
import opcFacility
database = QtSql.QSqlDatabase.addDatabase('QSQLITE')
database.setDatabaseName('SQLite.db')
database.open()


def loadFont():
    fontDb = QFontDatabase()
    fontID = fontDb.addApplicationFont("font/OpenSans-Bold.ttf")
    QFontDatabase.addApplicationFont("font/OpenSans-Regular.ttf")
    # QFontDatabase.addApplicationFont("OpenSans-Bold.ttf")
    # QFontDatabase.addApplicationFont("OpenSans-Bold.ttf")
    # QFontDatabase.addApplicationFont("OpenSans-Bold.ttf")
    # QFontDatabase.addApplicationFont("OpenSans-Bold.ttf")
    # QFontDatabase.addApplicationFont("OpenSans-Bold.ttf")


if __name__ == '__main__':
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    config = dataProcess.ConfigurationQml()
    opcua = usclient.opcClient()
    tcp = tcpclient.tcpClient()
    runInfo = dataProcess.RunningInfoQml()
    opcfacility1 = opcFacility.opcClient()
    opcfacility2 = opcFacility.opcClient()
    opcfacility3 = opcFacility.opcClient()
    opcfacility4 = opcFacility.opcClient()
    # qmlRegisterType(dataProcess.ConfigurationQml, 'ConfigurationQml', 1, 0, 'ConfigurationQml')
    # qmlRegisterType(dataProcess.RunningInfoQml, 'RunningInfoQml', 1, 0, 'RunningInfoQml')
    # qmlRegisterType(dataProcess.AlarmLogQml, 'AlarmLogQml', 1, 0, 'AlarmLogQml')
    # qmlRegisterType(dataProcess.WeldResultQml, 'WeldResultQml', 1, 0, 'WeldResultQml')
    # engine.rootContext().setContextProperty('numberGenerator', config)
    engine.rootContext().setContextProperty("ConfigurationQml", config)
    engine.rootContext().setContextProperty("opcua", opcua)
    engine.rootContext().setContextProperty("TcpClient", tcp)
    engine.rootContext().setContextProperty("runInfo", runInfo)
    engine.rootContext().setContextProperty("opcFacility1", opcfacility1)
    engine.rootContext().setContextProperty("opcFacility2", opcfacility2)
    engine.rootContext().setContextProperty("opcFacility3", opcfacility3)
    engine.rootContext().setContextProperty("opcFacility4", opcfacility4)

    import os

    path = os.path.dirname(__file__) + os.sep + 'main.qml'
    engine.load(path)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
