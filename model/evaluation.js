//客户评价表
'use strict'
module.exports = function(sequelize,DataTypes){
    var evaluation = sequelize.define('evaluation',{
        id:{//设备ID
			type:DataTypes.BIGINT(11), 
			autoIncrement:true, 
			primaryKey : true, 
			unique : true
        },
        printerid:{//设备ID
			type:DataTypes.BIGINT(11), 
        },
        repairevaluation:{//报修评价
            type:DataTypes.STRING
        },
        serviceattitude:{//服务态度
			type: DataTypes.BIGINT(11), 
			comment:'服务态度'
		},
         technicallevel:{//技术水平
			type: DataTypes.BIGINT(11), 
			comment:'技术水平'
		},
        responsetime:{//响应时效
			type: DataTypes.BIGINT(11), 
			comment:'响应时效'
		},
    },{
        timestamps: true,
		underscored: true,
		paranoid: true,
		freezeTableName: true,
		tableName: 'evaluation',
		charset: 'utf8',
		collate: 'utf8_general_ci'
    });
    return evaluation;
};