#ifndef GAMETABLE_H
#define GAMETABLE_H

#include <QAbstractTableModel>

class GameTable : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit GameTable(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
};

#endif // GAMETABLE_H
