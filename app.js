var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
//express-session
var session = require('express-session');

var routes = require('./routes/index');
var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
//app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//express-session
app.use(session({
    secret : 'admin',
    name : 'name',
    resave : false,
    saveUninitialized : true,
    cookie : {maxAge: 90000}
}));

app.use('/', routes);
app.use('/users', users);

//登录拦截器
// app.use(function(req, res, next){
//     var url = req.originalUrl;//获取浏览器中当前访问的nodejs路由地址
//     var userCookies = req.cookies.userCookies;//获取客户端存取的cookie，userCookies为cookie的名称
//     console.log("123" + url);
//     console.log("app获得cookie" + req.cookies.userCookies + "真假11111" + (req.cookies.userCookies == undefined));
//     if(url != '/' && !(userCookies == undefined)){//通过判断控制用户登录后不能访问登录页面
//         return res.redirect('/login');//页面重定向
//     }
//     next();
// });

app.use(function(req, res, next){
    var url = req.originalUrl;
    if(url != "/" && !req.session.user){
        return res.redirect('/');
    }
    next();
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

app.ready = function(server) {
    routes.prepareSocketIO(server);
};

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By", ' 3.2.1')
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});

module.exports = app;