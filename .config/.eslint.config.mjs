// ESLint configuration file.
// https://eslint.org/docs/latest/use/configure/configuration-files

import json from "eslint-plugin-json";

export default [
  // JSON files rules.
  {
    files: ["**/*.json"],
    ...json.configs["recommended-with-comments"],
  },
  // Ignored files.
  {
    ignores: ["**/node_modules"],
  },
];
