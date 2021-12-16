var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/orders")

//GET METHODS
router.get("/", controllers.getAllOrders)
router.get("/:id", controllers.getOrderById)


router.post("/", controllers.createOrder)


module.exports = router