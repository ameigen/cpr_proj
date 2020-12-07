#include "item.h"


//||=General Item Class: Start=||
//Default Contsructor
Item::Item()
{
    uid = 0000;
    price = 0000;
    brand = "NULL";
    name = "NULL";
    qDebug() << uid;
    qDebug() << price;
    qDebug() << brand;
    qDebug() << name;
}
Item::Item(unsigned int uid, unsigned int price, QString brand, QString name)
{
    qDebug() << "Item created.";
    this->uid = uid;
    this->price = price;
    this->brand = brand;
    this-> name = name;

    qDebug() << "Item created.";
    qDebug() << uid;
    qDebug() << price;
    qDebug() << brand;
    qDebug() << name;
}
//||==General Item Class: End==||

//||***************************||

//||===CPU Item Class: Start===||
CPU::CPU()
{
    qDebug() << "CPU created.";
}
//||====CPU Item Class: End====||

//||***************************||

//||==MOBO Item Class: Start===||
Motherboard::Motherboard()
{
    qDebug() << "Motherboard created.";
}
//||====MOBO Item Class: End===||

//||***************************||

//||===RAM Item Class: Start===||
RAM::RAM()
{
    qDebug() << "RAM created.";
}
//||=====RAM Item Class: End===||

//||***************************||

//||===GPU Item Class: Start===||
GPU::GPU()
{
    qDebug() << "GPU created.";
}
//||====GPU Item Class: End====||

