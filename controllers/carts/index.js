const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;
const Order = require('../../models').Order;

const cartServices = require('../../services/carts')

createOrGetCart: async() => {
    var currentCart = await Cart.findAll({
        where: {
            checkedOut: false
        }
    })

    if(currentCart == null){
        currentCart = await Cart.create({
            accountId: null,
            checkedOut: false
        })
    }
    return currentCart
}

module.exports = {
    getAllCarts: async(req, res, next)=>{
        try{
            var cart = await cartServices.createOrGetCart();
            console.log("[X] GOT HERE" ,cart)
            var subTotals = cart.cartItems.map(cartItem => cartItem.total)
            console.log(subTotals)
            var total = subTotals.reduce((partial_sum, a) => partial_sum + a, 0);
            return res.status(200).send(
                {
                    ...cart.dataValues,
                    total
                }
            )
        }catch(error){
                console.log(error)
                res.status(400).send(error)
        } 
    },

    getCartbyId: async(req, res, next) => {
        cartServices.createOrGetCart()
        .then(cart => res.status(200).send(cart))
        .catch(error =>{
            console.log(error)
            res.status(400).send(error)
        });
    },

    createCart: async(req, res, next) => {
        cartServices.createOrGetCart()
        .then(cart => res.status(200).send(cart))
        .catch(error => res.status(400).send(error));
    },

    addItem: async(req, res, next) => {
        if(!req.body.quantity || !req.body.product || !req.body.product.id){
            return res.status(400).send({
                status: "Malformed request"
            })
        }

        var cart = await cartServices.createOrGetCart();
        console.log("Request: ", req.body )
        var product = await Product.findByPk(req.body.product.id,);

        if(product == null){
            res.status(404)
        }

        var cartItem = await CartItem.create({
            cartId: cart.id,
            quantity: req.body.quantity,
            total: product.price * req.body.quantity,
            productId: product.id,
        })

        return cartItem.save()
        .then(cartItem => res.status(200).send(cartItem))
        .catch(error => res.status(400).send(error));
    },

    removeItem: async(req, res, next) => {
        var cartItemId = req.params.id;
        var cart = await cartServices.createOrGetCart();
        console.log("Request: ", req.body )
        var cartItem = await CartItem.findOne({
            where: {
                id: cartItemId,
                cartId: cart.id
            }
        });

	console.log("This is the product found", cartItem)

        if(cartItem == null){
            return res.status(404).send({
		"status": "The item was not found in the cart"
	    })
        }

        return cartItem.destroy()
        .then(cartItem => res.status(200).send(cartItem))
        .catch(error => res.status(400).send(error));
    },
    
    updateItem: async(req, res, next) => {
        if(!req.body.quantity || req.body.quantity < 1){
            res.status(400).send({
                "error": "Request body is not formatted correctly"
            })
        }

        var cartItemId = req.params.id;
        var cart = await cartServices.createOrGetCart();
        console.log("Request: ", req.body )
        var cartItem = await CartItem.findOne({
            where: {
                id: cartItemId,
                cartId: cart.id
            }
        });

        if(cartItem == null){
            return res.status(404)
        }

        cartItem.quantity = req.body.quantity;
        return cartItem.save()
        .then(cartItem => res.status(200).send(cartItem))
        .catch(error => res.status(400).send(error));   
    },

    checkout: async(req, res, next) => {
        var cart = await cartServices.createOrGetCart();
        console.log("Request: ", req.body )
        if(cartItem == null){
            return res.status(404).send
        }

        cart.checkedOut = true;
        var cartSubtotal = cartServices.getCartSubtotal(cart.id)
        var totalTax = orderServices.getTax(cartSubtotal)
        var totalShipping = orderServices.getShippingPrice()
        var total = totalTax + totalShipping + subTotal
        var shippingAddress = req.body.shippingAddress
        var billingAddress = req.body.billingAddress

        cart.save().then(cart => {
            var order = Order.create({
                status: "Order Received",
                total: total,
                subTotal: cartSubtotal,
                totalTax: totalTax,
                totalShipping: totalShipping,
                paymentMethod: "Cash On Delivery",
                customerNote: req.body.customerNote,
                billingAddress: billingAddress,
                shippingAddress: shippingAddress,
                cartId: cart.id
            })

            order.save()
            .then(order => res.status(201).send({
                status: "Cart Checked Out",
                order: order
            }))
            .catch(error => res.status(500).send(error))
        })
        .catch(error => res.status(500).send(error))


        // return cartItem.save()
        // .then(cartItem => res.status(200).send(cartItem))
        // .catch(error => res.status(400).send(error));   
    }
}
