var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/carts")

//GET METHODS
router.get("/", controllers.getAllCarts)
router.get("/:id", controllers.getCartbyId)


router.post("/", controllers.createCart)


module.exports = router