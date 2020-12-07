#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFile>
#include <QPushButton>
#include <QtSql>
#include <QSqlDatabase>
#include <QMessageBox>
#include <QDebug>
#include <array>
#include "item.h"
#include "build.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void saveToFile(); // Basic function for writing to a file.
    void loadFromFile();
    void templateSearch();
    QString getCategory();
    QString getPlatform();
    void ConnectDatabase();
    void testRead();
    QString platform;
    QString graphics;
    double budget;

private:
    Ui::MainWindow *ui;
    QSqlDatabase db;

private slots:
    void on_dataBaseCheck_clicked();
    void on_saveBuild_triggered();
    void on_loadBuild_triggered();
    void on_actionQuit_triggered();
    void on_templateBut_clicked();
    void on_testRead_clicked();
    void on_customBut_clicked();
};
#endif // MAINWINDOW_H
