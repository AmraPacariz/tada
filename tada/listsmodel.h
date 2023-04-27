#ifndef LISTSMODEL_H
#define LISTSMODEL_H

#include <QAbstractListModel>

Q_MOC_INCLUDE("lists.h")

class Lists;

class ListsModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(Lists *list READ list WRITE setList)

public:
    explicit ListsModel(QObject *parent = nullptr);

    enum {
            NameRole = Qt::UserRole + 1,
            NumberRole
        };


    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    Lists *list() const;
    void setList(Lists *list);

private:
    Lists *mList;
};
#endif // LISTSMODEL_H
