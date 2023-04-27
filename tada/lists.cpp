#include "lists.h"

Lists::Lists(QObject *parent) : QObject(parent)
{
    mItems.append({ 7, QStringLiteral("Job") });
    mItems.append({ 7, QStringLiteral("Home") });
     mItems.append({ 8, QStringLiteral("Kids") });
}

QVector<ListsItem> Lists::items() const
{
    return mItems;
}

bool Lists::setItemAt(int index, const ListsItem &item)
{
    if (index < 0 || index >= mItems.size())
        return false;

    const ListsItem &oldItem = mItems.at(index);
    if (item.number == oldItem.number && item.name == oldItem.name)
        return false;

    mItems[index] = item;
    return true;
}
void Lists::appendItem(const QString& name)
{
    emit preItemAppended();
    ListsItem item;
    item.name = name;
    item.number = 3;
    mItems.append(item);

    emit postItemAppended();
}
