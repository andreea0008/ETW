#include "orderscontroller.h"

OrdersController::OrdersController(QObject *parent)
    : QAbstractListModel(parent)
{
    roles_[Name] = "Name";
    roles_[City] = "City";
    roles_[Street] = "Street";
    roles_[Phone] = "Phone";
    roles_[Type] = "Type";
    roles_[TypeWindow] = "TypeWindow";
    roles_[Width] = "Width";
    roles_[Height] = "Height";
    roles_[Description] = "Description";

    orders_.push_back(new Order());
    orders_.push_back(new Order());
    orders_.push_back(new Order());
    orders_.push_back(new Order());

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
    return parent.isValid() ? 0 : orders_.size();
}

int OrdersController::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : 1;
}

QVariant OrdersController::data(const QModelIndex &index, int role) const
{
    if(!index.isValid() || index.column() != 0 || index.row() < 0 || index.row() > orders_.size())
        return QVariant();

    auto currentOrder = orders_[index.row()];

    switch (role) {
    case Name: return currentOrder->clientData.name;
    case City: return currentOrder->clientData.city;
    case Street: return currentOrder->clientData.street;
    case Phone: return currentOrder->clientData.phone;
    case Type: return currentOrder->type;
    case TypeWindow: return currentOrder->typeWindow;
    case Width: return currentOrder->width;
    case Height: return currentOrder->height;
    case Description: return currentOrder->description;
    }

    return QVariant();
}

QHash<int, QByteArray> OrdersController::roleNames() const
{
    return roles_;
}

void OrdersController::addOrder(QString name, QString city, QString street, QString phone, QString type,
                                QString typeWindow, QString width, QString height, QString description)
{
    beginInsertRows(QModelIndex(), orders_.size(), orders_.size());
    Order * newOrder = new Order();
    newOrder->clientData.name = name;
    newOrder->clientData.city = city;
    newOrder->clientData.street = street;
    newOrder->clientData.phone = phone;
    newOrder->type = type;
    newOrder->typeWindow = typeWindow;
    newOrder->width = width;
    newOrder->height = height;
    newOrder->description = description;
    endInsertRows();
}

