const Vendor = require('../../models').Vendor
const Account = require('../../models').Account

module.exports = {
    getVendorById: async(req, res, next) => {
        var vendorId = parseInt(req.params.vendorId)
        console.log(Vendor)
        var vendor = await Vendor.findByPk(vendorId)
        if(!vendor){
            return res.status(404).send({
                status: "Vendor doesn't exist"
            })
        }

        var account = await Account.findByPk(vendor.accountId)
        return res.status(200).send({
            firstName: account.dataValues.firstName,
            lastName: account.dataValues.lastName,
            ...vendor.dataValues
        })
    }
}