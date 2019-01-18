#include "orderscontroller.h"
#include <QDebug>

OrdersController::OrdersController(QObject *parent)
    : QAbstractListModel(parent)
{
    roles_[Name] = "Name";
    roles_[City] = "City";
    roles_[Street] = "Street";
    roles_[Phone] = "Phone";
    roles_[Address] = "Address";
    roles_[Type] = "Type";
    roles_[TypeWindow] = "TypeWindow";
    roles_[Width] = "Width";
    roles_[Height] = "Height";
    roles_[Description] = "Description";
    AllOrders::Instance()->getOrders();
}

OrdersController::~OrdersController()
{

}

QModelIndex OrdersController::index(int row, int column, const QModelIndex &parent) const
{
    return hasIndex(row, column, parent) ? createIndex(row, column) : QModelIndex();
}

QModelIndex OrdersController::parent(const QModelIndex &child) const
{
    Q_UNUSED(child)
    return QModelIndex();
}

int OrdersController::rowCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : AllOrders::Instance()->getOrders().size();
}

int OrdersController::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : 1;
}

QVariant OrdersController::data(const QModelIndex &index, int role) const
{
    if(!index.isValid() || index.column() != 0 || index.row() < 0 || index.row() > AllOrders::Instance()->getOrders().size())
        return QVariant();

    auto currentOrder = AllOrders::Instance()->getOrders()[index.row()];

    switch (role) {
    case Name: return currentOrder->client.name;
    case City: return currentOrder->client.city;
    case Street: return currentOrder->client.street;
    case Phone: return currentOrder->client.phone;
    case Address: return QString("%1 %2").arg(currentOrder->client.street).arg(currentOrder->client.city);
    }

    return QVariant();
}

QHash<int, QByteArray> OrdersController::roleNames() const
{
    return roles_;
}

void OrdersController::addOrder(QString idOrder, QString name, QString city, QString street, QString phone)
{
    beginInsertRows(QModelIndex(), AllOrders::Instance()->getOrders().size(), AllOrders::Instance()->getOrders().size());
    Order *order = new Order();
    order->idOrder = idOrder.toInt();
    order->client.name = name;
    order->client.city = city;
    order->client.street = street;
    order->client.phone = phone;
    AllOrders::Instance()->getOrders().push_back(order);
    auto countOrders = AllOrders::Instance()->getOrders().size();
    AllOrders::Instance()->addNewOrder(order);
    AllOrders::Instance()->setCurrentIndex(countOrders);
    endInsertRows();
}

int OrdersController::currentInderOrder() const
{
    return currentInderOrder_;
}

void OrdersController::setCurrentInderOrder(int currentInderOrder)
{
    if (currentInderOrder_ == currentInderOrder)
        return;
    AllOrders::Instance()->setCurrentIndex(currentInderOrder);
    currentInderOrder_ = currentInderOrder;
    emit currentInderOrderChanged(currentInderOrder_);
}

