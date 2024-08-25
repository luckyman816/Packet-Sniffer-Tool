#include "arpdatabase.h"

ArpDatabase::ArpDatabase(QObject *parent)
    : QAbstractTableModel(parent)
{
    for(int i=0; i<10; i++){
        arp_data.append({"10.0.0.0-10.255.255.255", "Label", "Label"});
    }
}

QVariant ArpDatabase::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role != Qt::DisplayRole)
        return QVariant();
    if (orientation == Qt::Horizontal) {
        // Return the name of the column
        switch (section) {
            case 0:
                return QStringLiteral("Column 1");
            case 1:
                return QStringLiteral("Column 2");
            case 2:
                return QStringLiteral("Column 3");
            // Add more columns as needed
            default:
                return QString("Column %1").arg(section + 1);
        }
    }
    return QVariant();
}

int ArpDatabase::rowCount(const QModelIndex &) const
{
     return arp_data.count();
}

int ArpDatabase::columnCount(const QModelIndex &) const
{
   return arp_data.at(0).count();
}

QVariant ArpDatabase::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (index.row() >= arp_data.size() || index.row() < 0)
        return QVariant();
    if (role == Qt::DisplayRole) {
        return arp_data.at(index.row()).at(index.column());
    }
    return QVariant();
}

