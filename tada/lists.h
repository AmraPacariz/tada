#ifndef LISTS_H
#define LISTS_H

#include <QObject>
#include <QVector>

struct ListsItem
{
    int number;
    QString name;

};

class Lists : public QObject
{
    Q_OBJECT
public:
    explicit Lists(QObject *parent = nullptr);

    QVector<ListsItem> items() const;

    bool setItemAt(int index, const ListsItem &item);

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    void appendItem(const QString& name);
  //  void removeCompletedItems();

private:
    QVector<ListsItem> mItems;
};
#endif // LISTS_H
