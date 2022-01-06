const Category = require('../../models').Category;
const Product = require('../../models').Product;
const ProductType = require('../../models').ProductType;


module.exports = {
    getAllCategories: async(req, res, next)=>{
        return Category.findAll({
            // include: [{
            //     model: ProductType,
            //     // as: "Products"
            // }]
            include: {
                all: true,
                nested: true
            }
            // include: ProductType
        })
        .then(result => res.status(200).send(result))
        .catch(error => res.status(400).send(error));
    },

    getCategoryById: async(req, res, next) => {
        console.log("Called")
        res.send({
            "status" : `Category ${req.params.id}`
        })
    },

    createCategory: async(req, res, next) => {
        var category = await Category.create(req.body)
        return category.save()
            .then(result => res.status(200).send(result))
            .catch(error => res.status(400).send(error));

    }
}