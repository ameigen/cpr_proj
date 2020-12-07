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

    if (file.open(QIODevice::ReadWrite)) // If the file is open, begin read/write.
    {
        QTextStream stream(&file); // "Stream" = Write to the file, stream << is like cin.
        stream << "Is this a new test?"; // Test Text
    }
}

/* saveToFile function authored by Lyndsey. A majority of the graphical section (mainwindow.ui)
 * was designed by Lyndsey, as well. */

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
}

/* loadFromFile function authored by Jonathan, and
 * textBrowser view box (right side window of UI) authored by Jonathan */

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
       QString category = dialog.getQuery();
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
    Dialog dialog;
    dialog.setModal(true);
    dialog.exec();

    QString category = ("Category: " + dialog.getQuery());
    return category;
}

QString MainWindow::getPlatform(){
    search search;
    search.setModal(true);
    search.exec();

    platform = search.getPlatform();
    graphics = search.getGraphics();
    QString tempBudget = search.getPrice();
     qDebug() << tempBudget;
    budget = tempBudget.toDouble();
     qDebug() << budget;
     QString all = ("\nCPU: " + platform + "\nGraphics: " + graphics + "\nBudgetString: " + tempBudget + "\nBudgetInt: " + budget);
    return all;
    ui->textBrowser->setText(platform);
}

void MainWindow::on_dataBaseCheck_clicked()
{
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
    QString one = getCategory();
    QString two = getPlatform();
    ui->textBrowser->setText(one + ", " + two);
}
