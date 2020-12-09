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
//infoDump true = dump details for build. False = output build
bool infoDump = true;

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
/* the saveToFile() function allows the user to save the displayed SQL data to a text file, and allows the user to choose the save location.
 * the loadFromFile() function allows the user to navigate to a directory and choose which text file to load, and displays the data. */

/** saveToFile() function authored by Lyndsey, but fully developed and completed by Jonathan.
 * A majority of the graphical section (mainwindow.ui) was started by Lyndsey, then worked on by the rest of the group **/
void MainWindow::saveToFile() // Basic function for writing to a file.
{
    QString saveFile = QFileDialog::getSaveFileName(this, // Opens file explorer.
            tr("Save Text File"), "",
            tr("Text Files (*.txt)"));

    QFile file(saveFile);

    if (file.open(QIODevice::WriteOnly)) // If the file is open, write only.
    {
        QTextStream stream(&file); // "Stream" = Write to the file, stream << is like cin.
        stream << "Search Results\n\n  Build Budget: $" + budget
                  + "\n\n- CPU: \n  " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                  + "\n\n- COOLER: \n  " + manufacturerCL + " " + modelCL + "\n  Price $" + priceCL
                  + "\n\n- MOTHERBOARD: \n  " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                  + "\n\n- RAM: \n  " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                  + "\n\n- GPU: \n  " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                  + "\n\n- SSD: \n  " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                  + "\n\n- CASE: \n  " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                  + "\n\n- POWER SUPPLY UNIT: \n  " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                  + "\n\n Total Build Cost: $" + buildTotal;
        statusBar()->showMessage("File Saved"); // displays a "file saved" notification in the status bar below the UI
    }
}

/** loadFromFile() function and textBrowser view box (right side window of UI) authored by Jonathan **/
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

/* ||==================|| Save/Load Functions END ||==================|| */

/* ||==================|| Database Functions START ||==================|| */

//Proof of concept for reading in data. Made with sqlite because mySQL was not working at the time.

/** ConnectDatabase authored by Javier R. **/
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
    }
}

/** getALl authored by Javier R. **/
/* This will get the prefernences and input
 * parameters used to query the database
 */
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
}

/** getBuild authored by Javier R. **/
/*  Using the initial user input as search parameters getBuild will
 *  query the database in a multistep process using the results to
 *  find matching parts and compose a complete build.
 */
void MainWindow::getBuild(){
    ui->textBrowser->clear();
    if(db.open()){
        QSqlQuery query(QSqlDatabase::database("aws"));
        query.exec("use CPR");

        /**** START OF PASS ONE :: PARTS FINDER ****/
        /* Step 1 - Query for CPU */
        int maxCPU = (budget.toInt()*18)/100;   // Sets value to 18% of user input for Budget
        QString cpuBudget = QString::number(maxCPU);    // converts value to QString type
        QString searchCPU = "SELECT manufacturer, model, price, category, socket, graphics, chipset, cooler, pcie, memMax \
                FROM cpu \
                WHERE price BETWEEN 0 AND " + cpuBudget + " AND \
                manufacturer LIKE '" + platform + "' \
                ORDER BY " + category + " DESC \
                LIMIT 1";   // Query used to search for matching CPU
        query.prepare(searchCPU);
        Build tempBuild;

        if(query.exec()){ // Checks for error in query
            QString categories[] = {"Manufacturer: ", "Model: ", "Price: $", "Segment: ", "Socket: ", "Graphics: ", "Chipset: ", "Cooler: ", "PCIE: ", "Max Memory:  "};
            std::vector<QString> cpu;
            statusBar()->clearMessage();
            while(query.next()){    // Stores query results in global variables
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
                cpu.push_back(QString("CPU"));
                cpu.push_back(QString("cpu"));
                for(int i = 0; i <= 9; ++i){
                   QString temp = categories[i] + query.value(i).toString();
                   cpu.push_back(temp);
                }
            }
            if(manufacturerCPU.isNull()){
                QMessageBox::information(this, "Error!", "No item found for CPU within budget");
            }
        tempBuild.addDetail(cpu);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::CPU");
            statusBar()->showMessage("BUILD Status: Query Failed for CPU");
        }   // Error message

        /* Step 2 - Query for Motherboard */
        int maxMotherboard = (budget.toInt() * 12)/100;
        QString mbBudget = QString::number(maxMotherboard);
        QString searchMB = "SELECT manufacturer, model, price, form, chipset, ramMaxSpeed, ramMaxCapacity, socket, m2 \
                            FROM motherboard \
                            WHERE price BETWEEN 0 AND " + mbBudget + " \
                            AND socket LIKE '" + socketCPU + "' \
                            ORDER BY price DESC LIMIT 1";
        query.prepare(searchMB);

        if(query.exec()){
            QString categories[] = {"Manufacturer: ", "Model: ", "Price: $", "Form Factor: ", "Chipset: ", "RAM Max Speed: ", "RAM Max Cap: ", "Socket: ", "m.2: "};
            std::vector<QString> mb;
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
                mb.push_back(QString("mb"));
                for(int i = 0; i <= 8; ++i){
                    QString temp = categories[i] + query.value(i).toString();
                    mb.push_back(temp);
                }
            }
            if(manufacturerMB.isNull()){
                QMessageBox::information(this, "Error!", "No item found for Motherboard within budget");
            }
            tempBuild.addDetail(mb);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::MB");
            statusBar()->showMessage("BUILD Status: Query Failed for Motherboard");
        }

        /* Step 3 - Query for Memory */
        int maxMemory = (budget.toInt()*5)/100;
        QString memBudget = QString::number(maxMemory);
        QString searchRAM = "SELECT manufacturer, model, type, size, price, speed, cl \
                            FROM memory \
                            WHERE price BETWEEN 0 AND " + memBudget + " \
                            AND size <= " + ramMaxCapacityMB + " \
                            ORDER BY reliability DESC LIMIT 1";
        query.prepare(searchRAM);

        if(query.exec()){
            QString categories[] = {"Manufacturer: ", "Model: ", "Type: ", "Size: ", "Chipset: ", "Price: $", "Speed: ", "Clock: "};
            std::vector<QString> ram;
            while(query.next()){
                manufacturerRAM = query.value(0).toString();
                modelRAM = query.value(1).toString();
                typeRAM = query.value(2).toString();
                sizeRAM = query.value(3).toString();
                priceRAM = query.value(4).toString();
                speedRAM = query.value(5).toString();
                clRAM = query.value(6).toString();
                ram.push_back(QString("ram"));
                for(int i = 0; i <= 6; ++i){
                    QString temp = categories[i] + query.value(i).toString();
                    ram.push_back(temp);;
                 }
            }
            if(manufacturerRAM.isNull()){
                QMessageBox::information(this, "Error!", "No item found for Memory within budget");
            }
            tempBuild.addDetail(ram);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::RAM");
            statusBar()->showMessage("BUILD Status: Query Failed for Memory");
        }

        /* Step 4 - Query for Graphics Card */
        int maxGPU = (budget.toInt()*43)/100;
        QString gpuBudget = QString::number(maxGPU);
        QString gpuCat;
        QString searchGPU = "SELECT manufacturer, series, model, price, memSize \
                             FROM gpu \
                             WHERE manufacturer LIKE '" + graphics + "' \
                             AND price BETWEEN 0 AND " + gpuBudget + "  \
                             ORDER BY price DESC LIMIT 1";
        query.prepare(searchGPU);

        if(query.exec()){
            QString categories[] = {"Manufacturer: ", "Series: ", "Model: ", "Price: $", "Memory Size: "};
            std::vector<QString> gpu;
            while(query.next()){
                manufacturerGPU = query.value(0).toString();
                seriesGPU = query.value(1).toString();
                modelGPU = query.value(2).toString();
                priceGPU = query.value(3).toString();
                memSizeGPU = query.value(4).toString();
                gpu.push_back(QString("gpu"));
                for(int i = 0; i <= 4; ++i){
                    QString temp = categories[i] + query.value(i).toString();
                    gpu.push_back(temp);;
                }
            }
            if(manufacturerGPU.isNull()){
                QMessageBox::information(this, "Error!", "No item found for GPU within budget");
            }
            tempBuild.addDetail(gpu);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::GPU");
            statusBar()->showMessage("BUILD Status: Query Failed for Graphics Card");
        }

        /* Step 5 - Query for SSD */
        int maxStorage = (budget.toInt()*6)/100;
        QString stgBudget = QString::number(maxStorage);
        QString searchSTG = "SELECT manufacturer, model, price, type, form, size, isnvme, gen4 \
                             FROM storage \
                             WHERE type LIKE 'ssd' \
                             AND price BETWEEN 0 AND " + stgBudget + " \
                             ORDER BY size DESC LIMIT 1";
        query.prepare(searchSTG);

        if(query.exec()){
            QString categories[] = {"Manufacturer: ", "Model: ", "Price: $", "Type: ", "Form Factor: ", "Size: ", "NVME: ", "Gen 4: "};
            std::vector<QString> storage;
            while(query.next()){
                manufacturerSTG = query.value(0).toString();
                modelSTG = query.value(1).toString();
                priceSTG = query.value(2).toString();
                typeSTG = query.value(3).toString();
                formSTG = query.value(4).toString();
                sizeSTG = query.value(5).toString();
                isnvmeSTG = query.value(6).toString();
                gen4STG = query.value(7).toString();
                storage.push_back(QString("storage"));
                for(int i = 0; i <= 7; ++i){
                    QString temp = categories[i] + query.value(i).toString();
                    storage.push_back(temp);;
                }
            }
            if(manufacturerSTG.isNull()){
                QMessageBox::information(this, "Error!", "No item found for SSD within budget");
            }
            tempBuild.addDetail(storage);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::STG");
            statusBar()->showMessage("BUILD Status: Query Failed for SSD");
        }

        /* Step 6 - Query for Encolsure */
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
            QString categories[] = {"Manufacturer: ", "Model: ", "Price: $", "Size: ", "Max Board: ", "Max Board Number: ", "Cooler Size: ", "Max Radiator: "};
            std::vector<QString> pcase;
            statusBar()->clearMessage();
            while(query.next()){
                manufacturerCASE = query.value(0).toString();
                modelCASE = query.value(1).toString();
                priceCASE = query.value(2).toString();
                sizeCASE = query.value(3).toString();
                maxBoardCASE = query.value(4).toString();
                maxBoardNumCASE = query.value(5).toString();
                coolerSizeCASE = query.value(6).toString();
                maxRadCASE = query.value(7).toString();
                statusBar()->showMessage("BUILD Status: searching for Case...");
                pcase.push_back(QString("PC Case"));
                for(int i = 0; i <= 7; ++i)
                {
                    QString temp = categories[i] + query.value(i).toString();
                    pcase.push_back(temp);;
                }
                }
            if(manufacturerCASE.isNull()){
                QMessageBox::information(this, "Error!", "No item found for Computer Case within budget");
            }
            tempBuild.addDetail(pcase);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::CASE");
            statusBar()->showMessage("BUILD Status: Query Failed for Enclosure");
        }

        /* Step 7 - Query for Power Supply Unit */
        int maxPSU = (budget.toInt()*10)/100;
        QString psuBudget = QString::number(maxPSU);
        QString searchPSU = "SELECT manufacturer, model, price, wattage, certified \
                             FROM psu \
                             WHERE price BETWEEN 0 and " + psuBudget + " \
                             ORDER BY wattage DESC LIMIT 1";
        query.prepare(searchPSU);

        if(query.exec()){
            QString categories[] = {"Manufacturer: ", "Model: ", "Price: $", "Wattage: ", "Certified: "};
            std::vector<QString> psu;
            statusBar()->clearMessage();
            while(query.next()){
                manufacturerPSU = query.value(0).toString();
                modelPSU = query.value(1).toString();
                pricePSU = query.value(2).toString();
                wattagePSU = query.value(3).toString();
                certifiedPSU = query.value(4).toString();
                psu.push_back(QString("psu"));
                for(int i = 0; i <= 4; ++i){
                    QString temp = categories[i] + query.value(i).toString();
                    psu.push_back(temp);
                }
                }
            if(manufacturerPSU.isNull()){
                QMessageBox::information(this, "Error!", "No item found for Power Supply within budget");
            }
            tempBuild.addDetail(psu);
        }else{
            QMessageBox::information(this, "Error", "Query Failed::PSU");
            statusBar()->showMessage("BUILD Status: Query Failed for Power Supply");
        }

        total = priceCPU.toInt() + priceMB.toInt() + priceCASE.toInt() + priceGPU.toInt()
                + pricePSU.toInt() + priceSTG.toInt() + priceRAM.toInt(); //adds price values from each part chosen
        buildTotal = QString::number(total);    //
        ui->textBrowser->setText("Search Results\n\n  Build Budget: $" + budget
                                 + "\n\n- CPU: \n  " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                 + "\n\n- MOTHERBOARD: \n  " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                 + "\n\n- RAM: \n  " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                 + "\n\n- GPU: \n  " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                 + "\n\n- STORAGE (SSD/HDD): \n  " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                 + "\n\n- CASE: \n  " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                                 + "\n\n- POWER SUPPLY UNIT: \n  " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                                 + "\n\n Total Build Cost: $" + buildTotal);
        statusBar()->showMessage("BUILD Status: Build Complete"); // Final results are printed on the screen and status bar is updated

        /**** END OF PASS ONE :: PARTS FINDER ****/

        /**** START OF PASS TWO :: PARTS FINDER ****/
        /* Step 8 - Query for CPU Cooler */
        if(coolerCPU == "no"){  // Checks if there is a missing cooler and fills that  part.
            int budgetLeft = budget.toInt() - total;
            QString coolerBudget = QString::number(budgetLeft);
            QString coolerSearch = "SELECT manufacturer, model, intel, amd, price \
                                    FROM cooler \
                                    WHERE price BETWEEN 0 AND " + coolerBudget + " \
                                    AND sizeNum <= " + coolerSizeCASE + " \
                                    ORDER BY price DESC LIMIT 1";
            query.prepare(coolerSearch);

            if(query.exec()){
                QString categories[] = {"Manufacturer: ", "Model: ", "Intel Compatible: ", "AMD Compatible: ", "Price: $"};
                std::vector<QString> cooler;
                statusBar()->clearMessage();
                while(query.next()){
                    manufacturerCL = query.value(0).toString();
                    modelCL = query.value(1).toString();
                    intelCL = query.value(2).toString();
                    amdCL = query.value(3).toString();
                    priceCL = query.value(4).toString();

                    total = priceCPU.toInt() + priceMB.toInt() + priceCASE.toInt() + priceGPU.toInt() + pricePSU.toInt() + priceSTG.toInt() + priceRAM.toInt() + priceCL.toInt();
                    buildTotal = QString::number(total);

                    ui->textBrowser->setText("Search Results\n\n  Build Budget: $" + budget
                                             + "\n\n- CPU: \n  " + manufacturerCPU + " " + modelCPU + "\n  Price $" + priceCPU
                                             + "\n\n- COOLER: \n  " + manufacturerCL + " " + modelCL + "\n  Price $" + priceCL
                                             + "\n\n- MOTHERBOARD: \n  " + manufacturerMB + " " + modelMB + " " + chipsetMB + "\n  Price $" + priceMB
                                             + "\n\n- RAM: \n  " + manufacturerRAM + " " + modelRAM + " " + typeRAM + " " + sizeRAM + "GB " + speedRAM + "Mhz CL" + clRAM + "\n  Price $" + priceRAM
                                             + "\n\n- GPU: \n  " + manufacturerGPU + " " + seriesGPU + " " + modelGPU + " " + memSizeGPU + "GB\n  Price $" + priceGPU
                                             + "\n\n- STORAGE (SSD/HDD): \n  " + manufacturerSTG + " " + modelSTG + " " + sizeSTG + "GB\n  Price $" + priceSTG
                                             + "\n\n- CASE: \n  " + manufacturerCASE + " " + modelCASE + " " + sizeCASE + "\n  Price $" + priceCASE
                                             + "\n\n- POWER SUPPLY UNIT: \n  " + manufacturerPSU + " " + modelPSU + " " + wattagePSU + "W 80+ " + certifiedPSU.toCaseFolded() + "\n  Price $" + pricePSU
                                             + "\n\n Total Build Cost: $" + buildTotal);
                    statusBar()->showMessage("BUILD Status: Build Complete...CPU Cooler added...");
                    cooler.push_back(QString("Cooler"));
                    for(int i = 0; i <= 4; ++i){
                        QString temp = categories[i] + query.value(i).toString();
                        cooler.push_back(temp);
                    }
                    }
                if(manufacturerCL.isNull()){
                    QMessageBox::information(this, "Error!", "No item found for CPU Cooler within budget");
                }
                tempBuild.addDetail(cooler);
            }else{
                QMessageBox::information(this, "Error", "Query Failed::CL");
                statusBar()->showMessage("BUILD Status: Query Failed for CPU Cooler");
            }
        }

        /**** END OF PASS TWO :: PARTS FINDER ****/
    }//CLOSE DB OPEN CHECKER
}//CLOSE getBuild
/* ||==================|| Database Functions END ||==================|| */

/* ||==================|| Trigger Functions START ||==================|| */
void MainWindow::on_saveBuild_triggered(){
    saveToFile();
}

void MainWindow::on_loadBuild_triggered(){
    loadFromFile();
}

/** close function authored by Eliazar **/
void MainWindow::on_actionQuit_triggered(){
    close();
}
/* ||==================|| Trigger Functions END ||==================|| */

/* ||==================|| Clicked Functions START ||==================|| */
/** Build a PC funtion authored by Javier R. **/
void MainWindow::on_customBut_clicked(){
    ui->textBrowser->clear();
    getAll();
    QMessageBox::information(this, "Your Search", complete);
    getBuild();
}

void MainWindow::on_dataBaseCheck_clicked(){
    ConnectDatabase();
}

void MainWindow::on_templateBut_clicked(){
    templateSearch();
}
/* ||==================|| Clicked Functions END ||==================|| */
