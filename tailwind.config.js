module.exports = {
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light"],
  },
  content: [
    './app/views/**/*.html.haml',
    './app/components/*.html.haml',
    './app/components/**/*.html.haml',
    './spec/previews/*.rb',
    './app/components/*.rb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
