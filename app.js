var express = require('express');
var app = express();
app.use(require('body-parser')());
//引入session中间件
var session = require('express-session');
app.set('port', process.env.PORT || 3000);


//设置handlebars视图引擎，并设置main.handlebars为默认模板
var handlebars =require('express3-handlebars').create({
    defaultLayout:'main'
    /*helpers: {
        section: function(name, options){
            if(!this._sections) this._sections = {};
            this._sections[name] = options.fn(this);
            return null;
        }
    }*/
});
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.use(session({
    secret: '123',
    cookie: {maxAge: 3600000},
    rolling: true,
    resave: true,
    saveUninitialized: true
}));
//配置静态资源
app.use(express.static(__dirname+'/static'));

app.get('/', function(req, res){
    res.render("index");
})


//定制404页面
app.use(function(req, res){
    //res.type('text/plain');
    res.status(404);
    //res.send('error 404');
    res.render('404');
})
//定制500页面
app.use(function(req, res){
    //res.type('text/plain');
    res.status(500);
    //res.send('error 500');
    res.render('500');
})

//配置服务器监听
app.listen(app.get('port'), function(){
    console.log("server start");
})