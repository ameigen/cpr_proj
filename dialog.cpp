/*
 * Dialog Class authored by Javier R.
 * + dialog.h
 * + dialog.cpp
 */
#include "dialog.h"
#include "ui_dialog.h"
#include "mainwindow.h"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
    this->setWindowTitle("Category");
}

Dialog::~Dialog()
{
    delete ui;
}

//Updates query string if Gaming button is selected
void Dialog::on_gaming_clicked()
{
    category = "gaming";
    close();
}

//Updates query string if Productivity button is selected
void Dialog::on_productivity_clicked()
{
    category = "productivity";
    close();
}

//Updates query string if Both button is selected
void Dialog::on_both_clicked()
{
    category = "balance";
    close();
}

//FUnction that returns the current query based off sleection
QString Dialog::getQuery(){
    return category;
}


