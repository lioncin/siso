'use strict'
module.exports = function(sequelize, DataTypes) {
    var faultreport = sequelize.define('faultreport', {
        id: {  //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        type: { //设备型号
            type: DataTypes.STRING,
        },
        people: { //报障人
            type: DataTypes.STRING,
        },
        phone: { //联系电话
            type: DataTypes.BIGINT(11),
        },
        details: { //故障详情
            type: DataTypes.STRING,
        },
		repairphone: { //维修电话
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