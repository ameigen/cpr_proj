/*
 * Search Class authored by Javier R.
 * + search.h
 * + search.cpp
 * + search.ui
 */
/*
 * Search visuals authored by Eliazar M.
 * Font size
 * Color scheme
 * Positioning of objects
 */
#ifndef SEARCH_H
#define SEARCH_H

#include <QDialog>

namespace Ui {
class search;
}

class search : public QDialog
{
    Q_OBJECT

public:
    explicit search(QWidget *parent = nullptr);
    ~search();
    QString platform;
    QString graphics;  
    QString getPlatform();
    QString getGraphics();
    QString getPrice();

private slots:

    void on_pushButton_clicked();

    void on_comboBox_activated(const QString &arg1);

    void on_comboBox_2_activated(const QString &arg1);


private:
    Ui::search *ui;
};

#endif // SEARCH_H
