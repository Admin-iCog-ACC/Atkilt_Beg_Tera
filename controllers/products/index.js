const Product = require('../../models').Product;
const ProductImage = require('../../models').ProductImage;
const ProductItemAttribute = require('../../models').ProductItemAttribute;
const ProductTypeAttribute = require('../../models').ProductTypeAttribute;
const Attribute = require('../../models').Attribute;
const sequelize = require("../../models").sequelize;

module.exports = {
    getAllProducts: async(req, res, next)=>{
        return Product
        .findAll({
            include: [
                {
                model: ProductItemAttribute,
                as: "attributes"
            },
            {
                model: ProductImage,
                as: "images"
            }]
        })
       
            
        .then(products => {
            //products.forEach(element => {
            //    for(var i = 0; i < element.images.length; i++){
            //        element.images[i] = element.images[i].resourceUrl
            //    }
            //});
            res.status(200).send(products)    
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
        .catch(error => res.status(400).send(error));
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
                    attr.productId = productModel.id
                    return attr;
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
        .then(product => res.status(200).send(product))
        .catch(error => res.status(400).send(error));
    }
}
