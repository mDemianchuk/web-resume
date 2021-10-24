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
    <Summary title="Summary" :text="resume.summary" />
    <Experience title="Experience" :experience-list="resume.experienceList" />
    <Projects title="Projects" :project-list="resume.projectList" />
    <Education title="Education" :school-list="resume.schoolList" />
  </v-container>
</template>

<style scoped></style>
