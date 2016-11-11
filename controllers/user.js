module.exports = {
    doLogout: function(req, res,next){
        req.session.destroy(function(err){
            if(err){
                return next(err);
            }else{
                res.redirect("/login");
            }
        });
    },
    isLogin: function(req, res, next){
        if(!req.session.user){
            res.redirect("/login");
            return false;
        }
        next();
    }
}