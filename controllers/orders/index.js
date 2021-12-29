const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;
const Order = require('../../models').Order;
const Sequelize =  require("sequelize")
module.exports = {
    getAllOrders: async(req, res, next)=>{
        // res.send({"status": "All Orders"})
        var userId = 1
        Cart.findAll({
            where: {
                accountId: userId
            }
        }).then(carts => {
            // Uncomment once auth is implemented
            // Order.findAll({
            //     where: {
            //         cartId: {
            //             [Sequelize.Op.in]: carts.map(cart => cart.cartId)
            //         }
            //     }
            // })
            return Order.findAll()
            .then(orders => res.status(200).send(orders))
            .catch(error => res.status(400).send(error))
        
        }
        ).then(orders =>  {
            console.log("ORDERS: ", orders)
            res.status(200).send(orders)})
        .catch(error => {
            console.log(error)
            res.status(500).send(error)
        });
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