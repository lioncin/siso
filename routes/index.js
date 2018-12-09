var express = require('express');
var router = express.Router();
var qr_image = require('qr-image');
var https = require("https");
var iconv = require("iconv-lite");
//importExcel 2017.6.6
var formidable = require("formidable");
var xlsx = require("node-xlsx");
//importExcel 2017.6.6
var fs = require('fs');
var path = require('path');
var socket_io = require('socket.io');
//***
//数据库连接
var db = require('./sqldb');

var multer = require('multer')
var upload = multer({ dest: './uploads/' }).any();


var appid = "wx949eb2a0f851d81c",
    secret = "4a7bec4854ca10d9032141a70fc13e41";

var WechatAPI = require('wechat-api');

var api = new WechatAPI(appid, secret);




var dbinit = false;


var token = {};
token.lasttime = 0;

db.sequelize.sync({
    force: dbinit
}).then(function() {
    if (dbinit) {
        // db.user.bulkCreate([{
        //     "username": "admin",
        //     "password": "admin"
        // }]);
        db.printertype.bulkCreate([{
            "name": "三星激光打印机",
            "type": "3325ND",
            "brand": "三星",
            "supplier": "三星代理",
            "suppliercontact": "13256524855",
            "remarks": "三星南京代理商"
        }, {
            "name": "惠普激光打印机(CE462A)",
            "type": "LaserJetP2035n",
            "brand": "惠普",
            "supplier": " ",
            "suppliercontact": " ",
            "remarks": " "
        }, {
            "name": "施乐激光打印机",
            "type": "apstor3306",
            "brand": "施乐",
            "supplier": "施乐代理",
            "suppliercontact": "15298425665",
            "remarks": "施乐苏州代理商"
        }]);
        db.person.bulkCreate([{
            "name": "林星",
            "sex": 1,
            "phone": "13522556854",
            "num": "0001",
            "status": 0,
            "remarks": "测试人员1"
        }, {
            "name": "苏强",
            "sex": 1,
            "phone": "14625468756",
            "num": "0002",
            "status": 0,
            "remarks": "测试人员2"
        }, {
            "name": "跃龙",
            "sex": 1,
            "phone": "15244756658",
            "num": "0003",
            "status": 0,
            "remarks": "测试人员3"
        }]);

        db.faulttype.bulkCreate([{
            "name": "缺纸",
            "remarks": "1"
        }, {
            "name": "缺墨",
            "remarks": "2"
        }, {
            "name": "卡纸",
            "remarks": "3"
        }, {
            "name": "其他",
            "remarks": "4"
        }]);
    }
    console.log("Server successed to start");
}).catch(function(err) {
    console.log("Server failed to start due to error: %s", err);
});
//**

/* GET home page. */
router.get('/', function(req, res, next) {
    db.printer.findAll(
        //*****条件
    ).then(function(data) {
        res.render('login');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//2017.5.23 login start jingcheng
router.post('/login',function(req, res, next){
    console.log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    var username = req.body.username;
    var password = req.body.password;
    var user={
        username: username,
        password: password
    }
    req.session.user = user;
    console.log('username:' + username);
    console.log('password:' + password);
    if(username == 'admin' && password == 'admin'){
        console.log('用户名和密码一致');
        res.send('1');
        //res.redirect('/obj');
        //res.render('/obj');
    }else{
        console.log('登录失败了');
        res.end('is over');
        //res.redirect('/login');
        //res.render('/login');
    }
});
//2017.5.23 login end jingcheng

//**********************************************CRUD
//CRUD

router.get('/obj', function(req, res, next) {
    db.printer.findAll(
        //*****条件
    ).then(function(data) {
        res.render('tempobj');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

router.get('/mancustomer', function(req, res, next) {
    db.customer.findAll(
        //*****条件
    ).then(function(data) {
        res.render('customer');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

router.get('/faulttype', function(req, res, next) {
    db.faulttype.findAll(
        //*****条件
    ).then(function(data) {
        res.render('faulttype');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//getlist
router.post('/getlist', function(req, res, next) {
    eval("var dbprox = db." + req.body.tbname);
    dbprox.findAll(
        //*****条件
		//'where':{
			//'status':
		//}
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
    });
});

//getfaulttestlist jingcheng 大电视机projection.ejs用到的接口 start 2017.9.5
router.post('/getfaulttestlist', function(req, res, next) {
    eval("var dbprox = db." + req.body.tbname);
    // dbprox.findAll({
		// 'where' :{
		  // 'staff' :{
			// $ne : 1
		  // }
		// }
        // //*****条件
    // })
	
	dbprox.findAll({
        'where':{
            'staff': null
    }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
    });
});
//getfaulttestlist jingcheng 大电视机projection.ejs用到的接口 end 2017.9.5

//add
router.post('/add', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    eval("var dbprox = db." + req.body.tbname);
    dbprox.create(JSON.parse(req.body.obj)).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//delete
router.post('/delete', function(req, res, next) {
    console.log(req.body);
    eval("var dbprox = db." + req.body.tbname);
    dbprox.destroy({
        'where': {
            'id': JSON.parse(req.body.obj).id
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//edit
router.post('/edit', function(req, res, next) {
    console.log(req.body);
    eval("var dbprox = db." + req.body.tbname);
    dbprox.update(JSON.parse(req.body.obj), {
        'where': {
            'id': JSON.parse(req.body.obj).id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//query
router.post('/query', function(req, res, next) {
    console.log(req.body);
    eval("var dbprox = db." + req.body.tbname);
    dbprox.findOne({
        'where': {
            'id': JSON.parse(req.body.obj).id
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//************************************************
//页面 fault

router.get('/fault', function(req, res, next) {
    db.fault.findAll(
        //*****条件
    ).then(function(data) {
        res.render('fault');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//获取故障列表
router.post('/fault', function(req, res, next) {
    db.fault.findAll(
        //*****条件
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//上报故障
router.post('/faultadd', function(req, res, next) {
    db.fault.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

router.post('/faultdeal', function(req, res, next) {
    console.log(req.body.printerid);
    db.fault.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//删除记录
router.post('/faultdelete', function(req, res, next) {
    console.log(req.body.faultid);
    db.fault.destroy({
        'where': {
            'id': req.body.faultid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/faultedit', function(req, res, next) {
    console.log(req.body.faultid);
    db.fault.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/faultquery', function(req, res, next) {
    db.fault.findOne({
        'where': {
            'id': req.body.faultid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//page: fault end
//************************************************


//*************************************************
//page: person

//页面
router.get('/person', function(req, res, next) {
    db.person.findAll(
        //*****条件
    ).then(function(data) {
        res.render('person');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取人员列表
router.post('/person', function(req, res, next) {
    db.person.findAll(
        //*****条件
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加人员
router.post('/personadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.person.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除人员
router.post('/persondelete', function(req, res, next) {
    console.log(req.body.personid);
    db.person.destroy({
        'where': {
            'id': req.body.personid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改人员
router.post('/personedit', function(req, res, next) {
    console.log(req.body.personid);
    db.person.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取人员
router.post('/personquery', function(req, res, next) {
    db.person.findOne({
        'where': {
            'id': req.body.personid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

router.get('/personbind', getopenidbyget, function (req, res, next) {
    console.log("personbind");

    console.log(req.openid);

    db.person.update({ openid: req.openid }, {
        'where': {
            'id': req.query.id
        }
    }).then(function (result) {
        res.send("ok");
    }).catch(function (err) {
        console.dir(err);
        res.send(err);
    });
});

//page: person end
//************************************************

//*************************************************
//page: printertype

//页面
router.get('/printertype', function(req, res, next) {
    db.printertype.findAll(
        //*****条件
    ).then(function(data) {
        res.render('printertype');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取类型列表
router.post('/printertype', function(req, res, next) {
    db.printertype.findAll(
        //*****条件
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加类型
router.post('/printertypeadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.printertype.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除类型
router.post('/printertypedelete', function(req, res, next) {
    console.log(req.body.printertypeid);
    db.printertype.destroy({
        'where': {
            'id': req.body.printertypeid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改类型
router.post('/printertypeedit', function(req, res, next) {
    console.log(req.body.printertypeid);
    db.printertype.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取类型
router.post('/printertypequery', function(req, res, next) {
    db.printertype.create(req.body).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//报修记录--翟留辉--2017-08-24 10:06:07
router.post('/queryrecords',getopenid, function(req, res, next) {
	console.log('%%%%%%%&&&&&&&&**********');
	console.log('req.openid:'+ req.openid);
    db.fault.findAll({
        'where': {
           // 'id': req.body.id,
			'openid': req.openid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
})
//保修记录二次查询（查看明细）
//报修记录--翟留辉--2017-08-24 10:06:07
router.post('/recordqueryrecords', function(req, res, next) {
	console.log('你好哈哈哈哈哈');
    db.fault.findOne({
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
})
//page: fault end
//************************************************
//******************
//格式化日期----------翟留辉-------begin------
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
//格式化日期----------翟留辉-------end------
//API
router.post('/reportfault', getopenid, function(req, res, next) {

    db.fault.create({
        "name": req.body.name,
        "openid": req.openid,
        "printerid": req.body.printerid,
		"model": req.body.printermodel,
		"brand": req.body.printerbrand,
		"printertype": req.body.printertype,
        "phone": req.body.phone,
        "type": req.body.type,
		//"supplytype" : req.body.supplytype,
        "details": req.body.details,
		"realposition":req.body.realposition,
		"time":new Date().Format("yyyy-MM-dd hh:mm:ss"),//格式化日期
		"status":'5'//默认维修状态5
    }).then(function(result) {
		db.faulttype.findOne({
			'attributes': ['name'],
			'where' : {
			 'id' : result.type
			}
		}).then(function(typeresult){
        console.log("fault log!");
        var msg = {};
        msg.title = "发生故障";
        msg.name = req.body.name;
        msg.id = req.body.printerid;
		msg.printerbrand = req.body.printerbrand;
		msg.printertype = req.body.printertype;
		//硒鼓类型
		msg.printerdrumtype = req.body.printerdrumtype;
		//硒鼓类型
		msg.printerposition = req.body.printerposition;
		msg.type = typeresult.name;
		msg.realposition = req.body.realposition;
        msg.details = req.body.details;
        //msg.time = "2010-05-06 10:00:00"
		//msg.time = req.body.time;
		msg.time = new Date().toLocaleString();
        msg.remarks = "请及时维修故障设备";
		
		// db.printer.findOne({
			// 'attributes': ['manager'],
			// 'where' : {
			 // 'id' : req.body.printerid
			// }
		// }).then(function(result){
			// console.log('工作人员编号是' + result.manager);
			// db.person.findOne({
				// 'attributes': ['openid'],
				// 'where' : {
					// 'id' : result.manager
				// }
			// }).then(function(results){
				// console.log('员工openid是' + results.openid);
				// sendwxmsg(results.openid, "", msg);
			// })
		// });
		
		db.person.findAll({
			'attributes': ['openid']
		}).then(function(result){
			console.log("结果是：" + result);
			console.log("长度是：" + result.length);
			//console.log('获取到了员工的openid。。。' +　req.openid);
			for(i=0; i < result.length; i++){
				console.log("第几次: " + (i+1));
				console.log("result[i]: " + JSON.stringify(result[i]));
				console.log("result[i]: " + JSON.stringify(result[i].openid));
				sendwxmsg(result[i].openid, "", msg);
			}
		});
		
        //sendwxmsg("ohCh0wOBiDxuzhn97WTXjA6R_vZA", "", msg);
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });
	});
});

router.post('/reportfaults', getopenid, function(req, res, next) {

    db.fault.create({
        "name": req.body.name,
        "openid": req.openid,
        "printerid": req.body.printerid,
		"model": req.body.printermodel,
		"brand": req.body.printerbrand,
		"printertype": req.body.printertype,
        "phone": req.body.phone,
        "supplytype": req.body.type,
		//"supplytype" : req.body.supplytype,
        "details": req.body.details,
		"realposition":req.body.realposition,
		"status":'5'//默认维修状态5
    }).then(function(result) {
		db.supplytype.findOne({
			'attributes': ['name'],
			'where' : {
			 'id' : result.supplytype
			}
		}).then(function(typeresult){
        console.log("fault log!");
        var msg = {};
        msg.title = "发生故障";
        msg.name = req.body.name;
        msg.id = req.body.printerid;
		msg.printerbrand = req.body.printerbrand;
		msg.printertype = req.body.printertype;
		msg.printerposition = req.body.printerposition;
		msg.type = typeresult.name;
		msg.realposition = req.body.realposition;
        msg.details = req.body.details;
        //msg.time = "2010-05-06 10:00:00"
		//msg.time = req.body.time;
		msg.time = new Date().toLocaleString();
        msg.remarks = "请及时维修故障设备";
		
		// db.printer.findOne({
			// 'attributes': ['manager'],
			// 'where' : {
			 // 'id' : req.body.printerid
			// }
		// }).then(function(result){
			// console.log('工作人员编号是' + result.manager);
			// db.person.findOne({
				// 'attributes': ['openid'],
				// 'where' : {
					// 'id' : result.manager
				// }
			// }).then(function(results){
				// console.log('员工openid是' + results.openid);
				// sendwxmsg(results.openid, "", msg);
			// })
		// });
		
		db.person.findAll({
			'attributes': ['openid']
		}).then(function(result){
			console.log("结果是：" + result);
			console.log("长度是：" + result.length);
			//console.log('获取到了员工的openid。。。' +　req.openid);
			for(i=0; i < result.length; i++){
				console.log("第几次: " + (i+1));
				console.log("result[i]: " + JSON.stringify(result[i]));
				console.log("result[i]: " + JSON.stringify(result[i].openid));
				sendwxmsg(result[i].openid, "", msg);
			}
		});
		
        //sendwxmsg("ohCh0wOBiDxuzhn97WTXjA6R_vZA", "", msg);
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });
	});
});

router.post('/renewreportfault', getopenid, function(req, res, next) {

    db.fault.create({
        "name": req.body.name,
        "openid": req.openid,
        "printerid": req.body.printerid,
		"model": req.body.printermodel,
		"brand": req.body.printerbrand,
		"printertype": req.body.printertype,
        "phone": req.body.phone,
        //"type": req.body.type,
		//"supplytype" : req.body.supplytype,
        "details": req.body.details,
		"realposition":req.body.realposition,
		"status":'5'//默认维修状态5
    }).then(function(result) {
        console.log("fault log!");
        var msg = {};
        msg.title = "发生故障";
        msg.name = req.body.name;
        msg.id = req.body.printerid;
		msg.printerbrand = req.body.printerbrand;
		msg.printertype = req.body.printertype;
		//msg.printerposition = req.body.printerposition;
		//msg.type = typeresult.name;
		msg.realposition = req.body.realposition;
        msg.details = req.body.details;
        //msg.time = "2010-05-06 10:00:00"
		//msg.time = req.body.time;
		msg.time = new Date().toLocaleString();
        msg.remarks = "请及时维修故障设备";
		
		// db.printer.findOne({
			// 'attributes': ['manager'],
			// 'where' : {
			 // 'id' : req.body.printerid
			// }
		// }).then(function(result){
			// console.log('工作人员编号是' + result.manager);
			// db.person.findOne({
				// 'attributes': ['openid'],
				// 'where' : {
					// 'id' : result.manager
				// }
			// }).then(function(results){
				// console.log('员工openid是' + results.openid);
				// sendrenewwxmsg(results.openid, "", msg);
			// })
		// });
		
		db.person.findAll({
			'attributes': ['openid']
		}).then(function(result){
			console.log("结果是：" + result);
			console.log("长度是：" + result.length);
			//console.log('获取到了员工的openid。。。' +　req.openid);
			for(i=0; i < result.length; i++){
				console.log("第几次: " + (i+1));
				console.log("result[i]: " + JSON.stringify(result[i]));
				console.log("result[i]: " + JSON.stringify(result[i].openid));
				sendwxmsg(result[i].openid, "", msg);
			}
		});
		
        //sendwxmsg("ohCh0wOBiDxuzhn97WTXjA6R_vZA", "", msg);
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });
});

//TV interface
router.post('/updatestatus', function(req, res, next){
  console.log(req.body);
  if(req.body.status==1)
  {
      //req.body.deleted_at=new Date();
	  req.body.staff = 1;
  }
    //eval("var dbprox = db." + req.body.tbname);
    db.fault.update(req.body, {
        'where': {
            'printerid': req.body.printerid
        }
    }).then(function(result) {
        console.log('result:'+result);
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    }); 
});

//stafffaultlog  jingcheng start 2017/7/19
router.post('/stafffaultlog', getopenidbyget, function(req, res, next){
  db.faultlog.create({
    "printerid" : req.body.printerid,
    "time" : req.body.time,
    "represult" : req.body.represult,
    "list" : req.body.list,
    "description" : req.body.description,
    "supresult" : req.body.supresult,
    "suplist" : req.body.suplist,
    "supdescription" : req.body.supdescription
  }).then(function(result){
    res.json({ "status": 0, "result": result.get({ 'plain': true }) });
  }).catch(function(err){
    res.json({ "status": -1, "result": err });  
  });
});
//stafffaultlog  jingcheng end 2017/7/19

//翟留辉 2017.7.11 start
//报修评价
router.post('/evaluation',getopenid, function(req, res, next) {
    db.evaluation.create({
        "printerid": req.body.printerid,
        "repairevaluation": req.body.repairevaluation,
        "serviceattitude": req.body.serviceattitude,
        "technicallevel": req.body.technicallevel,
        "responsetime": req.body.responsetime
    }).then(function(result) {
        console.log(result.get({ 'plain': true }));
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });//
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });
});
//翟留辉 2017.7.11 end

router.post('/getreportlist', getopenid, function(req, res, next) {
    db.fault.findAll({
        'where': {
            "printerid": req.body.printerid,
            "openid": req.openid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
router.post('/getfaultlist', function(req, res, next) {
    db.fault.findAll({
        'where': {
            "printerid": req.body.printerid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});


router.post('/getcustomer', getopenid, function(req, res, next) {
    db.customer.findOne({
        'where': {
            "openid": req.openid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

router.post('/repairsign', getopenid, function(req, res, next) {
    db.fault.update({
        'where': {
            'printerid': req.body.printerid,
            'personid': req.body.personid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

router.post('/endrepair', getopenid, function(req, res, next) {
    db.fault.update({
        'where': {
            'printerid': req.body.printerid,
            'personid': req.body.personid,
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

router.post('/getrepairlist', function(req, res, next) {
    db.fault.findOne({
        'where': {
            'id': req.body.printertypeid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

router.post('/userconfirm', function(req, res, next) {
    getopenid(req.body.code, function(openid) {
        db.fault.update({
            'where': {
                'id': req.body.printertypeid
            }
        }).then(function(result) {
            res.send(result)
        }).catch(function(err) {
            console.dir(err);
            res.send(err);
        });
    });
});

router.get('/qrcode', function(req, res) {
    console.dir(req.query);
    var temp_qrcode = qr_image.image(req.query.str, "Q");
    res.type('png');
    temp_qrcode.pipe(res);
})

router.post('/queryprinter', function(req, res) {
    db.printer.findOne({
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
})

//*************************************************
//page: faultlog start  jingcheng 2017/4/13 维修记录

//页面
router.get('/faultlog', function(req, res, next) {
    db.faultlog.findAll(
        //*****条件
    ).then(function(data) {
        res.render('faultlog');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/faultlog', function(req, res, next) {
    db.faultlog.findAll({
            order: 'time desc'
        } //*****条件
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/faultlogadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.faultlog.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/faultlogdelete', function(req, res, next) {
    console.log(req.body.faultlogid);
    db.faultlog.destroy({
        'where': {
            'id': req.body.faultlogid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/faultlogedit', function(req, res, next) {
    console.log(req.body.faultlogid);
    db.faultlog.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/faultlogquery', function(req, res, next) {
    db.faultlog.findOne({
        'where': {
            'id': req.body.faultlogid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: faultlog end jingcheng 2017/4/13
//************************************************

//************************************************
//page: faultreport start  chenquanjun 2017/5/15 故障报表
//页面
router.get('/faultreport', function(req, res, next) {
    db.faultreport.findAll(
        //*****条件
    ).then(function(data) {
        res.render('faultreport');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/faultreport', function(req, res, next) {
    db.faultreport.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/faultreportadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.faultreport.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/faultreportdelete', function(req, res, next) {
    console.log(req.body.faultreportid);
    db.faultreport.destroy({
        'where': {
            'id': req.body.faultreportid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/faultreportedit', function(req, res, next) {
    console.log(req.body.faultreportid);
    db.faultreport.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/faultreportquery', function(req, res, next) {
    db.faultreport.findOne({
        'where': {
            'id': req.body.faultreportid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: faultreport end chenquanjun 2017/5/15
//*************************************************

//*************************************************
//page: supplyreport start  jingcheng 2017/5/15 耗材报表

//页面
router.get('/supplyreport', function(req, res, next) {
    db.supplyreport.findAll(
        //*****条件
    ).then(function(data) {
        res.render('supplyreport');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/supplyreport', function(req, res, next) {
    db.supplyreport.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/supplyreportadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.supplyreport.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/supplyreportdelete', function(req, res, next) {
    console.log(req.body.supplyreportid);
    db.supplyreport.destroy({
        'where': {
            'id': req.body.supplyreportid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/supplyreportedit', function(req, res, next) {
    console.log(req.body.supplyreportid);
    db.supplyreport.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/supplyreportquery', function(req, res, next) {
    db.supplyreport.findOne({
        'where': {
            'id': req.body.supplyreportid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: supplyreport end jingcheng 2017/5/15
//************************************************

//*************************************************
//page: maintreport start  jingcheng 2017/5/16 维护报表

//页面
router.get('/maintreport', function(req, res, next) {
    db.maintreport.findAll(
        //*****条件
    ).then(function(data) {
        res.render('maintreport');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/maintreport', function(req, res, next) {
    db.maintreport.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/maintreportadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.maintreport.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/maintreportdelete', function(req, res, next) {
    console.log(req.body.maintreportid);
    db.maintreport.destroy({
        'where': {
            'id': req.body.maintreportid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/maintreportedit', function(req, res, next) {
    console.log(req.body.maintreportid);
    db.maintreport.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/maintreportquery', function(req, res, next) {
    db.maintreport.findOne({
        'where': {
            'id': req.body.maintreportid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: maintreport end jingcheng 2017/5/16 维护报表
//************************************************
//*************************************************
//page: group start  chenquanjun 2017/5/26 组织机构

//页面
router.get('/group', function(req, res, next) {
    db.group.findAll(
        //*****条件
    ).then(function(data) {
        res.render('group');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/group', function(req, res, next) {
    db.group.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/groupadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.group.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/groupdelete', function(req, res, next) {
    console.log(req.body.groupid);
    db.group.destroy({
        'where': {
            'id': req.body.groupid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/groupedit', function(req, res, next) {
    console.log(req.body.groupid);
    db.group.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/groupquery', function(req, res, next) {
    db.group.findOne({
        'where': {
            'id': req.body.groupid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: group end chenquanjun 2017/5/26

//*************************************************
//page: customer start  jingcheng 2017/5/26 客户列表

//获取记录列表
router.post('/customer', function(req, res, next) {
    db.customer.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/customeradd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.customer.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/customerdelete', function(req, res, next) {
    console.log(req.body.customerid);
    db.customer.destroy({
        'where': {
            'id': req.body.customerid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/customeredit', function(req, res, next) {
    console.log(req.body.customerid);
    db.customer.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/customerquery', function(req, res, next) {
    db.customer.findOne({
        'where': {
            'id': req.body.customerid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: customer end jingcheng 2017/5/26 客户列表
//************************************************

//*************************************************
//page: maintain start  chenquanjun 2017/5/26 日常维护

//页面
router.get('/maintain', function(req, res, next) {
    db.maintain.findAll(
        //*****条件
    ).then(function(data) {
        res.render('maintain');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/maintain', function(req, res, next) {
    db.maintain.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/maintainadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.maintain.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/maintaindelete', function(req, res, next) {
    console.log(req.body.maintainid);
    db.maintain.destroy({
        'where': {
            'id': req.body.maintainid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/maintainedit', function(req, res, next) {
    console.log(req.body.maintainid);
    db.maintain.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/maintainquery', function(req, res, next) {
    db.maintain.findOne({
        'where': {
            'id': req.body.maintainid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: maintain end chenquanjun 2017/5/26

//page: paper start  chenquanjun 2017/5/27 纸记录

//页面
router.get('/paper', function(req, res, next) {
    db.paper.findAll(
        //*****条件
    ).then(function(data) {
        res.render('paper');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/paper', function(req, res, next) {
    db.paper.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/paperadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.paper.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/paperdelete', function(req, res, next) {
    console.log(req.body.paperid);
    db.paper.destroy({
        'where': {
            'id': req.body.paperid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/paperedit', function(req, res, next) {
    console.log(req.body.paperid);
    db.paper.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/paperquery', function(req, res, next) {
    db.paper.findOne({
        'where': {
            'id': req.body.paperid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: paper end chenquanjun 2017/5/27

//*************************************************
//page: download start  jingcheng 2017/06/01 模板下载

//页面
router.get('/download', function(req, res, next) {
        res.render('download');
});

//******************* */模板Excel下载
router.get('/downloadXML',function(req, res, next){
    var currDir = path.normalize(req.query.dir),
    //var currDir = './downloadXML',
        fileName = req.query.name,
        //fileName = 'printer.xlsx',
        currFile = path.join(currDir,fileName),
        fReadStream;
    
    console.log(fileName);

    fs.exists(currFile, function(exist) {
        //console.log(currFile);

        if(exist){
            res.set({
                "Content-type":"application/vnd.ms-excel",
                "Content-Disposition":"attachment;filename=" + encodeURI(fileName)
            });
            fReadStream = fs.createReadStream(currFile).pipe(res);
            fReadStream.on("data",(chunk) => res.write(chunk,"binary"));
            fReadStream.on("end",function(){
                res.end();
            });
        }else{
            res.set("Content-type","text/html");
            res.send("file not exist!");
            res.end();
        }
    });
});

//page: download end  jingcheng 2017/06/01 模板下载
//*************************************************

//*************************************************
//Excel文件上传与解析 2017.6.24 start jingcheng
router.post('/obj', function(req, res, next){
    console.log(" ########### POST /obj ##########");
  var form = new formidable.IncomingForm();
      form.encoding = 'utf-8';
      form.uploadDir = path.join(__dirname,'../addXML/');
      form.keepExtensions = true;//保留后缀
      form.maxFieldsSize = 2*1024*1024;
		
  form.parse(req, function(err, fields, files){
    if(err){
        console.log('文件上传错误！');
        return;
    }
    var filename = files.file.name;
    console.log(filename);
	 //正常操作
    if(filename.length >0)
      {
         console.log('正常操作!');
      }
      else{
        console.log('没有文件或者类型错误');
        return false ;
    }
    //对文件名进行处理，以应对上传同名文件的情况
    var nameArray = filename.split('.');
    var type = nameArray[nameArray.length-1];
    var name ='';
    for(var i=0;i<nameArray.length-1;i++){
        name = name + nameArray[i];
    }
    var date = new Date();
    var time = '_' + date.getFullYear() + "_" + date.getMonth() + "_" + date.getDay() + "_" + date.getHours() + "_" + date.getMinutes();
    var avatarName = name + time + '.' + type;
    var newPath = form.uploadDir + avatarName;
    console.log(newPath);
    fs.renameSync(files.file.path, newPath);//重命名
    console.log("重命名成功!");

    //对Excel文件进行解析，读取数据
        var obj = xlsx.parse(newPath);
        var excelObj = obj[0].data;//取得第一个sheet文档的全部数据
        var num = 0;//统计上传多少台打印机信息
        //定义printer实体类数组
        var printerArray = new Array('model','brand','type','serialnum','drumtype','position','department','assetmanager','contacttel','remarks');
        //循环遍历表每一行的数据
        for(var i=1; i<excelObj.length; i++){
            var rdata = excelObj[i];//第i+1行的数据
            console.log(rdata);
            console.log("到达了这一步！");
            //将每一行的数据存进数据库中
            var printer = db.printer;
            console.log(printer);
            //console.log(rdata.length);
            //for(var j=0;j<rdata.length;j++){
                //db.query('insert into printer (name,printertype_id,serialnum,belong,groupid,ppbox,ppmax,ppnum,inknum,age,position,manager,status,remarks) values (rdata[j],rdata[j+1],rdata[j+2],rdata[j+3],rdata[j+4],rdata[j+5],rdata[j+6],rdata[j+7],rdata[j+8],rdata[j+9],rdata[j+10],rdata[j+11],rdata[j+12],rdata[j+13])');
                //printer.set(printerArray[j],rdata[j]);
                var j=0;
                if(rdata.length != 0){
                printer.bulkCreate([{
                    "model" : rdata[j],
                    "brand" : rdata[j+1],
                    "type" : rdata[j+2],
                    "serialnum" : rdata[j+3],
                    "drumtype" : rdata[j+4],
					"locationip" : rdata[j+5],
					"purtime" : rdata[j+6],
                    "position" : rdata[j+7],
                    "department" : rdata[j+8],
                    "assetmanager" : rdata[j+9],
                    "contacttel" : rdata[j+10],
					"manager" : rdata[j+11],
					"printercode" : rdata[j+12],
                    "remarks" : rdata[j+13]
                }]);
                }
            //}
        }
        console.log("成功解析excel数据并且存进相应数据库！");
    //};//解析的结尾

    });
 res.locals.success = '导入成功';
 //res.render('tempobj');
 res.redirect('/obj');
 });


//Excel文件上传与解析 2017.6.24 end jingcheng
//*************************************************


//************************************************
//page: application start  chenquanjun 2017/6/5 耗材申请
//页面
router.get('/application', function(req, res, next) {
    db.application.findAll(
        //*****条件
    ).then(function(data) {
        res.render('application');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/application', function(req, res, next) {
    db.application.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/applicationadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.application.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/applicationdelete', function(req, res, next) {
    console.log(req.body.applicationid);
    db.application.destroy({
        'where': {
            'id': req.body.applicationid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/applicationedit', function(req, res, next) {
    console.log(req.body.applicationid);
    db.application.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/applicationquery', function(req, res, next) {
    db.application.findOne({
        'where': {
            'id': req.body.applicationid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: application end chenquanjun 2017/6/5
//*************************************************

//*************************************************
//page: represult start  jingcheng 2017/07/05 维修结果

//页面
router.get('/represult', function(req, res, next) {
    db.represult.findAll(
        //*****条件
    ).then(function(data) {
        res.render('represult');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/represult', function(req, res, next) {
    db.represult.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/represultadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.represult.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/represultdelete', function(req, res, next) {
    console.log(req.body.represultid);
    db.represult.destroy({
        'where': {
            'id': req.body.represultid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/represultedit', function(req, res, next) {
    console.log(req.body.represultid);
    db.represult.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/represultquery', function(req, res, next) {
    db.represult.findOne({
        'where': {
            'id': req.body.represultid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: represult end jingcheng 2017/07/05 维修结果
//************************************************

//*************************************************
//page: supresult start  jingcheng 2017/07/06 配送结果

//页面
router.get('/supresult', function(req, res, next) {
    db.supresult.findAll(
        //*****条件
    ).then(function(data) {
        res.render('supresult');
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录列表
router.post('/supresult', function(req, res, next) {
    db.supresult.findAll({
            //*****条件
        } 
    ).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//添加记录
router.post('/supresultadd', function(req, res, next) {
    console.log(JSON.stringify(req.body));
    db.supresult.create(req.body).then(function(result) {
        res.json({ "status": 0, "result": result.get({ 'plain': true }) });
    }).catch(function(err) {
        res.json({ "status": -1, "result": err });
    });

});

//删除记录
router.post('/supresultdelete', function(req, res, next) {
    console.log(req.body.supresultid);
    db.supresult.destroy({
        'where': {
            'id': req.body.supresultid
        }
    }).then(function(result) {
        res.send("删除成功")
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});

//修改记录
router.post('/supresultedit', function(req, res, next) {
    console.log(req.body.supresultid);
    db.supresult.update(req.body, {
        'where': {
            'id': req.body.id
        }
    }).then(function(result) {
        res.send("ok");
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });

});

//获取记录
router.post('/supresultquery', function(req, res, next) {
    db.supresult.findOne({
        'where': {
            'id': req.body.supresultid
        }
    }).then(function(result) {
        res.send(result)
    }).catch(function(err) {
        console.dir(err);
        res.send(err);
    });
});
//page: supresult end jingcheng 2017/07/06 配送结果
//************************************************

//电视机
router.get('/projection', function (req, res, next) {
    db.printer.findAll(
        //*****条件
    ).then(function (data) {
        res.render('projection');
    }).catch(function (err) {
        console.dir(err);
        res.send(err);
    });

});

//故障报表-faultreport.ejs (zhailiuhui -2017-7-18 )
router.post('/faultreportgetlist', function (req, res, next) {
    eval("var dbprox = db." + req.body.tbname);
    var flag=req.body.faultreportvalue==""||req.body.faultreportvalue==null ||req.body.faultreportvalue==undefined;
   //判断是否有参数传入,若是,则进入if语句
    if(flag)
        {
              dbprox.findAll({
         //*****条件
            }).then(function (result) {
              res.send(result)
            }).catch(function (err) {
              console.dir(err);
            });
        }else{
    dbprox.findAll({
        'where':{
            'people':{$like :'%'+ req.body.faultreportvalue+'%'
        }
        }
    }
    ).then(function (result) {
        res.send(result)
    }).catch(function (err) {
        console.dir(err);
		});}
});
//故障报表-faultreport.ejs (zhailiuhui -2017-7-18 )

//维护报表-maintain.ejs (zhailiuhui -2017-7-19 )
router.post('/maintaingetlist', function (req, res, next) {
    eval("var dbprox = db." + req.body.tbname);
    var flag=req.body.maintainvalue==""||req.body.maintainvalue==null ||req.body.maintainvalue==undefined;
   //判断是否有参数传入,若是,则进入if语句
    if(flag)
        {
              dbprox.findAll({
         //*****条件
            }).then(function (result) {
              res.send(result)
            }).catch(function (err) {
              console.dir(err);
            });
        }
    dbprox.findAll({
        'where':{
            'name':{$like :'%'+ req.body.maintainvalue+'%'
        }
        }
    }
    ).then(function (result) {
        res.send(result)
    }).catch(function (err) {
        console.dir(err);
    });
});
//维护报表-maintain.ejs (zhailiuhui -2017-7-19 )

//耗材报表-supplyreport.ejs (zhailiuhui -2017-7-19 )
router.post('/supplyreportgetlist', function (req, res, next) {
    eval("var dbprox = db." + req.body.tbname);
   //判断是否有参数传入,若是,则进入if语句
    if(req.body.supplyreportvalue==-1)
        {
              dbprox.findAll({ //supplyreport
         //*****条件
            }).then(function (result) {
              res.send(result)
            }).catch(function (err) {
              console.dir(err);
            });
        }
    dbprox.findAll({
        'where':{
            'supplytype': req.body.supplyreportvalue
        }
    }
    ).then(function (result) {
        res.send(result)
    }).catch(function (err) {
        console.dir(err);
    });
});
//耗材报表-supplyreport.ejs (zhailiuhui -2017-7-19 )

router.get('/wxfaultpush', function(req, res, next) {
    console.log('*****************************');
    //var openid = getopenid();
    res.redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + appid + "&redirect_uri=" +
        //"http://dpsmanager.sipso.com.cn/customer/index.html?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
        "http://siso.sipso.com.cn/indexuser/indexuser.html?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
    //res.redirect("/customer/index.html?openid=" + openid);
});

router.get('/wxfaultpull', function(req, res, next) {
    console.log('###############$$$$$$$$$$$$$$$$$$');
    res.redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + appid + "&redirect_uri=" +
        //"http://dpsmanager.sipso.com.cn/staff/index.html?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
        "http://siso.sipso.com.cn/indexuser/indexuser.html?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
});

router.get('/wxbindperson', function (req, res, next) {
    console.log('wxbindperson');
    res.redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + appid + "&redirect_uri=" +
        //"http://dpsmanager.sipso.com.cn/staff/index.html?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
        "http://siso.sipso.com.cn/personbind?id=" + req.query.id + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
});
//****************** */
//***微信相关 */
function getopenid(req, res, next) {
    var url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + secret + "&code=" + req.body.code + "&grant_type=authorization_code";
    https.get(url, function(res) {
        var datas = [];
        var size = 0;
        res.on('data', function(data) {
            datas.push(data);
            size += data.length;
        });
        res.on("end", function() {
            var buff = Buffer.concat(datas, size);
            var result = iconv.decode(buff, "utf8"); //转码//var result = buff.toString();//不需要转编码,直接tostring  
            console.log(result);
            req.openid = JSON.parse(result).openid;
            next();
        });
    }).on("error", function(err) {
        console.error(err.stack);
        next(new Error("get openid error! -- " + err));
    });
}

function getopenidbyget(req, res, next) {
    var url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + secret + "&code=" + req.query.code + "&grant_type=authorization_code";
    https.get(url, function (res) {
        var datas = [];
        var size = 0;
        res.on('data', function (data) {
            datas.push(data);
            size += data.length;
        });
        res.on("end", function () {
            var buff = Buffer.concat(datas, size);
            var result = iconv.decode(buff, "utf8"); //转码//var result = buff.toString();//不需要转编码,直接tostring  
            console.log(result);
            req.openid = JSON.parse(result).openid;
            next();
        });
    }).on("error", function (err) {
        console.error(err.stack);
        next(new Error("get openid error! -- " + err));
    });
}

// function getaccesstoken(req, res, next) {
//     if (((new Date()).valueOf() - token.lasttime) > 60 * 60 * 1000) {
//         var url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appid + "&secret=" + secret;
//         https.get(url, function(res) {
//             var datas = [];
//             var size = 0;
//             res.on('data', function(data) {
//                 datas.push(data);
//                 size += data.length;
//             });
//             res.on("end", function() {
//                 var buff = Buffer.concat(datas, size);
//                 var result = iconv.decode(buff, "utf8"); //转码//var result = buff.toString();//不需要转编码,直接tostring  
//                 console.log(result);
//                 token.token = JSON.parse(result).token;
//                 token.lasttime = (new Date()).valueOf();
//                 next();
//             });
//         }).on("error", function(err) {
//             Logger.error(err.stack)
//             next(new Error("get openid error! -- " + err));
//         });
//     } else {
//         next();
//     }
// }

function sendwxmsg(openid, url, msg) {
    var data = {
        "first": {
            "value": msg.title,
            "color": "#173177"
        },
        "keyword1": {
            "value": msg.name,
            "color": "#173177"
        },
        "keyword2": {
            "value": msg.id + ' , ' + msg.printerbrand + ' , '  + msg.printertype + ' , ' + msg.printerdrumtype + ' , '+ msg.printerposition + ' , ' + msg.realposition,
            "color": "#173177"
        },
        "keyword3": {
            "value": msg.type + ' , ' + msg.details,
            "color": "#173177"
        },
        "keyword4": {
            "value": msg.time,
            "color": "#173177"
        },
        "remark": {
            "value": msg.remarks,
            "color": "#173177"
        }
    };
    api.sendTemplate(openid, "C7HNaSCoRBtqRoLFTB9BSwljeNgSD8xgIXsbfBHSmU0", url, data, function(err, result) {
        if (err) console.log(err);
        console.log(result);
    });
}

function sendrenewwxmsg(openid, url, msg) {
    var data = {
        "first": {
            "value": msg.title,
            "color": "#173177"
        },
        "keyword1": {
            "value": msg.name,
            "color": "#173177"
        },
        "keyword2": {
            "value": msg.id + ' , ' + msg.printerbrand + ' , '  + msg.printertype + ' , ' + msg.realposition,
            "color": "#173177"
        },
        "keyword3": {
            "value": msg.details,
            "color": "#173177"
        },
        "keyword4": {
            "value": msg.time,
            "color": "#173177"
        },
        "remark": {
            "value": msg.remarks,
            "color": "#173177"
        }
    };
    api.sendTemplate(openid, "C7HNaSCoRBtqRoLFTB9BSwljeNgSD8xgIXsbfBHSmU0", url, data, function(err, result) {
        if (err) console.log(err);
        console.log(result);
    });
}


//******************* */

router.post('/upload', function(req, res, next) {

    console.log("upload");


    var paths = [];
    upload(req, res, function(err) {
        if (err) {
            console.log(err);
        }
        console.dir(req.files);
        req.files.forEach(function(file) {
            fs.rename(file.path, "./public/files/" + file.originalname, function(fileerr) {
                if (fileerr) {
                    console.log(fileerr);
                }
                paths.push("/files/" + file.originalname);

            });
        });
        db.faultlog.update({
            "paths": paths.toString()
        }, {
            'where': {
                'id': req.body.id
            }
        })


        res.send("upload success");
    })

})



//********************** */
router.prepareSocketIO = function(server) {
    var io = socket_io.listen(server);
    io.sockets.on('connection', function(socket) {

        socket.on('join', function(user) {

            console.log(user + " join");

            socket.user = user;
            socket.emit('state', 'SERVER', true);
            socket.broadcast.emit('state', 'SERVER', user + '上线了');
        });
        socket.on('sendMSG', function(msg) {
            console.log(socket.user + " say: " + msg);
            socket.emit('chat', socket.user, msg);
            socket.broadcast.emit('chat', socket.user, msg);
        });

    });

};
//********************** */

module.exports = router;