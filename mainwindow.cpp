#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "dialog.h"
#include "search.h"
#include <QFile>
#include <QTextStream>
#include <QMessageBox>
#include <QDialog>
#include <QFileDialog>
#include <direct.h>
#include <vector>

std::vector<Build> loadedBuilds;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    statusBar()->showMessage("Attempting to connect to server...");
    ConnectDatabase();

}

MainWindow::~MainWindow()
{
    delete ui;
}

/* ||==================|| Save/Load Functions START ||==================|| */

void MainWindow::saveToFile() // Basic function for writing to a file.
{
    QString saveFile = QFileDialog::getSaveFileName(this, // Opens file explorer.
            tr("Save Text File"), "",
            tr("Text Files (*.txt)"));

    QFile file(saveFile);

    if (file.open(QIODevice::WriteOnly)) // If the file is open, begin read/write.
    {
        QTextStream stream(&file); // "Stream" = Write to the file, stream << is like cin.
        stream << "Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                  + "\n\n- COOLER: " + manufacturerCL + " " + modelCL + "\n  Price $" + priceCL
                  + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                  + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                  + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                  + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                  + "\n\n- CASE: " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                  + "\n\n- POWER SUPPLY UNIT: " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                  + "\n\n Total Build Cost: $" + buildTotal;
        statusBar()->showMessage("File Saved"); // displays a "file saved" notification in the status bar below the UI
    }
}

/** saveToFile function authored by Lyndsey, but fully developed and completed by Jonathan. A majority of the graphical section (mainwindow.ui)
 * was designed by Lyndsey, as well. **/

void MainWindow::loadFromFile()
{
    QString loadFile = QFileDialog::getOpenFileName(this, // opens a directory window to choose from multiple .txt files
            tr("Open Text File"), "",
            tr("Text Files (*.txt)"));

    QFile file(loadFile);   // name of the of the declared file

    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);

    ui->textBrowser->setText(in.readAll()); // displays the opened file in the UI text browser (right side)

    statusBar()->showMessage("File Loaded"); // displays a "file saved" notification in the status bar below the UI
}

/** loadFromFile function authored by Jonathan, and
 * textBrowser view box (right side window of UI) authored by Jonathan **/

/* ||==================|| Save/Load Functions END ||==================|| */

/* ||==================|| Database Functions START ||==================|| */

//Proof of concept for reading in data. Made with sqlite because mySQL was not working at the time.

/** ConnectDatabase method by Javier R. **/
void MainWindow::ConnectDatabase(){
    statusBar()->showMessage("Attempting to connect to server...");
    db = QSqlDatabase::addDatabase("QMYSQL", "aws"); //Declaration of database db with the name "aws"
    //Below are credentials to log into the aws mySQL server
    db.setHostName("ec2-18-223-101-50.us-east-2.compute.amazonaws.com");
    db.setUserName("testuser");
    db.setPassword("testpassword");
    db.setDatabaseName("CPR");
    //Checks the database connection
    if (db.open()) {
        statusBar()->showMessage("Server Status: Connected to AWS");
    }
    else {
        statusBar()->showMessage("Server Status: No Connection");
        QMessageBox::information(this, "Not Connected", "No Connection to Database");
    }
}

//||+++++++++++Alexander Alvarez+++++++++++||
void MainWindow::testRead()
{
    //Holdover variable for quick QString output to text browser.
    QString output;
    //Stores the values of a build
    QString build[18];

    qDebug() << "Starting database check";
    if(db.open())
    {
        statusBar()->showMessage("Parsing database...");
        //Sets target of sql query to the 'aws' database.
        QSqlQuery query(QSqlDatabase::database("aws"));
        //Sets target of next query to the CPR database.
        query.exec("use CPR");
        query.exec("select * from TemplateBuild");
        /* While our query produces data we will first clear our build array.
         * We then set each value of the build array equal to the values
         * returned by the query (accessed via for loop).
         *
         * We then create a temporary object of class Build using our array
         * as the constructor value. This is then pushed to the back of the
         * loadedBuilds vector.
         */
        while(query.next())
        {
            build->clear();
            for(int i = 0; i < 18; i++)
            {
                build[i] = query.value(i).toString();
            }
            Build temp(build);
            loadedBuilds.push_back(temp);
        }
        statusBar()->showMessage("Database parsed.");
    }
    else
    {
        ui->textBrowser->setText("\n\t\t DATABASE NOT CONNECTED.\n");
    }
    /* For each build in our loadedBuilds vector we invoke the getBuild()
     * function which will return a the information of that build in a
     * formatted list.
     *
     * We then pass this to the textBrowser via the setText() function.
     */
    for(auto i : loadedBuilds)
    {
        output += (i.getBuild() + "\n\n");
    }
    ui->textBrowser->setText(output);
    qDebug() << "Ending database check";
}
//||------------Alexander Alvarez----------------||

/** templateSearch method by Javier R. **/
void MainWindow::templateSearch()
{
    if(db.open()){
        //Opens a Dialog Box
        Dialog dialog;
        dialog.setModal(true);
        dialog.exec();

        QString output;
        QString build[18];

       //Confirmation of Template button working
       //QMessageBox::information(this, "Success", "Template Button Works!");
       statusBar()->showMessage("Server Status: Executing Query....");

       //Prepares an SQL Query From Dialog Choice
       QSqlQuery query(QSqlDatabase::database("aws"));
       QString category = dialog.getCategory();
       qDebug() << category;
       query.prepare("SELECT * FROM TemplateBuild");
       //query.bindValue(":cat", "gaming");

       if(query.exec()){
            //Executes SQL Query, if successful, UI is updated with results

           while(query.next())
           {
               build->clear();
               for(int i = 0; i < 18; i++)
               {
                   build[i] = query.value(i).toString();
               }
               Build temp(build);
               loadedBuilds.push_back(temp);
           }
           statusBar()->showMessage("Database parsed.");

           for(auto i : loadedBuilds)
           {
               output += (i.getBuild() + "\n\n");
           }
           ui->textBrowser->setText(output);

           /*while(query.next()){
            statusBar()->showMessage("Server Status: Executing Query....");
            QString uid = query.value(0).toString();
            QString type = query.value(1).toString();
            ui->textBrowser->setText("UID: " + uid + "\nType: " + type);
            }//While loop used to parse through the values returned*/
            QMessageBox::information(this, "Success", "Query Successful");
            statusBar()->showMessage("Server Status: Query Exectued");

        }else{
            //If SQL Query cannot be executed status is updated
            statusBar()->showMessage("Server Status: Query Failed to Execute");
        }

    }else{
        //Displays a message prmpting to connect to database if no open connection is present
        QMessageBox::information(this, "Failed", "Connect to the Database first!");
    }
}

QString MainWindow::getCategory(){
    Dialog category;
    category.setModal(true);
    category.exec();

    QString catString = category.getCategory();
    return catString;
}

QString MainWindow::getPlatform(){
   search cpu;
   QString platform = cpu.getPlatform();
   return platform;
}

QString MainWindow::getGraphics(){
    search gpu;
    QString graphics = gpu.getGraphics();
    return graphics;
}

QString MainWindow::getBudget(){
    search price;
    QString budget = price.getPrice();
    return budget;
}

QString MainWindow::getAll(){
    Dialog cat;
    cat.setModal(true);
    cat.exec();

    category = cat.getCategory();

    search all;
    all.setModal(true);
    all.exec();

    platform = all.getPlatform();
    graphics = all.getGraphics();
    budget = all.getPrice();

    complete = ("Category: " + category + "\nCPU: " + platform + "\nGraphics: " + graphics + "\nBudget: " + budget);

    return complete;

    ui->textBrowser->setText(platform);
}

void MainWindow::getBuild(){

    if(db.open()){
        QSqlQuery query(QSqlDatabase::database("aws"));
        query.exec("use CPR");

        int maxCPU = (budget.toInt()*18)/100;
        QString cpuBudget = QString::number(maxCPU);
        QString searchCPU = "SELECT manufacturer, model, price, category, socket, graphics, chipset, cooler, pcie, memMax \
                FROM cpu \
                WHERE price BETWEEN 0 AND " + cpuBudget + " AND \
                manufacturer LIKE '" + platform + "' \
                ORDER BY " + category + " DESC \
                LIMIT 1";
        query.prepare(searchCPU);

        if(query.exec()){
            while(query.next()){
                manufacturerCPU = query.value(0).toString();
                modelCPU = query.value(1).toString();
                priceCPU = query.value(2).toString();
                segmentCPU = query.value(3).toString();
                socketCPU = query.value(4).toString();
                graphicsCPU = query.value(5).toString();
                chipsetCPU = query.value(6).toString();
                coolerCPU = query.value(7).toString();
                pcieCPU = query.value(8).toString();
                memMaxCPU = query.value(9).toString();
                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU + " " + socketCPU);
                statusBar()->showMessage("BUILD Status: searching for CPU...");

            }
        }else(QMessageBox::information(this, "Error", "Query Failed::CPU"));

        int maxMotherboard = (budget.toInt() * 12)/100;
        QString mbBudget = QString::number(maxMotherboard);
        QString searchMB = "SELECT manufacturer, model, price, form, chipset, ramMaxSpeed, ramMaxCapacity, socket, m2 \
                            FROM motherboard \
                            WHERE price BETWEEN 0 AND " + mbBudget + " \
                            AND socket LIKE '" + socketCPU + "' \
                            ORDER BY price DESC LIMIT 1";
        query.prepare(searchMB);

        if(query.exec()){
            while(query.next()){
                manufacturerMB = query.value(0).toString();
                modelMB = query.value(1).toString();
                priceMB = query.value(2).toString();
                formMB = query.value(3).toString();
                chipsetMB = query.value(4).toString();
                ramMaxSpeedMB = query.value(5).toString();
                ramMaxCapacityMB = query.value(6).toString();
                socketMB = query.value(7).toString();
                m2MB = query.value(8).toString();
                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB);
                statusBar()->showMessage("BUILD Status: searching for Motherboard...");

            }
        }else(QMessageBox::information(this, "Error", "Query Failed::MOTHERBOARD"));

        int maxMemory = (budget.toInt()*5)/100;
        QString memBudget = QString::number(maxMemory);
        QString searchRAM = "SELECT manufacturer, model, type, size, price, speed, cl \
                            FROM memory \
                            WHERE price BETWEEN 0 AND " + memBudget + " \
                            AND size <= " + ramMaxCapacityMB + " \
                            ORDER BY reliability DESC LIMIT 1";
        query.prepare(searchRAM);

        if(query.exec()){
            while(query.next()){
                manufacturerRAM = query.value(0).toString();
                modelRAM = query.value(1).toString();
                typeRAM = query.value(2).toString();
                sizeRAM = query.value(3).toString();
                priceRAM = query.value(4).toString();
                speedRAM = query.value(5).toString();
                clRAM = query.value(6).toString();

                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                         + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM);
                statusBar()->showMessage("BUILD Status: searching for RAM...");
                }
        }else(QMessageBox::information(this, "Error", "Query Failed::RAM"));


        int maxGPU = (budget.toInt()*43)/100;
        QString gpuBudget = QString::number(maxGPU);
        QString gpuCat;
            if(category == "productivity"){
                gpuCat = "Workstation";
            }else if(category == "gaming" && maxGPU > 229){
                gpuCat = "%e%";
            }else if(category == "gaming" && maxGPU <= 229){
                gpuCat = "Entry";
            }
        QString searchGPU = "SELECT manufacturer, series, model, price, memSize \
                             FROM gpu \
                             WHERE manufacturer LIKE '" + graphics + "' \
                             AND price BETWEEN 0 AND " + gpuBudget + "  \
                             AND category LIKE '" + gpuCat + "' \
                             ORDER BY price DESC LIMIT 1";
        query.prepare(searchGPU);

        if(query.exec()){
            while(query.next()){
                manufacturerGPU = query.value(0).toString();
                seriesGPU = query.value(1).toString();
                modelGPU = query.value(2).toString();
                priceGPU = query.value(3).toString();
                memSizeGPU = query.value(4).toString();

                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                         + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                         + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU);
                statusBar()->showMessage("BUILD Status: searching for GPU...");

                }
        }else(QMessageBox::information(this, "Error", "Query Failed::GPU"));


        int maxStorage = (budget.toInt()*6)/100;
        QString stgBudget = QString::number(maxStorage);
        QString searchSTG = "SELECT manufacturer, model, price, type, form, size, isnvme, gen4 \
                             FROM storage \
                             WHERE type LIKE 'ssd' \
                             AND price BETWEEN 0 AND " + stgBudget + " \
                             ORDER BY size DESC LIMIT 1";
        query.prepare(searchSTG);

        if(query.exec()){
            while(query.next()){
                manufacturerSTG = query.value(0).toString();
                modelSTG = query.value(1).toString();
                priceSTG = query.value(2).toString();
                typeSTG = query.value(3).toString();
                formSTG = query.value(4).toString();
                sizeSTG = query.value(5).toString();
                isnvmeSTG = query.value(6).toString();
                gen4STG = query.value(7).toString();

                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                         + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                         + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                         + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG);
                statusBar()->showMessage("BUILD Status: searching for Storage...");
                }
        }else(QMessageBox::information(this, "Error", "Query Failed::STORAGE-SSD"));



        int maxCase = (budget.toInt()*6)/100;
        QString caseBudget = QString::number(maxCase);
        QString maxSize;
        if(formMB == "ITX"){
          maxSize = "1";
        }else if(formMB == "mATX"){
          maxSize = "2";
        }else if(formMB == "ATX"){
          maxSize = "3";
        }else if(formMB == "EATX"){
          maxSize = "4";
        }
        QString searchCASE = "SELECT manufacturer, model, price, size, maxBoard, maxBoardNum, coolerSize, maxRad \
                             FROM cases \
                             WHERE price BETWEEN 0 AND " + caseBudget + " \
                             AND maxBoardNum >= " + maxSize + " \
                             ORDER BY price DESC LIMIT 1";
        query.prepare(searchCASE);

        if(query.exec()){
            while(query.next()){
                manufacturerCASE = query.value(0).toString();
                modelCASE = query.value(1).toString();
                priceCASE = query.value(2).toString();
                sizeCASE = query.value(3).toString();
                maxBoardCASE = query.value(4).toString();
                maxBoardNumCASE = query.value(5).toString();
                coolerSizeCASE = query.value(6).toString();
                maxRadCASE = query.value(7).toString();

                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                         + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                         + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                         + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                         + "\n\n- CASE: " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE);
                statusBar()->showMessage("BUILD Status: searching for Case...");
                }
        }else(QMessageBox::information(this, "Error", "Query Failed::CASE"));


        int maxPSU = (budget.toInt()*10)/100;
        QString psuBudget = QString::number(maxPSU);
        QString searchPSU = "SELECT manufacturer, model, price, wattage, certified \
                             FROM psu \
                             WHERE price BETWEEN 0 and " + psuBudget + " \
                             ORDER BY wattage DESC LIMIT 1";
        query.prepare(searchPSU);

        if(query.exec()){
            while(query.next()){
                manufacturerPSU = query.value(0).toString();
                modelPSU = query.value(1).toString();
                pricePSU = query.value(2).toString();
                wattagePSU = query.value(3).toString();
                certifiedPSU = query.value(4).toString();

                ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                         + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                         + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                         + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                         + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                         + "\n\n- CASE: " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                                         + "\n\n- POWER SUPPLY UNIT: " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU);
                statusBar()->showMessage("BUILD Status: searching for PSU...");
                }
        }else(QMessageBox::information(this, "Error", "Query Failed::PSU"));

        total = priceCPU.toInt() + priceMB.toInt() + priceCASE.toInt() + priceGPU.toInt() + pricePSU.toInt() + priceSTG.toInt() + priceRAM.toInt();
        buildTotal = QString::number(total);
        ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                 + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                 + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                 + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                 + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                 + "\n\n- CASE: " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                                 + "\n\n- POWER SUPPLY UNIT: " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                                 + "\n\n Total Build Cost: $" + buildTotal);
        statusBar()->showMessage("BUILD Status: Build Complete");

        if(coolerCPU == "no"){
            int budgetLeft = budget.toInt() - total;
            QString coolerBudget = QString::number(budgetLeft);
            QString coolerSearch = "SELECT manufacturer, model, intel, amd, price \
                                    FROM cooler \
                                    WHERE price BETWEEN 0 AND " + coolerBudget + " \
                                    AND sizeNum <= " + coolerSizeCASE + " \
                                    ORDER BY price DESC LIMIT 1";

            query.prepare(coolerSearch);

            if(query.exec()){
                while(query.next()){
                    manufacturerCL = query.value(0).toString();
                    modelCL = query.value(1).toString();
                    intelCL = query.value(2).toString();
                    amdCL = query.value(3).toString();
                    priceCL = query.value(4).toString();

                    total = priceCPU.toInt() + priceMB.toInt() + priceCASE.toInt() + priceGPU.toInt() + pricePSU.toInt() + priceSTG.toInt() + priceRAM.toInt() + priceCL.toInt();
                    buildTotal = QString::number(total);

                    ui->textBrowser->setText("Search Results\n\n- CPU: " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                             + "\n\n- COOLER: " + manufacturerCL + " " + modelCL + "\n  Price $" + priceCL
                                             + "\n\n- MOTHERBOARD: " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                             + "\n\n- RAM: " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                             + "\n\n- GPU: " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                             + "\n\n- SSD: " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                             + "\n\n- CASE: " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                                             + "\n\n- POWER SUPPLY UNIT: " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                                             + "\n\n Total Build Cost: $" + buildTotal);
                    statusBar()->showMessage("BUILD Status: Build Complete...Added Cooler...");
                    }
            }else(QMessageBox::information(this, "Error", "Query Failed::COOLER"));
        }

    }
}
void MainWindow::on_dataBaseCheck_clicked(){
    ConnectDatabase();
}

//Action for pressing the "Template" button
void MainWindow::on_templateBut_clicked()
{
    templateSearch();
}

/* ||==================|| Database Functions END ||==================|| */


/* ||==================|| Trigger Functions START ||==================|| */

void MainWindow::on_saveBuild_triggered()
{
    saveToFile();
}

void MainWindow::on_loadBuild_triggered()
{
    loadFromFile();
}

void MainWindow::on_actionQuit_triggered()
{
    close();
}

/* close function authored by Eliazar */

/* ||==================|| Trigger Functions END ||==================|| */

void MainWindow::on_testRead_clicked()
{
    testRead();
}


void MainWindow::on_customBut_clicked()
{
    //QString all = getAll();
    //ui->textBrowser->setText(all);

    getAll();

    QMessageBox::information(this, "Your Search", complete);

    getBuild();

}
