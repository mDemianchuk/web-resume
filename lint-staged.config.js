module.exports = {
  '*.js': ['eslint --fix', 'prettier --write'],
  '*.json': ['prettier --write'],
  '*.scss': ['prettier --write'],
  '*.vue': ['eslint --fix', 'prettier --write'],
};
