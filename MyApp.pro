TEMPLATE = app

TARGET = weatherinfo

QT += qml quick
QT += core network positioning qml quick
CONFIG += c++11

SOURCES += main.cpp \
    App/CPP/WeatherApp/appmodel.cpp \
    App/CPP/QtTextEditor/backend.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

target.path = $$[QT_INSTALL_EXAMPLES]/positioning/weatherinfo
INSTALLS += target


HEADERS += \
    App/Headers/TextEditor/todomodel.h \
    App/Headers/WeatherApp/appmodel.h \
    App/Headers/QtTextEditor/backend.h
