var express = require("express")
var router = express.Router()

var controllers = require("../../controllers/categories")

//GET METHODS
router.get("/", controllers.getAllCategories)
router.get("/:id", controllers.getCategoryById)


router.post("/", controllers.createCategory)


module.exports = router