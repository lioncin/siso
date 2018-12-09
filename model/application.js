//耗材申请
'use strict'
module.exports = function(sequelize, DataTypes) {
    var application = sequelize.define('application', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        time: {			//申请时间
            type: DataTypes.DATE
		},
		people: {			//申请人
            type: DataTypes.STRING
        },
		phone: {			//联系电话
            type: DataTypes.STRING
        },
		applicationList: {			//申请清单
            type: DataTypes.STRING
        },
        state: { //状态
            type: DataTypes.BIGINT(11)
        },

        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'application',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return application;
};