var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});

app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');
app.set('port', 1214);
app.set('mysql', mysql);

app.use('/stack', require('./stack.js'));

/*
app.get('/tools', function(req,res){
  var queryString = "SElECT * FROM Tool";
  var context = {};
  mysql.pool.query(queryString, function (error, results, fields){
    if (error){
        res.write(JSON.stringify(error));
        res.end();
    }
    context.Tools = results;
    res.render('tools', context)
    console.log(context);
  });
});
*/

app.use('/tools', require('./tools.js'));


app.use(function(req,res){
    res.status(404);
    res.render('404');
  });
  
  app.use(function(err, req, res, next){
    console.error(err.stack);
    res.status(500);
    res.render('500');
  });
  
  app.listen(app.get('port'), function(){
    console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
  });