//客户组织
'use strict'
module.exports = function(sequelize, DataTypes) {
    var group = sequelize.define('group', {
        id: { //组织ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        pid: { //父组织ID
            type: DataTypes.BIGINT(11)
        },
        rootid: { //根ID，用来判断所属客户组
            type: DataTypes.BIGINT(11)
        },
        name: { //组织名称
            type: DataTypes.INTEGER
        },
        manager: { //客户管理员
            type: DataTypes.BIGINT(11)
        },
        address: { //组织位置
            type: DataTypes.STRING
        },
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        freezeTableName: true
    });
    return group;
};