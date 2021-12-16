'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Order extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Order.hasMany(models.OrderedItem, {
        foreignKey: "orderId",
        as: "products"
      }),

      Order.belongsTo(models.Address, {
        foreignKey: "shippingAddress",
        onDelete: "SET NULL"
      })


      Order.belongsTo(models.Address, {
        foreignKey: "billingAddress",
        onDelete: "SET NULL"
      })
    }
  };
  Order.init({
    status: DataTypes.STRING,
    total: DataTypes.FLOAT,
    totalTax: DataTypes.FLOAT,
    totalShipping: DataTypes.FLOAT,
    paymentMethodTitle: DataTypes.STRING,
    paymentMethod: DataTypes.STRING,
    shippingMethodTitle: DataTypes.STRING,
    customerNote: DataTypes.STRING,
    subTotal: DataTypes.FLOAT,
    deliveryStatus: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Order',
  });
  return Order;
};