#include "App/Headers/QtTextEditor/backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{
    m_path = QCoreApplication::applicationDirPath();
    m_path.append("/file.txt");
}

QString Backend::path()
{
    return m_path;
}

void Backend::setPath(QString valuePath)
{
    m_path = valuePath;
    m_path.remove("file://");
    emit pathChanged();
}

QString Backend::data()
{
    QFile file(m_path);
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning("can not read file!!");
        return "";
    }
    QTextStream stream(&file);
    QString value = stream.readAll();
    file.close();
    return value;
}

void Backend::setData(QString valueData)
{
    QFile file(m_path);
    if (!file.open(QIODevice::WriteOnly)) {
        qWarning("can not write file!!");
//        return ;
    }
    QTextStream stream(&file);
    stream << valueData;
    stream.flush();
    file.close();

    emit dataChanged();
}






















