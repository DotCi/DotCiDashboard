var webpack = require('webpack');
var postcss_nested = require('postcss-nested');
var postcss_custom_properties= require('postcss-custom-properties');
var autoprefixer = require('autoprefixer-core');
var cssimport = require('postcss-import');
module.exports = function(config){
  return {
    entry: config.entry,
    output: config.output,
    module: {
      loaders: [
        {
          test: /\.(json)$/,
          loader: 'json-loader'
        },
        {
          test: /\.(svg)$/,
          loader: 'url-loader'
        },
        {
          test: /\.less$/,
          loader: 'style-loader!css-loader!less-loader'
        },
        {
          test: /\.css$/,
          loader: 'style-loader!css-loader!postcss-loader' 
        },
        { test: /\.elm$/, 
          loader: "elm-webpack" 
        }

      ]
    },
    postcss: function () {
      return [
        cssimport({
          onImport: function (files) {
            files.forEach(this.addDependency);
          }.bind(this)
        }),
        postcss_custom_properties,
        postcss_nested,
        autoprefixer
      ];
    },
    devtool: config.debug ? '#inline-source-map' : false,
    plugins: config.debug ? [] : [
      new webpack.EnvironmentPlugin('NODE_ENV'),
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.UglifyJsPlugin(
        {
          compressor: {
            screw_ie8: true,
            warnings: false
          }
        }
      ),
      new webpack.optimize.AggressiveMergingPlugin(),
      new webpack.optimize.OccurenceOrderPlugin()
    ]

  };
};
