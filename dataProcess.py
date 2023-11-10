# import root
import random

from PyQt5.QtCore import QVariant
from PySide2 import QtSql, QtNetwork
from PySide2.QtSql import QSqlQuery
from PySide2.QtCore import Property, QObject, QUrl, Signal, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import qmlRegisterType
from PySide2.QtQuick import QQuickView
from typing import List, Any
from PySide2.QtCore import QObject, Qt,Signal, Slot, QUrl, QStringListModel, QCoreApplication

from PySide2.QtNetwork import QTcpSocket, QHostAddress
from opcua import Client, ua
from PyQt5.QtWidgets import QApplication, QWidget
upConfig = 'update Configuration set "Machine Name"="{}","IP Address"="{}","Port"="{}" where "Index" = "{}";'


class ConfigurationQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "Configuration"

    config = Signal(list, arguments=['list'])

    @Slot(result="QVariantList")
    def giveNumber(self):
        q = QSqlQuery()
        sql_code = 'select * from Configuration'

    @Slot()
    def selectConfiguration(self):
        q = QSqlQuery()
        sql_code = 'select * from Configuration'
        if q.exec_(sql_code):
            Index = q.record().indexOf('Index')
            Machine_ID = q.record().indexOf('Machine ID')
            Machine_Name = q.record().indexOf('Machine Name')
            Mode = q.record().indexOf('Mode')
            Alarm_Lock = q.record().indexOf('Alarm Lock')
            Data_Processing = q.record().indexOf('Data Processing')
            IP_Address = q.record().indexOf('IP Address')
            Port = q.record().indexOf('Port')
            Batch_Size = q.record().indexOf('Batch Size')
            mlist = list()
            while q.next():
                # clist.append(config)
                mlist.append(q.value(Index))
                mlist.append(q.value(Machine_ID))
                mlist.append(q.value(Machine_Name))
                mlist.append(q.value(Mode))
                mlist.append(q.value(Alarm_Lock))
                mlist.append(q.value(Data_Processing))
                mlist.append(q.value(IP_Address))
                mlist.append(q.value(Port))
                mlist.append(q.value(Batch_Size))
                self.config.emit(mlist)
                mlist.clear()

    @Slot(str, str, str, str)
    def updateConfiguration(self,id,name,ip,port):
        q = QSqlQuery()
        sql_code = upConfig.format(name,ip,port,id)
        q.exec_(sql_code)


class RunningInfoQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "RunningInfo"


class AlarmLogQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "AlarmLog"


class WeldResultQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "WeldResult"

