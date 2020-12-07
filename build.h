//||++++++++++++Alexander Alvarez++++++++++++||
//Also added the icons for 'File' and 'Save' options in start menu.
//Prototype made on personal time to explore future implimentation
#ifndef BUILD_H
#define BUILD_H
#include "mainwindow.h"
#include "item.h"
class Build
{
    public:
        unsigned int getUID();
        QString getCategory(), getMSRP(), getName(), getPlatform(), getFF(), getCPU(), getMB(),
        getCooler(), getRAM(), getSTRG(), getPSU(), getGPU(), getCase(), getExtras(), getBuild(),
        getEX1(), getEX2(), getEX3(), getEX4();

        Build(QString specs[18]);
        QString items[18];
};
#endif // BUILD_H
//||--------Alexander Alvarez----------------||
