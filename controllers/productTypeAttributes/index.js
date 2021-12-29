const Product = require('../../models').Product;
const ProductType = require('../../models').ProductType;
const Category = require('../../models').Category;
const ProductImage = require('../../models').ProductImage;
const ProductTypeAttribute = require('../../models').ProductTypeAttribute;
const AttributeOption = require('../../models').AttributeOption;
const sequelize = require("../../models").sequelize

module.exports = {
    assignAttributes: async(req, res, next) => {
        var attributes = req.body.attributes;
        attributes = attributes.map(element => {return {...element, productTypeId: parseInt(req.params.id)}})
        // var attributeModels = [];
        const transaction = await sequelize.transaction();
        
        try{
            var createdAttributes = []
            await Promise.all(attributes.map(async(element) => {
                var attributeModel = await ProductTypeAttribute.create({...element, productTypeId: parseInt(req.params.id)}, {transaction})
                // var optionModel = await AttributeOption.create(option)
                console.log(attributeModel.dataValues)
                if(element.options){
                    var options = element.options.map(element => { 
                        return {
                            productTypeAttributeId: attributeModel.id,
                            value: element
                        }
                    })
                    console.log("AATTRR OPOTIONS: ",options)
                    var options = await AttributeOption.bulkCreate(options, {transaction: transaction})
                    createdAttributes.push({
                        ...attributeModel.dataValues,
                        options
                    })
                }
                // res.status(201).send(attributeModel)
                // return transaction.commit()
                // .then(_ => res.status(200).send(attrs))    
                // .catch(error => res.status(400).send(error))
                console.log("Done")
            }))
            console.log("Got here")
            transaction.commit()
            .then(_ => res.status(200).send({
                createdAttributes
            }))
        }catch(error){
            console.log(error)
            res.status(400).send(error)
        }
    }
}