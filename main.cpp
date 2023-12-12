#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
bool loadFonts(const QString &baseFile)
{

    QString assetsPath = qApp->applicationDirPath();
    QString path = assetsPath+QStringLiteral("/fonts/");

    QString fontFile = path+baseFile;
    const int fontId = QFontDatabase::addApplicationFont(fontFile);
    if (fontId == -1) {
        qDebug() << "Could not add font from file " << qPrintable(fontFile);
        return false;
    }

    QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);

    qDebug ()<< path << "fontFamilies"<<"\n"<<
        fontFamilies;

    QFont font = qApp->font();
    font.setFamily(fontFamilies.at(0));

    return true;
}


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QFontDatabase fdb;
//    loadFonts("OpenSans-Bold.ttf");
//    loadFonts("OpenSans-Regular.ttf");
//    qDebug()<< QFontDatabase::applicationFontFamilies(QFontDatabase::addApplicationFont("D:/Branson/Reliability_HMI/fonts/OpenSans-Bold.ttf"));
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
