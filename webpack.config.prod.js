const merge = require('webpack-merge');

const config = require('./webpack.config');

module.exports = merge(
  config,
  {
    mode: 'production',
    resolve: {
      alias: {
        vue: 'vue/dist/vue.js'
      }
    },
  }
);
