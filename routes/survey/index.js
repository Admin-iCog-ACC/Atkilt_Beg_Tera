var express = require("express")
var router = express.Router()

var SurveyControllers = require("../../controllers/survey")
//POST METHODS
router.post("/", SurveyControllers.fillSurvey)
router.get("/", SurveyControllers.getAllSurveys)

module.exports = router