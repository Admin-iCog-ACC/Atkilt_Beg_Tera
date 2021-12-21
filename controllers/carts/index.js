const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;

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

        if(cartItem == null){
            res.status(404)
        }

        return cartItem.destroy()
        .then(cartItem => res.status(200).send(cartItem))
        .catch(error => res.status(400).send(error));f
    }
}