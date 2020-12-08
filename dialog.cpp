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

//FUnction that returns the current query based off sleection
QString Dialog::getCategory(){
    return category;
}

//Action done when "gaming" button clicked
void Dialog::on_gaming_clicked()
{
    category = "gaming";
    close();
}

//Action done when "productivity" button clicked
void Dialog::on_productivity_clicked()
{
    category = "productivity";
    close();
}

//Action done when "balance" button clicked
void Dialog::on_both_clicked()
{
    category = "balance";
    close();
}
