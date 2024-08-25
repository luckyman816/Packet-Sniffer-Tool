#include "tablemodel.h"
TableModel::TableModel(QObject *parent)
    : QAbstractTableModel(parent) {
    // Initialize your model data
    // Here we add 5 rows of example data with 4 columns
    // Adjust the number of columns and data as per your requirements
    for (int i = 0; i < 5; ++i) {
        m_data.append({"10.0. 0.0 - 10.255. 255.255.","Label","USA","Label", "New York","Label", ""});
    }
}
int TableModel::rowCount(const QModelIndex & /*parent*/) const {
    return m_data.count();
}
int TableModel::columnCount(const QModelIndex & /*parent*/) const {
    // Assuming all rows have the same number of columns here
    return m_data.at(0).count();
}
QVariant TableModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid())
        return QVariant();
    if (index.row() >= m_data.size() || index.row() < 0)
        return QVariant();
    if (role == Qt::DisplayRole) {
        return m_data.at(index.row()).at(index.column());
    }
    return QVariant();
}
QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const {
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
            case 3:
                return QStringLiteral("Column 4");
            case 4:
                return QStringLiteral("Column 5");
            case 5:
                return QStringLiteral("Column 6");
            // Add more columns as needed
            default:
                return QString("Column %1").arg(section + 1);
        }
    }
    return QVariant();
}
