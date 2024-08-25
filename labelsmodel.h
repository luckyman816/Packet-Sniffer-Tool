#ifndef LABELSMODEL_H
#define LABELSMODEL_H

#include <QAbstractTableModel>

class LabelsModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit LabelsModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
    QVector<QVector<QString>> m_data;
};

#endif // LABELSMODEL_H
