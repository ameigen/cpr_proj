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
    int price;
    QString getPlatform();
    QString getGraphics();
    QString getPrice();
    int getBudget();

private slots:

    void on_pushButton_clicked();

    void on_comboBox_activated(const QString &arg1);

    void on_comboBox_2_activated(const QString &arg1);

private:
    Ui::search *ui;
};

#endif // SEARCH_H
