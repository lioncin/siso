
'use strict'
module.exports = function(sequelize, DataTypes) {
    var faultreport = sequelize.define('faultreport', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },

        type: { //型号
            type: DataTypes.BIGINT(11),
        },
        brand: { //品牌
            type: DataTypes.BIGINT(11),
        },
		people: { //报障人
            type: DataTypes.BIGINT(11),
        },
        phone: { //联系电话
            type: DataTypes.BIGINT(11),
			        },
        faulttype: { //故障类型
            type: DataTypes.BIGINT(11),
        },
        details: { //详情
            type: DataTypes.BIGINT(11),
        },
        faulttype: { //故障类型
            type: DataTypes.BIGINT(11),
        },        faulttype: { //故障类型
            type: DataTypes.BIGINT(11),
        }
		
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'faultreport',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return faultreport;
};