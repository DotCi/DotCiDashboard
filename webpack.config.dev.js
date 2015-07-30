module.exports = require('./make-webpack-config.js')(
  { 
    debug: true ,
    entry:{
      "dotci-dashboard":  [
        'webpack-dev-server/client?http://localhost:3000',
        'webpack/hot/only-dev-server',
        "./src/main/elm/app.js"
      ]},
      output: {
        filename: "dotci-dashboard.js",
        publicPath: "http://localhost:3000/assets/"
      }
  }
);
