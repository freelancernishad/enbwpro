const mix = require('laravel-mix');
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../.env') })
/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/backend/app.js', 'public/js/backend.js').js('resources/js/frontend/app.js', 'public/js/frontend.js').js('resources/js/auth/app.js', 'public/js/auth1.js')
    .vue()
    .sass('resources/sass/app.scss', 'public/css');
