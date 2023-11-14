import socket
from PySide2.QtCore import Property, QObject, QUrl, Signal, Slot, QThread
pack_head_len = 3
pack_tail_len = 8


class rec_package:
    def __init__(self):
        self.head = ""
        self.fun_id = ""
        self.load_len = ""
        self.data = []
        self.check_sum = ""
        self.year = ""
        self.month = ""
        self.day = ""
        self.hour = ""
        self.minute = ""
        self.second = ""
        self.tail = ""


class tcpClient(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.ip = ""
        self.port = ""
    sigTcpData = Signal(list, arguments=['list'])
    connectStatus = Signal(int, arguments=['status'])
    @Slot(str, str)
    def connectTcp(self, ip, port):
        host = ip
        port = port
        '''
        @web: TCP/IP 套接字 
        '''
        self.conn = self.web_connect(host, port)
        '''
        Thread_dec(): decode function
        '''
        # self.thread_dec = Thread_dec(self.conn)  # 实例化一个线程
        # # 将线程thread的信号finishSignal和UI主线程中的槽函数Change进行连接
        # self.thread_dec.Dec_signal.connect(self.upData)
        # # 启动线程，执行线程类中run函数
        # self.thread_dec.start()

    def web_connect(self, ser_ip, ser_port):
        self.conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # 创建TCP/IP套接字
        self.conn.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, True)
        self.conn.ioctl(socket.SIO_KEEPALIVE_VALS, (1, 60 * 1000, 30 * 1000))
        # 开启保活机制，1min后没有反应则探测一次连接是否存在，30秒探测一次，失败则断开
        # noinspection PyBroadException
        try:
            self.conn.connect((ser_ip, ser_port))
        except:
            print("连接异常")
            self.connectStatus.emit(1)
            return
        else:
            print("连接正常")
            self.connectStatus.emit(0)
            self.thread_dec = Thread_dec(self.conn)  # 实例化一个线程
            # 将线程thread的信号finishSignal和UI主线程中的槽函数Change进行连接
            self.thread_dec.Dec_signal.connect(self.upData)
            # 启动线程，执行线程类中run函数
            self.thread_dec.start()

    @Slot()
    def dis_connect(self):
        try:
            self.Stop()
            self.conn.close()
        except:
            print("tcp连接异常")

    def Stop(self):
        self.thread_dec.terminate()  # 终止线程

    @Slot(list)
    def upData(self, list):
        self.sigTcpData.emit(list)


class Thread_dec(QThread):
    # 自定义信号声明
    # 使用自定义信号和UI主线程通讯，参数是发送信号时附带参数的数据类型，可以是str、int、list等
    Dec_signal = Signal(list)

    # 带一个参数t
    def __init__(self, conn, parent=None):
        super(Thread_dec, self).__init__(parent)
        self.conn = conn

    def str_slice(self, a):
        return int((a[-2:]+a[-4:-2]+a[2:4]+a[0:2]), 16)

    def decoding(self, data):
        index = int(len(data) / 8)
        sliced = []
        # 数据切分，每8位为一个指标
        for i in range(index):
            b = data[8 * i: 8 * (i + 1)]
            sliced.append(b)
        bag_list = []
        # 找包头
        for i in range(len(sliced)):
            if sliced[i] == '1002aa55':
                # 解包
                print(i)
                bag = rec_package()  # 实例化结构体
                bag.head = sliced[i]
                bag.fun_id = self.str_slice(sliced[i + 1])
                bag.load_len = int(self.str_slice(sliced[i + 2]) / 4)
                package_len = bag.load_len + pack_head_len + pack_tail_len
                for j in range(bag.load_len):
                    bag.data.append(self.str_slice((sliced[(i + 3 + j):(i + 4 + j)])[0]))
                print(bag.data)
                bag.check_sum = self.str_slice(sliced[i + 3 + bag.load_len])
                bag.year = self.str_slice(sliced[i + 3 + bag.load_len + 1])
                bag.month = self.str_slice(sliced[i + 3 + bag.load_len + 2])
                bag.day = self.str_slice(sliced[i + 3 + bag.load_len + 3])
                bag.hour = self.str_slice(sliced[i + 3 + bag.load_len + 4])
                bag.minute = self.str_slice(sliced[i + 3 + bag.load_len + 5])
                bag.second = self.str_slice(sliced[i + 3 + bag.load_len + 6])
                bag.tail = sliced[i + 3 + bag.load_len + 7]
                # if bag.tail != '55aa1002':
                #
                bag_list.append(bag)
        return bag_list

    # run函数是子线程中的操作，线程启动后开始执行
    def run(self):
        while True:
            data = self.conn.recv(8192).hex()
            print("data", data)
            print(len(data))
            # start dec
            decoding_data_list = self.decoding(data)
            bag = []
            for i in range(len(decoding_data_list)):
                bag.append(decoding_data_list[i].head)
                bag.append(decoding_data_list[i].fun_id)
                bag.append(decoding_data_list[i].load_len)
                bag.append(decoding_data_list[i].data)
                bag.append(decoding_data_list[i].check_sum)
                bag.append(decoding_data_list[i].year)
                bag.append(decoding_data_list[i].month)
                bag.append(decoding_data_list[i].day)
                bag.append(decoding_data_list[i].hour)
                bag.append(decoding_data_list[i].minute)
                bag.append(decoding_data_list[i].second)
                bag.append(decoding_data_list[i].tail)
                if bag[1] == 1:
                    self.Dec_signal.emit(bag)
                bag.clear()