# import root
import random

from PySide2.QtWidgets import QApplication
from PySide2.QtSql import QSqlQuery, QSqlRecord, QSqlQueryModel
from PySide2.QtCore import Property, QObject, QUrl, Signal, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import qmlRegisterType
from PySide2.QtCore import QObject, Qt, Signal, Slot, QUrl, QStringListModel, QCoreApplication
import time
import datetime
from PySide2.QtNetwork import QTcpSocket, QHostAddress
from opcua import Client, ua

upConfig = 'update Configuration set "Machine Name"="{}","IP Address"="{}","Port"="{}" where "Index" = "{}";'

rec = QSqlRecord()
sql = QSqlQueryModel()


class ConfigurationQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "Configuration"

    config = Signal(list, arguments=['list'])
    sigMachName = Signal(list, arguments=['list'])
    cache = Signal(list, arguments=['list'])
    currentAlarmLock = Signal(int, arguments=['num'])

    @Slot()
    def quit(self):
        app = QApplication.instance()
        app.quit()

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
            Batch_Size = q.record().indexOf('Batch Size')
            Mode = q.record().indexOf('Mode')
            Alarm_Lock = q.record().indexOf('Alarm Lock')
            Data_Processing = q.record().indexOf('Data Processing')
            while q.next():
                list = []
                list.append(q.value(Machine_Name))
                list.append(q.value(IP_Address))
                list.append(q.value(Port))
                list.append(q.value(Batch_Size))
                list.append(q.value(Mode))
                list.append(q.value(Alarm_Lock))
                list.append(q.value(Data_Processing))
                self.sigMachName.emit(list)

    @Slot(str, str, str, str)
    def updateConfiguration(self, id, name, ip, port):
        q = QSqlQuery()
        sql_code = upConfig.format(name, ip, port, id)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateMode(self, index, num):
        q = QSqlQuery()
        sql_code = 'update Configuration set "Mode"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateBatchSize(self, index, num):
        q = QSqlQuery()
        sql_code = 'update Configuration set "Batch Size"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateAlarmLock(self, index, num):
        q = QSqlQuery()
        sql_code = 'update Configuration set "Alarm Lock"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, int)
    def updateDataProcessing(self, index, num):
        q = QSqlQuery()
        sql_code = 'update Configuration set "Data Processing"="{}" where "Index" = "{}";'
        sql_code = sql_code.format(num, index)
        q.exec_(sql_code)

    @Slot(int, result=int)
    def selectAlarmLock(self, index):
        q = QSqlQuery()
        sql_code = 'select "Alarm Lock" from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            lock = q.record().indexOf('Alarm Lock')
            while q.next():
                return q.value(lock)

    @Slot(int)
    def initProduction(self, index):
        q = QSqlQuery()
        sql_code = 'select * from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            mode = q.record().indexOf('Mode')
            size = q.record().indexOf('Batch Size')
            lock = q.record().indexOf('Alarm Lock')
            while q.next():
                list = []
                list.append(q.value(mode))
                list.append(q.value(size))
                list.append(q.value(lock))
                self.cache.emit(list)

    @Slot(int, result=str)
    def currentIp(self, index):
        q = QSqlQuery()
        sql_code = 'select * from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            IP_Address = q.record().indexOf('IP Address')
            while q.next():
                return q.value(IP_Address)

    @Slot(int, result=int)
    def currentPort(self, index):
        q = QSqlQuery()
        sql_code = 'select * from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            Port = q.record().indexOf('Port')
            while q.next():
                return q.value(Port)

    @Slot(int, result=int)
    def currentDataprocessing(self, index):
        q = QSqlQuery()
        sql_code = 'select * from Configuration where "Index" = "{}";'
        sql_code = sql_code.format(index)
        if q.exec_(sql_code):
            Port = q.record().indexOf('Data Processing')
            while q.next():
                return q.value(Port)


class RunningInfoQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "RunningInfo"

    @Slot(int, str, str, int, int, int, int, int)
    def insertRunInfoData(self, id, stime, etime, plcount, mode, alarmlock, ppm, alarmnum):
        # CREATE TRIGGER delete_till_99999 INSERT ON “Running Info” WHEN( SELECT count(*) FROM “Running Info” ) > 999998
        # BEGIN DELETE FROM[Running Info] WHERE( SELECT count("Index") FROM “Running Info” ) > 999998 AND "Index" IN( SELECT
        # "Index" FROM “Running Info” ORDER BY "Index" DESC LIMIT( SELECT count("Index") FROM “Running Info” ) OFFSET 999998
        # );  END; CREATE TRIGGER trigger_log_tab AFTER DELETE ON[Running Info] BEGIN UPDATE[Running Info] SET[Index] = ("Index" - 1); END;
        # UPDATE sqlite_sequence SET seq = 0 WHERE name='Running Info';
        q = QSqlQuery()
        sql_code = 'select count("Index") as num from "Running Info";'
        if q.exec_(sql_code):
            a = q.record().indexOf('num')
            while q.next():
                count = q.value(a)
        sql_code = 'insert into "Running Info"("Machine ID", "Start Time" , "End Time","PLC Count","Mode","Alarm Lock","PPM","Alarm Number") values("{}","{}","{}","{}","{}","{}","{}","{}")'
        sql_code = sql_code.format(id, stime, etime, plcount, mode, alarmlock, ppm, alarmnum)
        if q.exec_(sql_code):
            if count == 999999:
                sql_code = 'update "Running Info" set "Index" = ("Index" - 1);'
                q.exec_(sql_code)
                sql_code = 'update sqlite_sequence set seq=0 where name="Running Info"'
                q.exec_(sql_code)


class AlarmLogQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "AlarmLog"

    @Slot(int, int, int, str, str)
    def insertLog(self, pid, count, ptype, description, stamp):
        q = QSqlQuery()
        sql_code = 'select count("Index") as num from "Alarm Log";'
        timeArray = time.strptime(stamp, "%Y-%m-%d %H:%M:%S")
        timeStamp = int(time.mktime(timeArray))
        if q.exec_(sql_code):
            a = q.record().indexOf('num')
            while q.next():
                num = q.value(a)
        sql_code = 'insert into "Alarm Log"("Machine ID", "PLC Count" , "Alarm Type","Alarm Description","Time Stamp") values("{}","{}","{}","{}","{}")'
        sql_code = sql_code.format(pid, count, ptype, description, timeStamp)
        if q.exec_(sql_code):
            if num == 999999:
                sql_code = 'update "Alarm Log" set "Index" = ("Index" - 1);'
                q.exec_(sql_code)
                sql_code = 'update sqlite_sequence set seq=0 where name="Alarm Log"'
                q.exec_(sql_code)


class WeldResultQml(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.name = "WeldResult"

    # Data2:Data Source
    @Slot(list)
    def insertWeld(self, data):
        q = QSqlQuery()
        sql_code = 'select count("Index") as num from "Weld Result";'
        if q.exec_(sql_code):
            a = q.record().indexOf('num')
            while q.next():
                num = q.value(a)
        timeArray = time.strptime(data[23], "%Y/%m/%d %H:%M:%S")
        timeStamp = int(time.mktime(timeArray))
        sql_code = ('insert into "Weld Result"("Machine ID"'
                    ',"Data Source"'
                    ',"Amplitude Setting"'
                    ',"Energy Setting"'
                    ',"Time Setting"'
                    ',"TriggerPressureSetting"'
                    ',"WeldPressureSetting"'
                    ',"Weld Mode Setting"'
                    ',"Actual Time"'
                    ',"Actual Energy"'
                    ',"Actual Peak Power"'
                    ',"Actual Pre-Height"'
                    ',"Actual Post Height"'
                    ',"Quality Time Upper"'
                    ',"Quality Time Lower"'
                    ',"Quality Power Upper"'
                    ',"Quality Power Lower"'
                    ',"Quality Pre-Height Upper"'
                    ',"Quality Pre-Height Lower"'
                    ',"Quality PostHeight Upper"'
                    ',"Quality PostHeight Lower"'
                    ',"Alarm ID"'
                    ',"Machine Counter"'
                    ',"Time Stamp") values("{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}"'
                    ',"{}","{}","{}","{}","{}")')
        sql_code = sql_code.format(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8],
                                   data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22],
                                   timeStamp)
        if q.exec_(sql_code):
            if num == 999999:
                sql_code = 'update "Weld Result" set "Index" = ("Index" - 1);'
                q.exec_(sql_code)
                sql_code = 'update sqlite_sequence set seq=0 where name="Weld Result"'
                q.exec_(sql_code)
