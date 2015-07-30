module.exports = require('./make-webpack-config.js')(
  { 
    debug: false ,
    entry:"./src/main/elm/app.js",
    output: {
      path: "src/main/webapp/js",
      filename: "dotci-dashboard.js"
    }
  }
);
