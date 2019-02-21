const merge = require('webpack-merge');

const config = require('./webpack.config');

module.exports = merge(
  config,
  {
    mode: 'development',
    resolve: {
      alias: {
        vue: 'vue/dist/vue.js'
      }
    },
    devtool: 'inline-source-map',
    devServer: {
      contentBase: './dist'
    }
  }
);
