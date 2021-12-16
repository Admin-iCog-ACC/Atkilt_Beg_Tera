module.exports = {
    getAllOrders: async(req, res, next)=>{
        res.send({"status": "All Orders"})
    },

    getOrderById: async(req, res, next) => {
        console.log("Called")
        res.send({
            "status" : `Order ${req.params.id}`
        })
    },

    createOrder: async(req, res, next) => {
        res.send({
            "status": "Created a new cart"
        })
    }
}