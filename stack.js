module.exports = function(){
    var express = require('express');
    var router = express.Router();

    /* Routes to ./stack and displays all company stack and tools
    */
    
    function getCompanies(res, mysql, context, complete){
        mysql.pool.query("SELECT name FROM Company", function (error, results, fields){
            if (error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Company = results;
            complete();
        });
    }

    function getFields(res, mysql, context, complete){
        mysql.pool.query("SELECT Company.name as companyName, Field.name as fieldName from Field INNER JOIN Company ON Company.FieldID = Field.id", function (error, results, fields){
            if (error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Fields = results;
            complete();
        });
    }

    function getTools(res, mysql, context, complete){
        var queryString = "SELECT Company.name as companyName, Tool.name as toolName FROM Tool INNER JOIN "+
        "toolsinStack ON Tool.id = toolsinStack.tid INNER JOIN "+
        "Stack ON Stack.id = toolsinStack.sid INNER JOIN "+
        "Company ON Company.id = Stack.cid";
        mysql.pool.query(queryString, function (error, results, fields){
            if (error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Tools = results;
            complete();
        });
    }

    function getCode(res, mysql, context, complete){
        var queryString = "SELECT Company.name as companyName, Code.name as codeName FROM Code INNER JOIN "+
        "codeinStack ON Code.id = codeinStack.cid INNER JOIN "+
        "Stack ON Stack.id = codeinStack.sid INNER JOIN "+
        "Company ON Company.id = Stack.cid";
        mysql.pool.query(queryString, function (error, results, fields){
            if (error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Code= results;
            complete();
        });
    }
    
    //list with objects-- Doesn't work
    /*
    function buildTable(c, t, co, f, l){
        //Iterate through every company
        for (var i=0; i < c.Company.length; i++){
            var temp = c.Company[i];
            var newObject = new Object();
            newObject.compName = c.Company[i];
            //Iterate through fields
            for (var j = 0; j < f.Fields.length; j++){
                if (f.Fields[j].companyName == temp){
                    newObject.field = f.Fields[j];
                }
            }
            for (var k = 0; k < t.Tools.length; k++){
                var toolList = [];
                if (t.Tools[k].companyName = temp){
                    toolList.push(t.Tools[k].toolName);
                }
                newObject.tool = toolList;
            }
            for (var m = 0; m < co.Code.length; m++){
                var codeList = [];
                if (co.Code[m].companyName = temp){
                    codeList.push(co.Code[m].codeName);
                }
            }
            l.push(newObject);
        }
        console.log(c.Company.length)
    }
    */

    router.get('/', function(req, res){
        var callbackCount = 0;
        //var company = {};
        //var tool = {};
        //var code = {};
        //var field = {};
        //var list = [];
        var context = {};
        var mysql = req.app.get('mysql');
        getCompanies(res, mysql, context, complete);
        getFields(res, mysql, context, complete);
        getTools(res, mysql, context, complete);
        getCode(res, mysql, context, complete);
        //buildTable(company, tool, code, field, list);
        //Complete function makes sure the callbacks are finished before populating page
        function complete(){
            callbackCount++;
            if(callbackCount >= 4){
                res.render('stack', context);
                //console.log(company);
                //console.log(field);
                //console.log(tool);
                //console.log(code);
                //console.log(list);
            }

        }
    });
    
    return router;
}();


/*SELECT Company.name, Tool.name FROM Tool INNER JOIN
toolsinStack ON Tool.id = toolsinStack.tid INNER JOIN
Stack ON Stack.id = toolsinStack.sid INNER JOIN
Company ON Company.id = Stack.cid GROUP BY Tool.name*/