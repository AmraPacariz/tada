#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{

}

QVector<ToDoItem> ToDoList::items() const
{
    return mItems;
}

bool ToDoList::setItemAt(int index, const ToDoItem &item)
{
    if (index < 0 || index >= mItems.size())
        return false;

    const ToDoItem &oldItem = mItems.at(index);
    if (item.done == oldItem.done && item.description == oldItem.description && item.listNumber == oldItem.listNumber)
        return false;

    mItems[index] = item;
    return true;
}

void ToDoList::appendItem(const QString& description, int listNumber)
{
    emit preItemAppended();

    ToDoItem item;
    item.done = false;
    item.description=description;
    item.listNumber=listNumber;
    mItems.append(item);

    emit postItemAppended();
}

int  ToDoList::removeCompletedItems()
{
    int count=0;
    for (int i = 0; i < mItems.size(); ) {
        if (mItems.at(i).done) {
            emit preItemRemoved(i);

            mItems.removeAt(i);
            ++count;
            emit postItemRemoved();
        } else {
            ++i;
        }
    }
    return count;
}
void ToDoList::removeItem(int index)
{
    if (index < 0 || index >= mItems.size())
        return;

    emit preItemRemoved(index);
    mItems.removeAt(index);
    emit postItemRemoved();
}
