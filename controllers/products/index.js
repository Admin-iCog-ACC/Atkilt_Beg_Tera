const Product = require('../../models').Product;
const ProductImage = require('../../models').ProductImage;
const Attribute = require('../../models').Attribute;

module.exports = {
    getAllProducts: async(req, res, next)=>{
        return Product
        .findAll({
            include: [{
                model: Attribute,
                as: "attributes"
            },{
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
        if(req.body.attributes){
            var attrs = req.body.attributes
            // console.log("HERE IS THE MAP: ", map)
            var attributes = await Attribute.bulkCreate(
                attrs.map(attr => {
                    attr.productId = product.id
                    return attr;
                })
            )
            // await attributes.save()
        }

        return product.save()
        .then(product => res.status(200).send(product))
        .catch(error => res.status(400).send(error));

    }
}
