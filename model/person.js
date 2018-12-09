//人员表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var person = sequelize.define('person', {
        id: { //打印机ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        openid: { //微信openid
            type: DataTypes.STRING
        },
        name: { //员工姓名
            type: DataTypes.STRING
        },
        sex: { //性别 1男 2女 3其他 hardcode
            type: DataTypes.INTEGER
        },
        phone: { //手机号码
            type: DataTypes.STRING
        },
        num: { //员工代码
            type: DataTypes.STRING
        },
        status: { //状态 0正常 1忙 hardcode
            type: DataTypes.INTEGER
        },
        servcustomer: { //所在客户
            type: DataTypes.INTEGER
        },
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        freezeTableName: true
    });
    return person;
};