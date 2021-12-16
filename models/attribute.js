'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Attribute extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Attribute.belongsTo(models.Product, {
        foreignKey: "productId",
        onDelete: "CASCADE"
      })
    }
  };
  Attribute.init({
    name: DataTypes.STRING,
    option: DataTypes.STRING,
    isVisible: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Attribute',
  });
  return Attribute;
};