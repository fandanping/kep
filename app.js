var express = require('express');
var app = express();
app.use(require('body-parser')());
//引入session中间件
var session = require('express-session');
app.set('port', process.env.PORT || 3000);

//routes
var index = require('./routes/index');
var user = require('./routes/user');
var topic = require('./routes/topic');


//设置handlebars视图引擎，并设置main.handlebars为默认模板
var handlebars =require('express3-handlebars').create({
    defaultLayout:'main',
    helpers: {
        section: function(name, options){
            if(!this._sections) this._sections = {};
            this._sections[name] = options.fn(this);
            return null;
        },
        //新增辅助方法，作用：索引值加1
        addOne: function(index){
            //利用+1的时机，在父级循环对象中添加一个_index属性，用来保存父级每次循环的索引
            this._index = index+1;
            //返回+1之后的结果
            return this._index;
        }
    }
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

//全局变量里存储user信息中间件
app.use(function(req, res, next){
    res.locals.user = req.session.user;
    next();
});

//routes
app.use('/', index);
app.use('/user', user);
app.use('/topic', topic);

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