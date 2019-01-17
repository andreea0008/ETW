#include "decoratecontroller.h"

DecorateController::DecorateController(QObject *parent)
    : QAbstractListModel(parent)
{
    roles_[Type] = "Type";
    roles_[TypeWindow] = "TypeWindow";
    roles_[Width] = "Width";
    roles_[Height] = "Height";
    roles_[Description] = "Description";
    currentOrder_ = new Order();
}

QModelIndex DecorateController::index(int row, int column, const QModelIndex &parent) const
{
    return hasIndex(row, column, parent) ? createIndex(row, column) : QModelIndex();
}

QModelIndex DecorateController::parent(const QModelIndex &child) const
{
    Q_UNUSED(child)
    return QModelIndex();
}

int DecorateController::rowCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : currentOrder_->decorations.size();
}

int DecorateController::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : 1;
}

QVariant DecorateController::data(const QModelIndex &index, int role) const
{
    if(!index.isValid() || index.column() != 0 || index.row() < 0 || index.row() > currentOrder_->decorations.size())
        return QVariant();

    auto currentOrderDecoration = currentOrder_->decorations[index.row()];

    switch (role) {
    case Type: return currentOrderDecoration.type;
    case TypeWindow: return currentOrderDecoration.typeWindow;
    case Width: return currentOrderDecoration.width;
    case Height: return currentOrderDecoration.height;
    case Description: return currentOrderDecoration.description;
    }

    return QVariant();
}

QHash<int, QByteArray> DecorateController::roleNames() const
{
    return roles_;
}

void DecorateController::update()
{
    int currentIndex = AllOrders::Instance()->getCurrentIndex();
    currentOrder_ = AllOrders::Instance()->getOrders()[currentIndex];
}

void DecorateController::addDecoration(QString typeWindowOrDoor, QString typeWindow, QString width, QString height, QString description)
{
    int currentIndex = AllOrders::Instance()->getCurrentIndex();
    currentOrder_ = AllOrders::Instance()->getOrders()[currentIndex];
    beginInsertRows(QModelIndex(), currentOrder_->decorations.size(), currentOrder_->decorations.size());
    Decoration decoration;
    decoration.description = description;
    decoration.height = height;
    decoration.width = width;
    decoration.type = typeWindowOrDoor;
    decoration.typeWindow = typeWindow;
    currentOrder_->decorations.push_back(decoration);
    endInsertRows();
}
