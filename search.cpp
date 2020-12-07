#include "search.h"
#include "ui_search.h"
#include "mainwindow.h"
#include <QMessageBox>

search::search(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::search)
{
    ui->setupUi(this);
    ui->lineEdit->setValidator(new QIntValidator(this));
    ui->comboBox->addItem("Choose One:");
    ui->comboBox->addItem("AMD");
    ui->comboBox->addItem("Intel");
    ui->comboBox_2->addItem("Choose One:");
    ui->comboBox_2->addItem("AMD");
    ui->comboBox_2->addItem("Nvidia");
}

search::~search()
{
    delete ui;
}

QString search::getPlatform(){
    return platform;
}

QString search::getGraphics(){
    return graphics;
}

QString search::getPrice(){
    QString budget = ui->lineEdit->text();
    price = budget.toDouble();
    return budget;
}

int search::getBudget(){
    int budget;
    QString textbudget = ui->lineEdit->text();
    budget = 8;
    return budget;
}

void search::on_pushButton_clicked()
{
    close();
}

void search::on_comboBox_activated(const QString &arg1)
{
    platform = arg1;
    //ui->textBrowser->setText(arg1);
}

void search::on_comboBox_2_activated(const QString &arg1)
{
    graphics = arg1;
    //ui->textBrowser->setText(arg1);
}
