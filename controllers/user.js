module.exports = {
    doLogout: function(req, res,next){
        req.session.destroy(function(err){
            if(err){
                return next(err);
            }else{
                res.redirect("/login");
            }
        });

    }
}