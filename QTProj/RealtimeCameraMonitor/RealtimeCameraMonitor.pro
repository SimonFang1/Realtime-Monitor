#-------------------------------------------------
#
# Project created by QtCreator 2017-06-26T21:08:01
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = RealtimeCameraMonitor
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    videodevice.cpp \
    processImage.cpp

HEADERS  += mainwindow.h \
    videodevice.h \
    processImage.h

FORMS    += mainwindow.ui
