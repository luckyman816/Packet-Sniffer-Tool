#include "gamemodel.h"
GameModel::GameModel(QObject *parent)
    : QAbstractTableModel(parent) {
    m_data.append({"Apex Legands (TESTING)","Server","Universal"});
    m_data.append({"Brawlhalla","Server","Universal"});
    m_data.append({"Call of Duty","Server","Universal"});
    m_data.append({"Discord Voice","Server","PC"});
    m_data.append({"FIFA [2021 Or Newer]","Server","Universal"});
}
int GameModel::rowCount(const QModelIndex & /*parent*/) const {
    return m_data.count();
}
int GameModel::columnCount(const QModelIndex & /*parent*/) const {
    // Assuming all rows have the same number of columns here
    return m_data.at(0).count();
}
QVariant GameModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid())
        return QVariant();
    if (index.row() >= m_data.size() || index.row() < 0)
        return QVariant();
    if (role == Qt::DisplayRole) {
        return m_data.at(index.row()).at(index.column());
    }
    return QVariant();
}
QVariant GameModel::headerData(int section, Qt::Orientation orientation, int role) const {
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
