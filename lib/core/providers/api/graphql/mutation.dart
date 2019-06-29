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
