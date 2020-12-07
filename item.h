#ifndef ITEM_H
#define ITEM_H
#include "mainwindow.h"

class Item
{
public:
    unsigned int getUID(),getPrice();
    QString getBrand(),getName();
    Item();
    Item(unsigned int uid, unsigned int price, QString brand, QString name);

private:
    unsigned int uid, price;
    QString type, brand, name;
};


class CPU : public Item
{
public:
    unsigned int getGen(),getCores(),getThreads(),getTDP;
    double getSpeed();
    QString getL2(),getL3(),getName(),getSocket();
    bool getTurbo();
    CPU(/*PARAMTERS HERE*/);

private:
    unsigned int gen, cores, threads, tdp;
    double speed;
    QString l2cache, l3cache, name, socket;
    bool turb;
};

class Motherboard : public Item
{
public:
    Motherboard(/*PARAMTERS HERE*/);
private:
};

class RAM : public Item
{
public:
    RAM(/*PARAMTERS HERE*/);
private:
};

class GPU : public Item
{
public:
    GPU(/*PARAMTERS HERE*/);
private:
};


#endif // ITEM_H
