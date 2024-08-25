#include "labelsmodel.h"

LabelsModel::LabelsModel(QObject *parent)
    : QAbstractTableModel(parent)
{ 
    for (int i = 0; i < 5; ++i) {
        m_data.append({"174.118.29.101","Tasha"});
    }
}

QVariant LabelsModel::headerData(int section, Qt::Orientation orientation, int role) const
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
            default:
                return QString("Column %1").arg(section + 1);
        }
    }
    return QVariant();
}

int LabelsModel::rowCount(const QModelIndex &/*&parent*/) const
{
    return m_data.count();
}

int LabelsModel::columnCount(const QModelIndex &/*parent*/) const
{
    return m_data.at(0).count();
}

QVariant LabelsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (index.row() >= m_data.size() || index.row() < 0)
        return QVariant();
    if (role == Qt::DisplayRole) {
        return m_data.at(index.row()).at(index.column());
    }
    return QVariant();
}
