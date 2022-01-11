const Product = require('../../models').Product;
const ProductType = require('../../models').ProductType;
const ProductImage = require('../../models').ProductImage;
const ProductItemAttribute = require('../../models').ProductItemAttribute;
const ProductTypeAttribute = require('../../models').ProductTypeAttribute;
const Attribute = require('../../models').Attribute;
const sequelize = require("../../models").sequelize;

module.exports = {
    getAllProducts: async(req, res, next)=>{
        return Product
        .findAll({
            include: [{
                model: ProductItemAttribute,
                as: "attributes",
                include: {
                    model: ProductTypeAttribute,
                    include: {
                        model: Attribute
                    }
                }
            },{
                model: ProductType,
                // as: "productType",
            },
            {
                model: ProductImage,
                as: "images"
            }]
        })
       
            
        .then(products => {
            var productsResponse = [];
            products.forEach(element => {
            //    for(var i = 0; i < element.images.length; i++){
            //        element.images[i] = element.images[i].resourceUrl
            //    }
                var dataValue = element.dataValues;
                console.log("THIS IS THE SINGLE PRODUCT: ", dataValue)
                if(dataValue.ProductType && dataValue.ProductType.categoryId){
                    dataValue.categoryId = dataValue.ProductType.categoryId
                    dataValue.ProductType = undefined
                    productsResponse.push(dataValue)
                }
            });
            res.status(200).send(productsResponse)    
        })
        .catch(error => res.status(400).send(error));
    },

    getProductById: async(req, res, next) => {
        return Product
        .findByPk(
            req.params.id,
            {
            include: [{
                model: Attribute,
                as: "attributes"
            },{
                model: ProductImage,
                as: "images"
            }]
        })
        .then(products => {
            console.log("THIS IS THE PRODUCT, ", products)
            if(products == null){
                res.status(404).send({
                    status: "Item not found"
                })
            }
            res.status(200).send(products)
        })
        .catch(error => {
            console.log(error)
            res.status(400).send(error)
        });
    },

    createProduct: async(req, res, next) => {
        var product = await Product.create(req.body)
        var productTypeId = req.params.productTypeId;
        var transaction =  await sequelize.transaction();

        var productTypeAttributes = await ProductTypeAttribute.findAll({
            where: {
                productTypeId: productTypeId
            }
        })
        
        var productModel = await Product.create({
            ...req.body,
            productTypeId: productTypeId
        }, {transaction})

        if(req.body.attributes){
            var attrs = req.body.attributes
            // console.log("HERE IS THE MAP: ", map)
            var attributes = await ProductItemAttribute.bulkCreate(
                attrs.map(attr => {
                    // attr.productId = productModel.id
                    return {
                        productId: productModel.id,
                        productTypeAttributeId: attr.productTypeAttributeId,
                        value: attr.value
                    };
                })
            , {transaction})
            // await attributes.save()
        }

        if(req.body.images){
            var productImages  = req.body.images;
            var images = await ProductImage.bulkCreate(
                productImages.map(attr => {
                     return {
                        resourceUrl: attr,
                        productId: productModel.id
                    };
                })
            , {transaction})
        }

        return transaction.commit()
        .then(product => {
            return Product.findByPk(productModel.id, {
            include: [
                {
                model: ProductItemAttribute,
                as: "attributes",
                include: {
                    model: ProductTypeAttribute,
                    include: {
                        model: Attribute
                    }
                }
            },
            {
                model: ProductImage,
                as: "images"
            }]
        }).then(product => res.status(200).send(product))
        })
        .catch(error => res.status(400).send(error));
    }
}
