//打印机/耗材 类型表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var printertype = sequelize.define('printertype', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //类型名称
            type: DataTypes.STRING
        },
        type: { //型号
            type: DataTypes.STRING
        },
        brand: { //品牌
            type: DataTypes.STRING
        },
        supplier: { //供应商
            type: DataTypes.STRING
        },
        suppliercontact: { //供应商联系方式
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
        tableName: 'printertype',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return printertype;
};