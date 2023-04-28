#include "lists.h"


Lists::Lists(QObject *parent) : QObject(parent)
{
    mItems.append({ 0, QStringLiteral("Job") });
    mItems.append({ 0, QStringLiteral("Home") });
     mItems.append({ 0, QStringLiteral("Kids") });
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

QString Lists::getName(int index) const
{
      return mItems.at(index).name;

}

int Lists::getNumber(int index) const
{
    return mItems.at(index).number;
}
void Lists::appendItem(const QString& name)
{
    emit preItemAppended();
    ListsItem item;
    item.name = name;
    item.number = 0;
    mItems.append(item);

    emit postItemAppended();
}


void Lists:: incrementNumberSlot(int index)//novo
{
    emit preNumberIncremented( index);
    if (index < 0 || index >= mItems.size())
        return;

     ++mItems[index].number;;
    emit postNumberIncremented( index);
}

void Lists::decrementNumberSlot(int index)
{
    emit preNumberDecremented(index);
    if (index < 0 || index >= mItems.size())
        return;

     --mItems[index].number;
    emit postNumberDecremented(index);
}

