//
// lint-staged.config.js
//

// Setup:
// [run]
// npm pkg set scripts.format:lint-staged="prettier --write"
// npm pkg set scripts.eslint:lint-staged="eslint --fix"
// npm pkg set scripts.stylelint:lint-staged="stylelint --fix"
// [/run]

/** @type {import("lint-staged").configObject} */
const config = {
  // Formatting
  // [JSON]
  '**/*.json': (filenames) => filenames.map((filename) => `npm run format:lint-staged '${filename}'`),
  // [YAML]
  '**/*.{yaml,yml}': (filenames) => filenames.map((filename) => `npm run format:lint-staged '${filename}'`),
  // [Markdown]
  '**/*.{md,mdx}': (filenames) => filenames.map((filename) => `npm run format:lint-staged '${filename}'`),

  // Uncomment if needed
  // '**/*.{js,jsx,ts,tsx,vue}': (filenames) => filenames.map((filename) => `npm run eslint:lint-staged '${filename}'`),
  // '**/*.{sass,scss,css}': (filenames) => filenames.map((filename) => `npm run stylelint:lint-staged '${filename}'`),
}
module.exports = config
