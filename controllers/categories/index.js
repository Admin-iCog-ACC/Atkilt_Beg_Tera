const Category = require('../../models').Category;
const Product = require('../../models').Product;


module.exports = {
    getAllCategories: async(req, res, next)=>{
        return Category.findAll({
            include: [{
                model: Product,
                as: "products"
            }]
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