#include "filtermodel.h"


#include "todomodel.h"

FilterModel::FilterModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{

}

bool FilterModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);

    if (index.isValid()) {
        ToDoModel *model = static_cast<ToDoModel* >(sourceModel());
        int number = model->data(index, ToDoModel::ListNumberRole).toInt();

        QString pattern = QString::number(number);


        return  filterRegularExpression().match(pattern).hasMatch();
    }

    return false;
}
