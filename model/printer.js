//打印机表
'use strict'
module.exports = function(sequelize,DataTypes){
    var printer = sequelize.define('printer',{
        id:{//打印机ID
			type:DataTypes.BIGINT(11), 
			autoIncrement:true, 
			primaryKey : true, 
			unique : true
        },
        model:{//类型
            type:DataTypes.STRING
        },
		brand:{//品牌
			type:DataTypes.STRING
		},
		type:{//型号
			type:DataTypes.STRING
			//type: DataTypes.BIGINT(11), 
			//field: 'printertype_id', 
			//allowNull: false, 
			//comment:'打印机类型id'
		},
		serialnum:{//序列号
			type:DataTypes.STRING
		},
		drumtype: {//硒鼓型号
			type:DataTypes.STRING
		},
		locationip: {//位置IP
			type:DataTypes.STRING
		},
		purtime: {//购置时间
			type:DataTypes.STRING
		},
		position:{//地点
            type:DataTypes.STRING
        },
		department:{//负责部门
			type:DataTypes.STRING
		},
		assetmanager:{//资产负责人
			type:DataTypes.STRING
		},
		contacttel:{//联系人电话
			type:DataTypes.STRING
		},
		manager:{//维修负责人
			type:DataTypes.STRING
		},
		belong:{//归属对象 客户/公司
			type:DataTypes.BIGINT(11)
		},
		groupid:{//组织ID
			type:DataTypes.BIGINT(11)
		},
		ppbox:{//纸盒数
			type:DataTypes.INTEGER
		},
		ppmax:{//纸容量，张数
			type:DataTypes.INTEGER
		},
		ppnum:{//纸量-百分值
			type:DataTypes.INTEGER
		},
		inknum:{//墨量-百分值
			type:DataTypes.INTEGER
		},
        age:{//放置日期
            type:DataTypes.DATE
        },
		//manager:{//负责人
			//type:DataTypes.BIGINT(11)
		//},
		status:{//当前状态 0正常，1 故障，2 标记回收，3 .... -1，报废
			type:DataTypes.INTEGER,
			defaultValue: 0
		},
		//打印机编码字段
		printercode: {//编码
			type:DataTypes.STRING
		},
        remarks:{//备注
            type:DataTypes.STRING
        }
    },{
        timestamps: true,
		underscored: true,
		paranoid: true,
		freezeTableName: true,
		tableName: 'printer',
		charset: 'utf8',
		//collate: 'utf8_general_ci',
		    //indexes: [{
			//name: 'printer_type',
			//method: 'BTREE',
			//fields: ['printertype_id']
		//}]
    });
    return printer;
};