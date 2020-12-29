#include <iostream>
#include <QtDebug>

#include "dataadapter.h"

using namespace std;

DataAdapter::DataAdapter()
{

}

void DataAdapter::callMeFromQml(QString str)
{
    qDebug("Inside callMeFromQml()");
    QTextStream Qcout(stdout);
    Qcout << str;
}
