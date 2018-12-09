//故障表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var fault = sequelize.define('fault', {
        id: { //打印机
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true
        },
        printerid: {
            type: DataTypes.BIGINT(11),
            field: 'printer_id',
            comment: '打印机ID'
        },
		model:{//类型
            type:DataTypes.STRING
        },
		brand:{//品牌
			type:DataTypes.STRING
		},
		printertype:{//型号
			type:DataTypes.STRING
		},
        name: { //报障人
            type: DataTypes.STRING
        },
        openid: { //报障人openid
            type: DataTypes.STRING
        },
        phone: { //联系电话
            type: DataTypes.STRING
        },
		realposition: { //实际位置
            type: DataTypes.STRING
        },
        time: { //报障时间
            type: DataTypes.STRING
        },
        type: { //故障类型
            type: DataTypes.INTEGER
        },
        // paths: { //图片存放地址
        //     type: DataTypes.STRING
        // },
        details: { //详情
            type: DataTypes.STRING
        },
		supplytype: { //耗材类型
            type: DataTypes.INTEGER
        },
        staff: { //抢单人员
            type: DataTypes.BIGINT(11)
        },
        status: { //状态
            type: DataTypes.INTEGER
        },
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        freezeTableName: true,
        underscored: true,
        timestamps: true,
        tableName: 'fault',
        comment: '故障表',
        charset: 'utf8',
        collate: 'utf8_general_ci',
    });
    return fault;
};