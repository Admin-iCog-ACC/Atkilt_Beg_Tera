module.exports = {
    getAllCarts: async(req, res, next)=>{
        res.send({"status": "Success"})
    },

    getCartbyId: async(req, res, next) => {
        res.send({
            "status" : `Success ${req.params.id}`
        })
    },

    createCart: async(req, res, next) => {
        res.send({
            "status": "Create a new cart"
        })
    }
}