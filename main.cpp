#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <dataadapter.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    DataAdapter da;
    context->setContextProperty("dataAdapter", &da);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
