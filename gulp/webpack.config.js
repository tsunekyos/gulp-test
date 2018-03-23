module.exports = {
  mode: "development",
  entry: "./src/js/script.coffee",
  module:{
    rules:[
      {
        test: /\.coffee$/,
        use: 'coffee-loader',
        exclude: /node_modules/
      }
    ]
  },
  resolve:{
    extensions:[ '.coffee','.js' ]
  },
  output: {
    filename: "script.js"
  },
}
