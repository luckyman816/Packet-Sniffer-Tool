#ifndef TABLEMODEL_H
#define TABLEMODEL_H
#include <QAbstractTableModel>
class TableModel : public QAbstractTableModel {
    Q_OBJECT
public:
    explicit TableModel(QObject *parent = nullptr);
    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    // Fetches data for display:
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    // Header data for column titles:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
private:
    QVector<QVector<QString>> m_data;
};
#endif // TABLEMODEL_H
