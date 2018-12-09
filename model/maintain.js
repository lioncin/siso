'use strict'
module.exports = function(sequelize, DataTypes) {
    var maintain = sequelize.define('maintain', {
        id: {  //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //设备名称
            type: DataTypes.STRING
        },

        equipmentid: { //设备ID
            type: DataTypes.BIGINT(11)
        },

		location: { //部署位置
		   type: DataTypes.STRING
	    },
		
		date: { //维护日期
		   type: DataTypes.STRING
	    },
		
		content: { //维护内容
		   type: DataTypes.STRING
	    },
		
		use: { //耗材使用
		   type: DataTypes.STRING
	    },
		
		phone: { //维护电话
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
        tableName: 'maintain',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return maintain;
};