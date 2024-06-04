/**
 * plugins/vuetify.js
 *
 * Framework documentation: https://vuetifyjs.com`
 */

// Styles
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'

// Composables
import { createVuetify } from 'vuetify'

// https://vuetifyjs.com/en/introduction/why-vuetify/#feature-guides
export default createVuetify({
  theme: {
    themes: {
      light: {
        colors: {
          primary: '#101418',
          secondary: '#13191E',
          third: '#1F262E', 
          accent: '#5B9DE1', 
          error: '#fc5666',
          success: '#56fc9e', 
          warning: '#fcac56',
        },
      },
    },
  },
})
