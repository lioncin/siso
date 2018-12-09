'use strict'
module.exports = function(sequelize, DataTypes) {
    var paper = sequelize.define('paper', {
        id: {  //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //设备名称
            type: DataTypes.STRING
        },
        type: { //设备型号
            type: DataTypes.STRING
        },
        printerid: { //设备ID
            type: DataTypes.BIGINT(11)
        },
        dpaper: { //每天 张数
            type: DataTypes.BIGINT(11)
        },
		wpaper: { //每周 张数
			type: DataTypes.STRING
	    },
		mpaper: { //每月 张数
		   type: DataTypes.STRING
	    },
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'paper',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return paper;
};