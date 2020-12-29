#ifndef DATAADAPTER_H
#define DATAADAPTER_H

#include <QObject>
#include <QString>

using namespace std;

class DataAdapter : public QObject
{
    Q_OBJECT
public:
    DataAdapter();
public slots:
    void callMeFromQml(QString str);
};

#endif // DATAADAPTER_H
