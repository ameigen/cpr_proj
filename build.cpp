#include "build.h"

/*
        unsigned int getUID();
        QString getCategory(), getMSRP(), getName(), getPlatform(), getFF(), getCPU(), getMB(),
        getCooler(), getRAM(), getSTRG(), getPSU(), getGPU(), getCase(), getExtras();
        Build(QString specs[16]);
*/

/* Our default constructor intakes an array and parses through it for data.
 * This data is itterated through and placed into it's respective position
 * in the Build objects items array.
 */
Build::Build(QString specs[18])
{
    qDebug() << ("Creating build.");
    for(int i = 0; i < 18; i++)
    {
        items[i] = specs [i];
    }
}

/* Our getBuild() function creates a buildFormat string by itterating
 * through a list of 'titles' and merging this with the respective position
 * of the build's items returning a readable formatted list.
 */
QString Build::getBuild()
{
    QString buildFormat = "";
    QString titles[] = {"UID", "Category", "MSRP", "Name", "Platform", "Form Factor", "CPU", "Mother Board", "Cooler",
                        "RAM", "Storage", "Power Supply", "GPU", "Case", "Extra 1", "Extra 2", "Extra 3", "Extra 4"};
    buildFormat += "||++++++++++++++++++++++||\n";
    for(int i = 0; i < 18; i++)
    {
        buildFormat += (titles[i] + ": " + items[i] + "\n");
    }
    buildFormat += "||++++++++++++++++++++++||\n";
    return buildFormat;
}

//||+++++++++++++GETTERS START HERE+++++++++++++||
unsigned int Build::getUID()
{
   return items[0].toUInt();
}

QString Build::getCategory()
{
    return items[1];
}

QString Build::getMSRP()
{
    return items[2];
}

QString Build::getName()
{
    return items[3];
}

QString Build::getPlatform()
{
    return items[4];
}

QString Build::getFF()
{
    return items[5];
}

QString Build::getCPU()
{
    return items[6];
}

QString Build::getMB()
{
    return items[7];
}

QString Build::getCooler()
{
    return items[8];
}

QString Build::getRAM()
{
    return items[9];
}

QString Build::getSTRG()
{
    return items[10];
}

QString Build::getPSU()
{
    return items[11];
}

QString Build::getGPU()
{
    return items[12];
}

QString Build::getCase()
{
    return items[13];
}

QString Build::getEX1()
{
    return items[14];
}

QString Build::getEX2()
{
    return items[15];
}
QString Build::getEX3()
{
    return items[16];
}
QString Build::getEX4()
{
    return items[17];
}
//||+++++++++++++GETTERS END HERE+++++++++++++++||
