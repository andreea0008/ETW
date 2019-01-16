#pragma once

#include <QAbstractListModel>

struct Client
{
    QString name;
    QString city;
    QString street;
    QString phone;
};

struct Order{
    Client clientData;
    QString type;
    QString typeWindow = "";
    QString width;
    QString height;
    QString description;
};



class OrdersController : public QAbstractListModel
{
    Q_OBJECT
    QVector<Order*> orders_;
    QHash<int, QByteArray> roles_;
    enum Roles { Name, City, Street, Phone, Type, TypeWindow, Width, Height, Description };

public:
    OrdersController(QObject *parent);
    virtual ~OrdersController() override;


public:
    QModelIndex index(int row, int column, const QModelIndex &parent) const override;
    QModelIndex parent(const QModelIndex &child) const override;
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void addOrder(QString name, QString city, QString street,
                              QString phone, QString type, QString typeWindow,
                              QString width, QString height, QString description);
};
//OrdersController orderController(&engine);
//engine.rootContext()->setContextProperty("OrderController", &orderController);
