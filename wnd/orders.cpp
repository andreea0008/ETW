#include "orders.h"
AllOrders * AllOrders::instance = nullptr;

void AllOrders::addNewOrder(Order *order)
{
    orders.push_back(order);
}

QVector<Order *> AllOrders::getOrders() const
{
    return orders;
}

int AllOrders::getCurrentIndex() const
{
    return currentIndex_;
}

void AllOrders::setCurrentIndex(int currentIndex)
{
    currentIndex_ = currentIndex;
}
