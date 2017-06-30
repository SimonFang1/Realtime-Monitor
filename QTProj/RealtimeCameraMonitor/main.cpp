//#include <QApplication>
//#include "mainwindow.h"

//int main(int argc, char *argv[])
//{
//    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();

//    return a.exec();
//}

#include <QtGui>
#include "processImage.h"

int main(int argc,char *argv[])
{
    QApplication app(argc,argv);
    ProcessImage process;
    process.resize(640,480);
    process.show();

    return app.exec();
}
