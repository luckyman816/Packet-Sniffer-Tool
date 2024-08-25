#ifndef ARPDATABASE_H
#define ARPDATABASE_H

#include <QAbstractTableModel>
#include <QObject>
class ArpDatabase : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit ArpDatabase(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
    QVector<QVector<QString>> arp_data;
};

#endif // ARPDATABASE_H
