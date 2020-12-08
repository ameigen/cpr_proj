/*
 * Dialog Class authored by Javier R.
 * + dialog.h
 * + dialog.cpp
 * + dialog.ui
 */
#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QtSql>

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = nullptr);
    ~Dialog();
    QString category;
    QString getCategory();

private slots:
    void on_gaming_clicked();
    void on_productivity_clicked();
    void on_both_clicked();

private:
    Ui::Dialog *ui;
};

#endif // DIALOG_H
