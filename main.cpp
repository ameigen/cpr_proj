#include "mainwindow.h"
#include <QApplication>
#include <QFile>
#include <QTextStream>

QString windowTitle = "CPR - Computer Part Recommendations";

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowTitle(windowTitle);
    w.show();
    return a.exec();
}
