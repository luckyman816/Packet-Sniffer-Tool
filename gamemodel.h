#ifndef GAMEMODEL_H
#define GAMEMODEL_H

#include <QAbstractTableModel>

class GameModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit GameModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
    QVector<QVector<QString>> m_data;
};

#endif // GAMEMODEL_H
