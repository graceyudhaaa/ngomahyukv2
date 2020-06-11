#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QObject>
#include <QQmlProperty>
#include <iostream>
#include <string>

void databaseConnection(const char* DBType, const char* DBPath){
    QSqlDatabase db = QSqlDatabase::addDatabase(DBType);
    db.setDatabaseName(DBPath);
    if (db.open()){
        std::cout<<"database connection success"<<std::endl;
    }
}


int main(int argc, char *argv[])
{
    //    open connect to database
    databaseConnection("QSQLITE", "ngomahyuk.db");


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
