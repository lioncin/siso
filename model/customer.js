//客户表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var customer = sequelize.define('customer', {
        id: { //id
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        openid: { //微信openid
            type: DataTypes.STRING
        },
        customercode: { //客户代码
            type: DataTypes.STRING
        },
        name: { //客户名称
            type: DataTypes.STRING
        },
        pinyincode: { //拼音代码
            type: DataTypes.STRING
        },
        customeraddr: { //客户地址
            type: DataTypes.STRING
        },
        contactname: { //联系人名
            type: DataTypes.STRING
        },
        officetel: { //办公电话
            type: DataTypes.STRING 
        },
        telphone: { //手机号码
            type: DataTypes.STRING
        },
        serviceperson: { //服务主管
            type: DataTypes.STRING
        },
        servicephone: { //主管手机
            type: DataTypes.STRING
        },
        repairtel: { //报修电话
            type: DataTypes.STRING
        },
        //sex: { //性别 1男 2女 3其他 hardcode
            //type: DataTypes.INTEGER
        //},
        //phone: { //手机号码
            //type: DataTypes.STRING
        //},
        //group: { //所属组织
            //type: DataTypes.BIGINT(11)
        //},
        //status: { //状态 0正常 1忙 hardcode
            //type: DataTypes.INTEGER
        //},
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        freezeTableName: true
    });
    return customer;
};