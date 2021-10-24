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

.colorText {
  color: $color-color-text;
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
    background-color: $color-color-text;
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
</style>
