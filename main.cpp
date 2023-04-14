#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "App/Headers/TextEditor/todomodel.h"
#include "App/Headers/WeatherApp/appmodel.h"
#include "App/Headers/QtTextEditor/backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //TodoList
    qmlRegisterType<TodoModel>("AppTODOLIST.TodoModel", 1, 0, "TodoModel");
    //Weather app
    qmlRegisterType<WeatherData>("Weather", 1, 0, "WeatherData");
    qmlRegisterType<AppModel>("Weather", 1, 0, "AppModel");
    //Text-editor
    qmlRegisterType<Backend>("Qt.Backend", 1, 0, "Backend");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
