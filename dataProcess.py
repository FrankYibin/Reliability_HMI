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
    sigMachName = Signal(list, arguments=['list'])

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

    @Slot(int)
    def selectMachName(self, num):
        q = QSqlQuery()
        sql_code = 'select * from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(num)
        if q.exec_(sql_code):
            Machine_Name = q.record().indexOf('Machine Name')
            IP_Address = q.record().indexOf('IP Address')
            Port = q.record().indexOf('Port')
            while q.next():
                list = []
                list.append(q.value(Machine_Name))
                list.append(q.value(IP_Address))
                list.append(q.value(Port))
                self.sigMachName.emit(list)


    @Slot(str, str, str, str)
    def updateConfiguration(self,id,name,ip,port):
        q = QSqlQuery()
        sql_code = upConfig.format(name,ip,port,id)
        q.exec_(sql_code)


class RunningInfoQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "RunningInfo"

    @Slot(int, int, int, int, int, int, int, int)
    def insertRunInfoData(self, id, stime, etime, plcount, mode, alarmlock, ppm, alarmnum):
        q = QSqlQuery()
        sql_code = 'insert into Running Info values("{}","{}","{}","{}","{}","{}","{}","{}","{}")'
        sql_code = sql_code.format("null", id, stime, etime, plcount, mode, alarmlock, ppm, alarmnum)
        if q.exec_(sql_code):
            print('succeed insert data')


class AlarmLogQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "AlarmLog"


class WeldResultQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "WeldResult"


class OpcuaCache(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "OpcuaCache"

    cache = Signal(list, arguments=['list'])
    currentAlarmLock = Signal(int, arguments=['num'])
    @Slot(int)
    def initProduction(self, index):
        q = QSqlQuery()
        sql_code = 'select * from OpcuaCache where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            mode = q.record().indexOf('Mode')
            size = q.record().indexOf('BatchSize')
            lock = q.record().indexOf('AlarmLock')
            while q.next():
                list = []
                list.append(q.value(mode))
                list.append(q.value(size))
                list.append(q.value(lock))
                self.cache.emit(list)

    @Slot(int, int)
    def updateMode(self, index, num):
        q = QSqlQuery()
        sql_code = 'update OpcuaCache set "Mode"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateBatchSize(self, index, num):
        q = QSqlQuery()
        sql_code = 'update OpcuaCache set "BatchSize"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateAlarmLock(self, index, num):
        q = QSqlQuery()
        sql_code = 'update OpcuaCache set "AlarmLock"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int,result=int)
    def selectAlarmLock(self, index):
        q = QSqlQuery()
        sql_code = 'select "AlarmLock" from OpcuaCache where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            lock = q.record().indexOf('AlarmLock')
            while q.next():
                return q.value(lock)

