#include "gametable.h"

GameTable::GameTable(QObject *parent)
    : QAbstractTableModel(parent)
{
}

QVariant GameTable::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int GameTable::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int GameTable::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant GameTable::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}
