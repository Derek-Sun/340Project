module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getTools(res, mysql, context, complete){
        var queryString = "SElECT * FROM Tool";
        mysql.pool.query(queryString, function (error, results, fields){
            if (error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Tools = results;
            complete();
        });
    }

    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getTools(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('tools', context)
            }
        }
    });

    router.get('/:id', function(req,res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedTool.js", "updateTool.js"];
        var mysql = req.app.get('mysql');
        
    })


    return router;
}();
