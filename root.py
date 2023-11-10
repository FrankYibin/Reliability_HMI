import sys
from PySide2 import QtSql, QtNetwork
from PySide2.QtQml import *
import dataProcess
import usclient
import tcpclient
from PySide2.QtWidgets import QApplication, QDesktopWidget
from PySide2.QtGui import QFontDatabase
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
    # qmlRegisterType(dataProcess.ConfigurationQml, 'ConfigurationQml', 1, 0, 'ConfigurationQml')
    # qmlRegisterType(dataProcess.RunningInfoQml, 'RunningInfoQml', 1, 0, 'RunningInfoQml')
    # qmlRegisterType(dataProcess.AlarmLogQml, 'AlarmLogQml', 1, 0, 'AlarmLogQml')
    # qmlRegisterType(dataProcess.WeldResultQml, 'WeldResultQml', 1, 0, 'WeldResultQml')
    # engine.rootContext().setContextProperty('numberGenerator', config)
    engine.rootContext().setContextProperty("ConfigurationQml", config)
    engine.rootContext().setContextProperty("opcua", opcua)
    engine.rootContext().setContextProperty("Tcplient", tcp)
    import os
    path = os.path.dirname(__file__) + os.sep + 'main.qml'
    engine.load(path)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


