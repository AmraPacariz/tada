#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lists.h"
#include "listsmodel.h"
#include "todolist.h"
#include "todomodel.h"
#include "filtermodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<ToDoModel>("ToDo",1,0,"ToDoModel");

    ToDoList toDoList;


    qmlRegisterType<ListsModel>("Lists",1,0,"ListsModel");

    Lists doLists;

    QObject::connect(&doLists, &Lists::preNumberIncremented, [](int index) { });//ova dodadeno
     QObject::connect(&doLists, &Lists::postNumberIncremented, [](int index) { });
     QObject::connect(&doLists, &Lists::preNumberDecremented, [](int index) { });
      QObject::connect(&doLists, &Lists::postNumberDecremented, [](int index) { });
    qmlRegisterType<FilterModel>("Filter",1,0,"FilterModel");

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
