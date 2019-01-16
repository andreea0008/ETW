#include "orders.h"
AllOrders * AllOrders::instance = nullptr;

QVector<Order *> AllOrders::getOrders() const
{
    return orders;
}
