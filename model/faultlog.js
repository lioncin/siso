//维护 记录表
'use strict'
module.exports = function(sequelize, DataTypes) {
    var faultlog = sequelize.define('faultlog', {
        id: { //类型ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        printerid: {
            type: DataTypes.BIGINT(11),
            field: 'printer_id',
            comment: '打印机ID'
        },
        openid: { //维修人员openid
            type: DataTypes.STRING
        },
        time: {			//完成时间
            type: DataTypes.DATE
        },
        represult: { //维修结果
          type: DataTypes.INTEGER
        },
        list: { //零配件清单
          type: DataTypes.STRING
        },
        description: {//维修结果描述
          type: DataTypes.STRING
        },
        supresult: { //配送结果
          type: DataTypes.INTEGER
        },
        suplist: { //耗材明细
          type: DataTypes.STRING
        },
        supdescription: { //配送结果描述
          type: DataTypes.STRING
        },
        //finishtime: {			//完成时间
            //type: DataTypes.DATE
        //},
        //materialtype: { //维护类型
           // type: DataTypes.BIGINT(11)
        //},
        //maintenancestatus: { //维修状态
            //type: DataTypes.STRING
        //},
        
        remarks: { //备注
            type: DataTypes.STRING
        }
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'faultlog',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return faultlog;
};