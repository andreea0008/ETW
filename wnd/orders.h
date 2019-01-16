#pragma once
#include <QString>
#include <QVector>

struct Client
{
    QString name;
    QString city;
    QString street;
    QString phone;
};

struct Decoration{
    QString type;
    QString typeWindow = "";
    QString width;
    QString height;
    QString description;
};

struct Order
{
    int idOrder;
    Client client;
    QVector<Decoration> decorations;
};

class AllOrders
{
    AllOrders(){}
    AllOrders(AllOrders&) = delete ;
    void operator =(AllOrders const&) = delete;
    static AllOrders *instance;
    QVector<Order*> orders;

public:
    static AllOrders *Instance()
    {
        if(instance == nullptr)
            instance = new AllOrders;
        return instance;
    }

    QVector<Order *> getOrders() const;
};
