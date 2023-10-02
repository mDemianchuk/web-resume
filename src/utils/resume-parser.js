export function getResumeContent() {
  return parseResumeString() || require('@assets/resume.json');
}

function parseResumeString() {
  return JSON.parse(process.env.VUE_APP_RESUME_CONTENT_STRING || null);
}
