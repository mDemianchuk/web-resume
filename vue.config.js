const path = require('path');

module.exports = {
  publicPath: process.env.NODE_ENV === 'production' ? '/vue-resume/' : '/',
  transpileDependencies: ['vuetify'],
  configureWebpack: {
    resolve: {
      alias: {
        '@src': path.resolve(__dirname, 'src'),
        '@components': path.resolve(__dirname, 'src/components'),
        '@views': path.resolve(__dirname, 'src/views'),
        '@utils': path.resolve(__dirname, 'src/utils'),
        '@assets': path.resolve(__dirname, 'src/assets'),
        '@design': path.resolve(__dirname, 'src/design/index.scss'),
      },
    },
  },
  css: {
    sourceMap: true,
  },
};
