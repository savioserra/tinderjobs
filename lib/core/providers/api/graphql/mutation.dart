String login = """
  mutation login (\$email: String!, \$password: String!) {
    login (email: \$email, password: \$password) {
      token
      user {
        avatarUrl
        rating
        email
      }
    }
  }
""";

String like = """
  mutation (\$jobId: UUID!) {
  likeJob(jobId: \$jobId) {
    info
    success
  }
}
""";
