var express = require("express")
var router = express.Router()

var SurveyControllers = require("../../controllers/survey")
//POST METHODS
router.post("/wholesaler", SurveyControllers.wholesalerSurvey)
router.post("/vegetableRetailer", SurveyControllers.vegetableSurvey)
router.post("/livestockRetailer", SurveyControllers.livestockSurvey)
router.get("/", SurveyControllers.getAllSurveys)

module.exports = router