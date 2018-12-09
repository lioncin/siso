//配送结果表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var supresult = sequelize.define('supresult', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //配送结果名称
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
        tableName: 'supresult',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return supresult;
};