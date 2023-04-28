#include "listsmodel.h"

#include "lists.h"

ListsModel::ListsModel(QObject *parent)
    : QAbstractListModel(parent)
    , mList(nullptr)
{
}

int ListsModel::rowCount(const QModelIndex &parent) const
{

    if (parent.isValid() || !mList)
        return 0;

    return mList->items().size();
}

QVariant ListsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList)
        return QVariant();

    const ListsItem item = mList->items().at(index.row());
    switch (role) {
    case NumberRole:
        return QVariant(item.number);
    case NameRole:
        return QVariant(item.name);
    }

    return QVariant();
}

bool ListsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!mList)
        return false;

   ListsItem item = mList->items().at(index.row());
    switch (role) {
    case NumberRole:
        item.number = value.toInt();
        break;
    case NameRole:
        item.name = value.toString();
        break;
    }

    if (mList->setItemAt(index.row(), item)) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;

}

Qt::ItemFlags ListsModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> ListsModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[NameRole] = "name";
    names[NumberRole] = "number";
    return names;
}

Lists *ListsModel::list() const
{
    return mList;
}

void ListsModel::setList(Lists *list)
{
    beginResetModel();

    if (mList)
        mList->disconnect(this);

    mList = list;

    if (mList) {
        connect(mList, &Lists::preItemAppended, this, [=]() {
            const int index = mList->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &Lists::postItemAppended, this, [=]() {
            endInsertRows();
        });

        connect(mList, &Lists::preItemRemoved, this, [=](int index) {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &Lists::postItemRemoved, this, [=]() {
            endRemoveRows();
        });
        connect(mList, &Lists::preNumberIncremented, this, [=](int index) {
           beginResetModel();

        });
        connect(mList, &Lists::postNumberIncremented, this, [=](int index) {
          endResetModel();

        });
        connect(mList, &Lists::preNumberDecremented, this, [=](int index) {
           beginResetModel();

        });
        connect(mList, &Lists::postNumberDecremented, this, [=](int index) {
          endResetModel();

        });
    }

    endResetModel();
}
