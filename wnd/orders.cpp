#include "orders.h"
#include <QDebug>

AllOrders * AllOrders::instance = nullptr;

AllOrders::AllOrders()
{
    Order *order1 = new Order();
    Client client1;
    client1.city = "Toronto";
    client1.name = "John Talor";
    client1.phone = "+1(969)-699-5435";
    order1->client = client1;
    Decoration dec1Client1;
    dec1Client1.description = "fsdfdsf";
    dec1Client1.height = "344";
    dec1Client1.width = "500";
    dec1Client1.typeWindow = "Vinyl window";
    dec1Client1.typeWindow = "Bow window";
    Decoration dec1Client2;
    dec1Client2.description = "fsdfdsf";
    dec1Client2.height = "344";
    dec1Client2.width = "500";
    dec1Client2.typeWindow = "Vinyl window";
    dec1Client2.typeWindow = "Bow window";
    order1->decorations.push_back(dec1Client1);
    order1->decorations.push_back(dec1Client2);
    orders.push_back(order1);
    qDebug() << "sise order list: " << orders.size();
}

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
    qDebug() << __FUNCTION__ << currentIndex;
    currentIndex_ = currentIndex;
}
