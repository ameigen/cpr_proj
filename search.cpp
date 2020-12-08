
#include "search.h"
#include "ui_search.h"
#include "mainwindow.h"
#include <QMessageBox>

search::search(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::search)
{
    ui->setupUi(this);
    this->setWindowTitle("Prefereneces");
    ui->lineEdit->setValidator(new QIntValidator(this));
    ui->comboBox->addItem("");
    ui->comboBox->addItem("AMD");
    ui->comboBox->addItem("Intel");
    ui->comboBox_2->addItem("");
    ui->comboBox_2->addItem("AMD");
    ui->comboBox_2->addItem("Nvidia");
}

search::~search(){
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
    return budget;
}

void search::on_pushButton_clicked(){
    QString budget = ui->lineEdit->text();
    if(ui->lineEdit->text().isEmpty()){
        QMessageBox::information(this, "Error", "Please enter a budget");
    }else if(budget.toInt() > 0 && budget.toInt() < 99999){
        close();
    }else{
        QMessageBox::information(this, "Error", "Please enter a number between 0 and 99,999");
    }

}

void search::on_comboBox_activated(const QString &arg1){
    platform = arg1;
}

void search::on_comboBox_2_activated(const QString &arg1){
    graphics = arg1;
}
