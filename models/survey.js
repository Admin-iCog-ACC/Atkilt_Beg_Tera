'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Survey extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Survey.init({
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    phone: DataTypes.STRING,
    jobTitle: DataTypes.STRING,
    businessName: DataTypes.STRING,
    description: DataTypes.STRING,
    address: DataTypes.STRING,
    filledBy: DataTypes.STRING,
    addressLatitude: DataTypes.FLOAT,
    addressLongitude: DataTypes.FLOAT
  }, {
    sequelize,
    modelName: 'Survey',
  });
  return Survey;
};