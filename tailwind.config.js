module.exports = {
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["cupcake"],
  },
  content: [
    './app/views/**/*.html.haml',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
