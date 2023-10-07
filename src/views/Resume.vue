<script>
import { getResumeContent } from '@utils/resume-parser';

export default {
  metaInfo: {
    title: 'Resume',
  },
  components: {
    Header: () => import('@components/Header'),
    Experience: () => import('@components/Experience'),
    Education: () => import('@components/Education'),
    Certification: () => import('@components/Certification'),
    Projects: () => import('@components/Projects'),
  },
  data: () => ({
    resume: getResumeContent(),
  }),
};
</script>

<template>
  <v-container>
    <Header
      :firstName="resume.firstName"
      :lastName="resume.lastName"
      :middleName="resume.middleName"
      :summary="resume.summary"
      :contact-options="resume.contactOptions"
    />
    <Experience :experience-list="resume.experienceList" class="pb-10" />
    <Education :school-list="resume.schoolList" class="py-10" />
    <Certification
      :certification-list="resume.certificationList"
      class="py-10"
    />
    <Projects :project-list="resume.projectList" class="py-10" />
  </v-container>
</template>
