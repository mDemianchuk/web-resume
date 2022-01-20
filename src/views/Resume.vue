<script>
import { getResumeContent } from '@utils/resume-parser';

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
    Certification: () => import('@components/Certification'),
  },
  data: () => ({
    resume: getResumeContent(),
  }),
};
</script>

<template>
  <v-container>
    <Header
      :name="resume.name"
      :title="resume.title"
      :contact-options="resume.contactOptions"
    />
    <Summary :text="resume.summary" />
    <Experience :experience-list="resume.experienceList" />
    <Projects :project-list="resume.projectList" />
    <Education :school-list="resume.schoolList" />
    <Education :school-list="resume.schoolList" />
    <Certification :certification-list="resume.certificationList" />
  </v-container>
</template>

<style scoped></style>
