
'use strict'
module.exports = function(sequelize, DataTypes) {
    var faultreport = sequelize.define('faultreport', {
        id: { //����ID
            type: DataTypes.BIGINT(11),
            autoIncrement: true,
            primaryKey: true,
            unique: true
        },

        type: { //�ͺ�
            type: DataTypes.BIGINT(11),
        },
        brand: { //Ʒ��
            type: DataTypes.BIGINT(11),
        },
		people: { //������
            type: DataTypes.BIGINT(11),
        },
        phone: { //��ϵ�绰
            type: DataTypes.BIGINT(11),
			        },
        faulttype: { //��������
            type: DataTypes.BIGINT(11),
        },
        details: { //����
            type: DataTypes.BIGINT(11),
        },
        faulttype: { //��������
            type: DataTypes.BIGINT(11),
        },        faulttype: { //��������
            type: DataTypes.BIGINT(11),
        }
		
    }, {
        timestamps: true,
        underscored: true,
        paranoid: true,
        freezeTableName: true,
        tableName: 'faultreport',
        charset: 'utf8',
        collate: 'utf8_general_ci'
    });
    return faultreport;
};