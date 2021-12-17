var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var cartsRouter = require("./routes/carts")
var ordersRouter = require("./routes/orders")
var indexRouter = require('./routes/index');
var productsRouter = require('./routes/products');
var accountsRouter = require('./routes/accounts');
var categoriesRouter = require('./routes/categories')
var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
// app.use(express.static(path.join(__dirname, 'public')));


//Defining routes: all middleware should go in the definition logic of these routes
app.use('/', indexRouter);
app.use("/carts", cartsRouter);
app.use("/orders", ordersRouter);
app.use("/products", productsRouter);
app.use("/accounts", accountsRouter);
app.use("/categories", categoriesRouter)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  res.send({
    "error": "endpoint endpoint does not exist or has not been implemented"
  })
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
});

module.exports = app;
