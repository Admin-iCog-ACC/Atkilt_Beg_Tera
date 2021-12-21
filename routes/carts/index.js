var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/carts")

//GET METHODS
router.get("/", controllers.getAllCarts)
router.get("/:id", controllers.getCartbyId)


// router.post("/", controllers.createCart)
router.post("/item", controllers.addItem)

router.delete("/item/:id", controllers.removeItem)


module.exports = router