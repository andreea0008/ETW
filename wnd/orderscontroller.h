#pragma once

#include <QAbstractListModel>

#include "orders.h"

class OrdersController : public QAbstractListModel
{
    Q_OBJECT
    QVector<Order*> orders_;
    QHash<int, QByteArray> roles_;

public:
    enum Roles { Name, City, Street, Phone, Type, TypeWindow, Width, Height, Description };
    OrdersController(QObject *parent);
    virtual ~OrdersController() override;

public:
    QModelIndex index(int row, int column, const QModelIndex &parent) const override;
    QModelIndex parent(const QModelIndex &child) const override;
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void addOrder(QString idOrder, QString name, QString city, QString street, QString phone);
};
