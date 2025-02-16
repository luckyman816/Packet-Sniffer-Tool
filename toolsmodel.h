#ifndef TOOLSMODEL_H
#define TOOLSMODEL_H

#include <QAbstractTableModel>

class ToolsModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit ToolsModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
    QVector<QVector<QString>> tools_data;
};

#endif // TOOLSMODEL_H
