//||++++++++++++Alexander Alvarez++++++++++++||
#include "build.h"

/* addDetail() pushes a part along with it's subsequent buildDetails
 * to our buildDetails vector.
 *
 * moreInfoDump() returns a formatted QString holding all of the
 * extra info stored inside of the build.
 *
 * get%Info() returns a vector of QStrings holding a part's
 * buildDetails.
 */

std::vector<QString> defaultvec (1,"n/a");
void Build::addDetail(std::vector<QString> item)
{
  this->buildDetails.push_back(item);
}

QString Build::moreInfoDump()
{
    QString output;
   for(auto i : this->buildDetails)
   {
       for(auto x : i)
       {
           output += (x + '\n');
       }
       output += '\n';
   }
   return output;
}

std::vector<QString> Build::getCPUInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "cpu")
        {
            qDebug() << "cpu returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getMBInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "mb")
        {
            qDebug() << "mb returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getRAMInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "ram")
        {
            qDebug() << "ram returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getGPUInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "gpu")
        {
            qDebug() << "gpu returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getStorageInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "storage")
        {
            qDebug() << "storage returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getCaseInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "case")
        {
            qDebug() << "case returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getPSUInfo()
{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "psu")
        {
            qDebug() << "psu returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};

std::vector<QString> Build::getCoolerInfo()

{
    for(auto i : this ->buildDetails)
    {
        if(i[0] == "cooler")
        {
            qDebug() << "cooler returned";
            return i;
        }
        else continue;
    }
    return defaultvec;
};
//||--------Alexander Alvarez----------------||
