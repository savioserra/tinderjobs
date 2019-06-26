String getJobs = """
  query {
    me {
      availableJobs {
        id
        title
      }
    }
  }
""";
