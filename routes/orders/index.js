var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/orders")

//GET METHODS
router.get("/", controllers.getAllOrders)
router.get("/:id", controllers.getOrderById)


router.post("/", controllers.createOrder)
router.post("/:id/progressOrder", controllers.progressOrder)


module.exports = router