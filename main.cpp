#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QAbstractTableModel>
#include <QQmlContext>
#include <tablemodel.h>
#include <arpdatabase.h>
#include <gamemodel.h>
#include <labelsmodel.h>
#include <toolsmodel.h>
#include <loginhandler.h>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<TableModel>("TableModel", 1, 0, "TableModel");
    qmlRegisterType<GameModel>("GameModel", 1, 0, "GameModel");
    qmlRegisterType<LabelsModel>("LabelsModel", 1, 0, "LabelsModel");
    qmlRegisterType<ToolsModel>("ToolsModel", 1,0, "ToolsModel");
    qmlRegisterType<ArpDatabase>("ArpDatabase", 0,1, "ArpDatabase");
    qmlRegisterType<LoginHandler>("LoginHandler",1,0,"LoginHandler");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    LoginHandler loginHandler;
    engine.rootContext()->setContextProperty("loginHandler", &loginHandler);
    QObject::connect(&loginHandler, &LoginHandler::loginSuccess, &engine, [&engine](const QString &token) {
       engine.rootContext()->setContextProperty("token", token);
    });
    QObject::connect(&loginHandler, &LoginHandler::loginFailure, &engine, [&engine]() {
       engine.rootContext()->setContextProperty("token", QString());
    });

    engine.load(url);

    return app.exec();
}
