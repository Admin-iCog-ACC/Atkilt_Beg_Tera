var express = require("express")
var router = express.Router()

var ProductTypecontrollers = require("../../controllers/productTypes")
var productItemController = require("../../controllers/products")
var attributeControllers = require("../../controllers/productTypeAttributes")
//GET METHODS
router.get("/", ProductTypecontrollers.getAllProductTypes)
router.get("/:id", ProductTypecontrollers.getProductTypeById)


router.post("/", ProductTypecontrollers.createProductType)
router.delete("/:id", ProductTypecontrollers.deleteProductType)

router.post("/:productTypeId/products/", productItemController.createProduct)

router.post("/:id/attributes", attributeControllers.assignAttributes)
module.exports = router