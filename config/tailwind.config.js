const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'gromada-green': "#ACBE1A",
        'gromada-lime': "#F9FBCC",
        'gromada-light-green': "#E8EACC",
        'gromada-green-700': '#556014',
        'gromada-green-800': "#6A7912",
        'gromada-gray': "#BEBFBE",
        'gromada-gray-light': "#EBEBEB"
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
