#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setApplicationDisplayName("Kindid : How to use a table");
    app.setOrganizationDomain("kuiash.com");//todo. kindid.co.uk
    app.setOrganizationName("kuiash.com"); // kindid.co.uk
#if 0
    // doesn't work on iPad (must get Android working again)
    QString family = "Courier New";
    QFont fon(family);
    fon.setBold(true);
    app.setFont(fon);
#else
    QString family = "Chalkduster";
    QFont fon(family);
    app.setFont(fon);
#endif

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
