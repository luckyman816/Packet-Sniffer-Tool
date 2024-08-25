#include "toolsmodel.h"

ToolsModel::ToolsModel(QObject *parent)
    : QAbstractTableModel(parent)
{

    tools_data.append({"IP Address","1.1.1.1"});
    tools_data.append({"Internet Server Provider","Cloudfare, Inc"});
    tools_data.append({"Internet Organisation",""});
    tools_data.append({"Hostname","one.one.one.one"});
    tools_data.append({"Latitude","-33.8688"});
    tools_data.append({"Longitude","151.209"});
    tools_data.append({"Postal/ZIP Code","1001"});
}

QVariant ToolsModel::headerData(int section, Qt::Orientation orientation, int role) const
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

int ToolsModel::rowCount(const QModelIndex &) const
{
    return tools_data.count();
}

int ToolsModel::columnCount(const QModelIndex &) const
{
    return tools_data.at(0).count();
}

QVariant ToolsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (index.row() >= tools_data.size() || index.row() < 0)
        return QVariant();
    if (role == Qt::DisplayRole) {
        return tools_data.at(index.row()).at(index.column());
    }
    return QVariant();
}
