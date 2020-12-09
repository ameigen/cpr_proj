//||++++++++++++Alexander Alvarez++++++++++++||
//Also added the icons for 'File' and 'Save' options in start menu.
//Prototype made on personal time to explore future implimentation
#ifndef BUILD_H
#define BUILD_H
#include "mainwindow.h"
#include <vector>
class Build
{
    private:
    std::vector<std::vector<QString>> buildDetails;
    std::vector<std::vector<QString>> buildGeneral;

    public:
        void addDetail(std::vector<QString> item);
        void getBuild();
        QString moreInfoDump();
        std::vector<QString> getCPUInfo();
        std::vector<QString> getMBInfo();
        std::vector<QString> getRAMInfo();
        std::vector<QString> getGPUInfo();
        std::vector<QString> getStorageInfo();
        std::vector<QString> getCaseInfo();
        std::vector<QString> getPSUInfo();
        std::vector<QString> getCoolerInfo();
};
#endif // BUILD_H
//||--------Alexander Alvarez----------------||
