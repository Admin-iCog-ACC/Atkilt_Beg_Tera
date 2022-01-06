const Cart = require('../../models').Cart;
const CartItem = require('../../models').CartItem;
const Product = require('../../models').Product;
const lodash = require('lodash')



module.exports = {
    getTax: (subtotal) => {
        // var itemSubtotals  = lodash.sum(cartItems.map(item => item.total))
        return subtotal * 0.15
    },


    getShippingPrice: () => {
        return 150
    },

    getNextStatus: (currentStatus) => {
        switch(currentStatus.toLowerCase()){
            case 'order received':
                return 'Order Processed';
            default:
                return currentStatus;    
        }
    }
}