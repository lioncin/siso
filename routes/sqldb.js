'use strict'

var config = require('../model/dbconnection.js');
var Sequelize = require('sequelize');
var db = {
    sequelize: new Sequelize(config.sequelize.database, config.sequelize.username, config.sequelize.password, config.sequelize)
};
db.printer = db.sequelize.import('../model/printer.js');
db.fault = db.sequelize.import('../model/fault.js');
db.person = db.sequelize.import('../model/person.js');
db.printertype = db.sequelize.import('../model/printertype.js');
db.faulttype = db.sequelize.import('../model/faulttype.js');
db.group = db.sequelize.import('../model/group.js');
db.faultlog = db.sequelize.import('../model/faultlog.js');
db.customer = db.sequelize.import('../model/customer.js');
db.faultreport = db.sequelize.import('../model/faultreport.js');
db.supplyreport = db.sequelize.import('../model/supplyreport.js');
db.maintreport = db.sequelize.import('../model/maintreport.js');
db.maintain = db.sequelize.import('../model/maintain.js');
db.paper = db.sequelize.import('../model/paper.js');

db.user = db.sequelize.import('../model/user.js');
db.application = db.sequelize.import('../model/application.js');
db.represult = db.sequelize.import('../model/represult.js');
db.supresult = db.sequelize.import('../model/supresult.js');
db.evaluation=db.sequelize.import('../model/evaluation');

db.supplytype = db.sequelize.import('../model/supplytype.js');

module.exports = db;