/*
 * Mainwindow visuals authored by Eliazar M.
 * Font size
 * Color scheme
 * Positioning of objects
 */
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
    void ConnectDatabase();
    void testRead();
    QString platform, graphics, budget, category, complete;
    QString manufacturerCPU, modelCPU, priceCPU, segmentCPU, socketCPU, graphicsCPU, chipsetCPU, coolerCPU, pcieCPU, memMaxCPU;
    QString manufacturerMB, modelMB, priceMB, formMB, chipsetMB, ramMaxSpeedMB, ramMaxCapacityMB, socketMB, m2MB;
    QString manufacturerRAM, modelRAM, typeRAM, sizeRAM, priceRAM, speedRAM, clRAM;
    QString manufacturerGPU, seriesGPU, modelGPU, priceGPU, memSizeGPU;
    QString manufacturerSTG, modelSTG, priceSTG, typeSTG, formSTG, sizeSTG, isnvmeSTG, gen4STG;
    QString manufacturerCASE, modelCASE, priceCASE, sizeCASE, maxBoardCASE, maxBoardNumCASE, coolerSizeCASE, maxRadCASE;
    QString manufacturerPSU, modelPSU, pricePSU, wattagePSU, certifiedPSU;
    QString manufacturerCL, modelCL, intelCL, amdCL, priceCL;
    QString getAll();
    int total;
    QString buildTotal;
    void getBuild();

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
