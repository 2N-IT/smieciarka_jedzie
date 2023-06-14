module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.erb',
    './app/components/**/*.rb',
  ],

  theme: {
    extend: {
      colors: {
        primary: {
          "50": "#eff6ff", "100": "#dbeafe", "200": "#bfdbfe", "300": "#93c5fd", "400": "#60a5fa", "500": "#3b82f6",
          "600": "#2563eb", "700": "#1d4ed8", "800": "#1e40af", "900": "#1e3a8a"
        }
      }
    },
    fontFamily: {
      'body': [
        'Inter',
        'ui-sans-serif'
      ],
      'sans': [
        'Inter',
        'ui-sans-serif'
      ]
    }
  },

  plugins: [
    require('@tailwindcss/forms')
  ],
}
