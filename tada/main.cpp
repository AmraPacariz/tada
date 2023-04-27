#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lists.h"
#include "listsmodel.h"
#include "todolist.h"
#include "todomodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<ToDoModel>("ToDo",1,0,"ToDoModel");
    qmlRegisterUncreatableType<ToDoList>("ToDo",1,0,"ToDo",QStringLiteral("Ajde AMRA"));
    ToDoList toDoList;


    qmlRegisterType<ListsModel>("Lists",1,0,"ListsModel");
    qmlRegisterUncreatableType<Lists>("Lists",1,0,"List",QStringLiteral("Ajde AMRA"));
    Lists doLists;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty(QStringLiteral("toDoList"),&toDoList);
    engine.rootContext()->setContextProperty(QStringLiteral("doLists"),&doLists);

    const QUrl url("qrc:/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
