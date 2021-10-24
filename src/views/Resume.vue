<script>
import { RESUME_CONTENT } from '@models/resume-content';

export default {
  metaInfo: {
    title: 'Resume',
  },
  components: {
    Header: () => import('@components/Header'),
    Summary: () => import('@components/Summary'),
    Experience: () => import('@components/Experience'),
    OtherExperience: () => import('@components/OtherExperience'),
    Projects: () => import('@components/Projects'),
    Education: () => import('@components/Education'),
  },
  data: () => ({
    resume: RESUME_CONTENT,
  }),
};
</script>

<template>
  <v-container>
    <Header :name="resume.name" :contact-options="resume.contactOptions" />
    <Summary title="Summary" text="Summary text" />
    <Experience title="Experience" text="Experience text" />
    <OtherExperience title="Other Experience" text="Other Experience text" />
    <Projects title="Projects" text="Projects text" />
    <Education title="Education" text="Education text" />
  </v-container>
</template>

<style scoped></style>
