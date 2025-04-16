#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "framelesswindow.h"
#include <QIcon>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    app.setWindowIcon(QIcon(":/src/logo.png"));
    qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("chat", "Main");

    return app.exec();
}
