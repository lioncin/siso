//耗材报表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var supplyreport = sequelize.define('supplyreport', {
        id: { //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        supplytype: { //耗材类型
            type: DataTypes.BIGINT(11)
        },
        supplynum: { //耗材数量
            type: DataTypes.BIGINT(11)
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
        tableName: 'supplyreport',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return supplyreport;
};