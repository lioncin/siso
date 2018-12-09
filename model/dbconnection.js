'use strict'
var all = {
    sequelize:{
        username: 'root',
        password: '12345',
        database: 'siso',
        host: "localhost",
        dialect: 'mysql',
        define: {
            underscored: false,
            timestamps: true,
            paranoid: true
        }
    }
};

module.exports = all;