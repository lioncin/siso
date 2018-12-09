//�Ĳ����ͱ�
'use strict'
module.exports = function(sequelize, DataTypes) {
    var supplytype = sequelize.define('supplytype', {
        id: { //����ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },
        name: { //��������
            type: DataTypes.STRING
        },
        remarks: { //��ע
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