var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/products")

//GET METHODS
router.get("/", controllers.getAllProducts)
router.get("/:id", controllers.getProductById)


// router.post("/", controllers.createProduct)


module.exports = router