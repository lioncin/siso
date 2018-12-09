//维护报表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var maintreport = sequelize.define('maintreport', {
        id: { //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        mainttype: { //维护类型
            type: DataTypes.BIGINT(11)
        },
        time: {  //维护时间
            type: DataTypes.DATE
        },
        leaselocation: { //租赁位置
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
        tableName: 'maintreport',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return maintreport;
};