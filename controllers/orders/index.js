const orderServices = require("../../services/orders")

const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;
const Order = require('../../models').Order;
const requestServices = require('../../services/request')

const Sequelize =  require("sequelize")
module.exports = {
    getAllOrders: async(req, res, next)=>{
        // res.send({"status": "All Orders"})
        var userId = 1
        Cart.findAll({
            where: {
                accountId: requestServices.getUserId(req)
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
            return Order.findAll({
                include: {
                    model: Cart,
                    include: {
                        model: CartItem,
                        as: "cartItems",
                        include: {
                            model: Product,
                        }
                    }
                },
                    // where: {
                    // cartId: {
                    //     [Sequelize.Op.in]: carts.map(cart => cart.id)
                    // }
                // }
            })
            .then(orders => res.status(200).send(orders))
            .catch(error => res.status(400).send(error))
        
        })
        // ).then(orders =>  {
        //     console.log("ORDERS: ", orders)
        //     res.status(200).send(orders)})
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
    },

    progressOrder: async(req, res, next) => {
        var orderId = req.params.id;
        var order = await Order.findByPk(orderId);

        if(order == null){
            return res.status(404).send({
                error: "Order does not exist"
            })
        }

        order.status = orderServices.getNextStatus(order.status)
        
        return order.save()
        .then( order => res.status(200).send(order))
        .catch(error => res.status(500).send(error))
        // res.send({
        //     "status": "progressing Order" + req.params.id
        // })
    }
}