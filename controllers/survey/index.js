const Category = require('../../models').Category;
const Survey = require('../../models').Survey;
const VegetableRetailerSurvey = require('../../models').VegetableRetailerSurvey;
const LivestockRetailerSurvey = require('../../models').LivestockRetailerSurvey;
const WholesaleSurvey = require('../../models').WholesaleSurvey;
const Sequelize = require("../../models").sequelize
const ProductType = require('../../models').ProductType;
const requestServices = require("../../services/request")

const transaction = Sequelize.transaction();

module.exports = {
    getAllSurveys: async(req, res, next)=>{
        return Survey.findAll({})
        .then(result => res.status(200).send(result))
        .catch(error => res.status(400).send(error));
    },

    getCategoryById: async(req, res, next) => {
        console.log("Called")
        res.send({
            "status" : `Category ${req.params.id}`
        })
    },

    fillSurvey: async(req, res, next) => {
        var userId = await requestServices.getUserId(req)
        var survey = await Survey.create({...req.body, filledBy: userId})
        return survey.save()
            .then(result => res.status(200).send(result))
            .catch(error => res.status(400).send(error));
    },

    wholesalerSurvey: async(req, res, next) => {
        var userId = await requestServices.getUserId(req)
        var survey = await WholesaleSurvey.create({...req.body, filledBy: userId})
        return survey.save()
            .then( result => res.status(200).send(result))
            .catch( error => res.status(401).send())
    },

    vegetableSurvey: async(req, res, next) => {
        var userId = await requestServices.getUserId(req)
        var survey = await VegetableRetailerSurvey.create({...req.body, filledBy: userId})
        return survey.save()
            .then( result => res.status(200).send(result))
            .catch( error => res.status(401).send())
    },

    livestockSurvey: async(req, res, next) => {
        var userId = await requestServices.getUserId(req)
        var survey = await LivestockRetailerSurvey.create({...req.body, filledBy: userId})
        return survey.save()
            .then( result => res.status(200).send(result))
            .catch( error => res.status(401).send())
    }
}
