'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class DeliveryResponse extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      DeliveryResponse.belongsTo(models.Order, {
        onDelete: "CASCADE",
        foreignKey: "orderId"
      })

      DeliveryResponse.belongsTo(models.Driver, {
        foreignKey: "driverId",
        onDelete: "SET NULL"
      })
    }
  };
  DeliveryResponse.init({
    response: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'DeliveryResponse',
  });
  return DeliveryResponse;
};