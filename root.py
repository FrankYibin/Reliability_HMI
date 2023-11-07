import sys

from PySide2 import QtSql
from PySide2.QtQml import *
from PySide2.QtGui  import QGuiApplication

import dataProcess

database = QtSql.QSqlDatabase.addDatabase('QSQLITE')
database.setDatabaseName('SQLite.db')
database.open()

if __name__ == '__main__':
    config = dataProcess.ConfigurationQml()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # config.updateConfiguration(1,"aaaaaaaaaaa","",1)
    # for i in config.selectConfiguration():
    #     print(i.Index)
    # qmlRegisterType(dataProcess.ConfigurationQml, 'ConfigurationQml', 1, 0, 'ConfigurationQml')
    # qmlRegisterType(dataProcess.RunningInfoQml, 'RunningInfoQml', 1, 0, 'RunningInfoQml')
    # qmlRegisterType(dataProcess.AlarmLogQml, 'AlarmLogQml', 1, 0, 'AlarmLogQml')
    # qmlRegisterType(dataProcess.WeldResultQml, 'WeldResultQml', 1, 0, 'WeldResultQml')
    # engine.rootContext().setContextProperty('numberGenerator', config)
    engine.rootContext().setContextProperty("ConfigurationQml", config)
    import os
    path = os.path.dirname(__file__) + os.sep + 'main.qml'
    engine.load(path)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


