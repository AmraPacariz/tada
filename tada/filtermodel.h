#ifndef FILTERMODEL_H
#define FILTERMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>
class FilterModel : public QSortFilterProxyModel
{
    Q_OBJECT

  public:
      explicit FilterModel(QObject *parent = nullptr);

  protected:
      bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;

  private:
      QString m_filterListNumber;
};

#endif // FILTERMODEL_H
