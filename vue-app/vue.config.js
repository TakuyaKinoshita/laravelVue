const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  configureWebpack: {
    entry: {
      app: './src/main.ts',
    },
    devServer: {
      port: 3000,
    }
  },
  transpileDependencies: true,
})
