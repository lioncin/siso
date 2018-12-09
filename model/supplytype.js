//耗材类型表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var supplytype = sequelize.define('supplytype', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //类型名称
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
        tableName: 'supplytype',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return supplytype;
};