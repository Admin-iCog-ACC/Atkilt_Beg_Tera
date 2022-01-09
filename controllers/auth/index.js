const jwt = require('jsonwebtoken')
const authConfig = require("../../config/auth")
const RefreshToken = require('../../models').RefreshToken
const BlacklistedToken = require('../../models').BlacklistedToken
const { getTokenFromRequest, parseTokenDetails } =  require("../../middlewares/authMiddleware")
const { v4: uuidV4 } = require("uuid")
const Sequelize = require("../../models").sequelize


module.exports = {
    login: async(req, res, next) => {
        var tokenId = uuidV4();
        var token = jwt.sign({email: "mike@gmail.com", tokenId}, authConfig.authSecret, {
            expiresIn: authConfig.accessTokenDuration // 24 hours
        });
        
        var refreshToken = await RefreshToken.createToken({accountId: 3}, tokenId)
        
        res.status(200).send({
            status: token,
            refreshToken
        })
    },
    
    signup: async(req, res, next) => {
        res.status(200).send({
            status: "you have signed up successfully"
        })
    },
    
    logout: async(req, res, next) => {
        const transaction = await Sequelize.transaction();
        let token = getTokenFromRequest(req)
        let tokenDetails = parseTokenDetails(token)
        console.log("details")
        console.log(tokenDetails)
        var blacklist = await BlacklistedToken.create({
            token: token,
            expires: tokenDetails.exp,
            iat: tokenDetails.iat
        }, {transaction})

        var removeRefresh = await RefreshToken.destroy({
            where: {
                tokenId: tokenDetails.tokenId
            }
        }, {transaction})

        transaction.commit()
        .then(success => res.status(204).send())
        .catch(error => req.status(403).send())
    },

    refreshToken: async(req, res, next) => {
        let { refreshToken } = req.body
        if(!refreshToken){
            return res.status(403).send({
                error: "Refresh Token not provided"
            })
        }
        let refreshTokenEntries = await RefreshToken.findAll({
            where: {
                token: refreshToken
            }
        })

        if(!refreshTokenEntries.length){
            return res.status(403).send({
                status: "Invalid Refresh Token"
            })
        }

        //delete refresh token;

        var refreshTokenEntry = refreshTokenEntries[0]
        var { accountId } = refreshTokenEntry;
        await refreshTokenEntry.destroy()

        var newTokenId = uuidV4();
        var token = jwt.sign({email: "mike@gmail.com", newTokenId}, authConfig.authSecret, {
            expiresIn: authConfig.accessTokenDuration // 24 hours
        });

        var newRefreshToken = await RefreshToken.createToken({accountId}, newTokenId)
        
        res.status(200).send({
            status: token,
            refreshToken: newRefreshToken
        })
    }
}