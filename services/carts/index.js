const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;




module.exports = {
    createOrGetCart: async() => {
        var currentCart = await Cart.findOne({
            where: {
                checkedOut: false
            },

            include: {
                all: true,
                nested: true
            }
            // include: {
            //     all: true,
            //     nested: true
            // }
        })
    
        console.log(currentCart.id)

        if(currentCart.id == null){
            console.log("--> Creating new cart")
            currentCart = await Cart.create({
                accountId: null,
                checkedOut: false
            })
            await currentCart.save()
        }
        return currentCart
    }
}