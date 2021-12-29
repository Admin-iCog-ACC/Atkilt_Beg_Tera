var express = require("express")
var router = express.Router()

var ProductTypecontrollers = require("../../controllers/productTypes")
var attributeControllers = require("../../controllers/productTypeAttributes")
//GET METHODS
router.get("/", ProductTypecontrollers.getAllProductTypes)
router.get("/:id", ProductTypecontrollers.getProductTypeById)


router.post("/", ProductTypecontrollers.createProductType)
router.delete("/:id", ProductTypecontrollers.deleteProductType)



router.post("/:id/attributes", attributeControllers.assignAttributes)
module.exports = router