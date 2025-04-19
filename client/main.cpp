#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "framelesswindow.h"
#include <QIcon>
#include "httpmgr.h"
#include "global.h"
<<<<<<< HEAD
=======
#include "tcpmgr.h"
>>>>>>> feature/login-register
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    app.setWindowIcon(QIcon(":/src/logo.png"));
    qmlRegisterType<Global>("global", 1, 0, "Global");

    qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");
    // 注册HttpMgr单例到QML环境
    qmlRegisterSingletonType<HttpMgr>("httpmgr",
                                      1,
                                      0,
                                      "HttpMgr",
                                      [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
                                          Q_UNUSED(engine)
                                          Q_UNUSED(scriptEngine)
                                          return HttpMgr::GetInstance().get(); // 返回HttpMgr单例实例
                                      });
<<<<<<< HEAD
=======

    qmlRegisterSingletonType<HttpMgr>("tcpmgr",
                                      1,
                                      0,
                                      "TcpMgr",
                                      [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
                                          Q_UNUSED(engine)
                                          Q_UNUSED(scriptEngine)
                                          return TcpMgr::GetInstance().get(); // 返回HttpMgr单例实例
                                      });
>>>>>>> feature/login-register
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("chat", "Main");

    return app.exec();
}
