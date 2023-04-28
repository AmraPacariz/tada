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
    QString getName(int index) const;
    int getNumber(int index) const;

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();
    void preNumberIncremented(int index);
    void postNumberIncremented(int index);
    void preNumberDecremented(int index);
    void postNumberDecremented(int index);
public slots:
    void appendItem(const QString& name);

    void incrementNumberSlot(int index);
    void decrementNumberSlot(int index);


private:
    QVector<ListsItem> mItems;
};
#endif // LISTS_H
