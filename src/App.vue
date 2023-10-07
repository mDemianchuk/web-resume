<template>
  <v-app>
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<style lang="scss">
@import '@design';

body,
#app {
  color: $color-text;
  background-color: #f6f6f7;
  font-family: $body-font-family;
  font-size: $font-size;
}

.headingText {
  color: $color-heading-text !important;
}

.secondaryText {
  color: $color-secondary-text !important;
}

.lightText {
  color: $color-light-text;
}

.accentText {
  color: $color-accent-text;
}

.accentSecondary {
  background-color: $color-accent-secondary !important;
}

a {
  display: block;
  position: relative;
  padding: 0.2em 0;
  overflow: hidden;
  color: $color-link-text !important;
  text-decoration: none;

  &::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 1px;
    background-color: $color-accent-text;
    opacity: 1;
    transition: opacity 300ms, transform 300ms;
    transform: translate3d(-100%, 0, 0);
  }

  &:hover::after,
  &:focus::after {
    opacity: 1;
    transform: translate3d(0, 0, 0);
  }
}

h1 {
  font-weight: 600;
}

h2,
h3,
h4,
h5,
h6 {
  font-weight: 500;
}

h1,
h2 {
  text-transform: uppercase;
}

ul {
  list-style-position: outside;
  list-style-type: '- ';
}
</style>
