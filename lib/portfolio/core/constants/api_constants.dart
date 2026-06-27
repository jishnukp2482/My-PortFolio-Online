class ApiConstants {
  static String baseurl =
      "https://portfolio-backend-fake.onrender.com/api/v1.0/";
  static String testBaseurl =
      "https://wendy-prenarial-gala.ngrok-free.dev/api/v1.0/";
  static const signin = "auth/login";
  static const downLoadResume = "about/downloadResume";
  static const fetchContacts = "contact/fetchContacts";
  static const fetchAbout = "about/fetchAbout";
  static const fetchProjects = "project/fetchAllProjects";

  //Admin
  static const updateAbout = "about/updateabout";
  static const refreshToken = "auth/refreshToken";
  static const uploadReusme = "about/uploadResume";
  static const createContact = "contact/createContact";
  static const updateContact = "contact/updateContact";
  static const deleteContact = "contact/deleteContact";
  static const createproject = "project/createProject";
  static const deleteproject = "project/deleteProject";
  static const updateproject = "project/updateProject";
  static const deleteProjectImg = "project/deleteProjectImage";
  static const orderIDAvailability = "project/checkOrderID";
}
