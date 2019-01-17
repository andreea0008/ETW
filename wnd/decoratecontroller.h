#pragma once

#include <QAbstractListModel>
#include "orders.h"

class DecorateController : public QAbstractListModel
{
    Q_OBJECT
    QHash<int, QByteArray> roles_;
    Order *currentOrder_;
public:
    enum Roles { Type, TypeWindow, Width, Height, Description };
    DecorateController(QObject *parent);

    QModelIndex index(int row, int column, const QModelIndex &parent) const override;
    QModelIndex parent(const QModelIndex &child) const override;
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void update();
    Q_INVOKABLE void addDecoration(QString typeWindowOrDoor, QString typeWindow, QString width, QString height, QString description);
};

