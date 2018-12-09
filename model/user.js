//后台管理登录页面
'use strict'
module.exports = function(sequelize, DataTypes) {
    var user = sequelize.define('user', {
        id: { //ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        username: { //用户名
            type: DataTypes.STRING
        },
        password: { //密码
            type: DataTypes.STRING
        }
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'user',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return user;
};