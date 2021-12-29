const Product = require('../../models').Product;
const ProductType = require('../../models').ProductType;
const Category = require('../../models').Category;
const ProductImage = require('../../models').ProductImage;
const Attribute = require('../../models').Attribute;

module.exports = {
    getAllProductTypes: async(req, res, next)=>{
        return ProductType
        .findAll({
            include: [{
                model: Category,
                as: 'Category'
            }]
        })
        .then(products => {
            var response = products.map(element => element.dataValues)
            response.forEach(element => {
                element.category = element.Category;
                element.Category = undefined;
                console.log(element.categoryId)
            });
            console.log(response)
            res.status(200).send(response)
        
        })
        .catch(error => res.status(400).send(error));
    },

    getProductTypeById: async(req, res, next) => {
        return ProductType
        .findByPk(
            req.params.id,
            {
            include: [{
                model: Product,
                as: "products"
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

    createProductType: async(req, res, next) => {
        if(!req.body.name){
            return res.status(400).send({
                error: "Malformed request body"
            })
        }
        var category = await Category.findByPk(req.body.categoryId)
        if(category == null){
            return res.status(400).send({
                error: "Category does not exist"
            })
        }

        var productType = await ProductType.create(req.body)
        productType.save()
        .then(productType => res.status(200).send(productType))
        .catch(error => res.status(400).send(error))
    },


    deleteProductType: async(req, res, next) => {
    },


}
