String getJobs = """
  query {
    me {
      availableJobs {
        id
        title
        description
        weekHours
        weekDays
        remuneration
        matchThreshold
        tags

        company {
          name
          avatarUrl
        }
      }
    }
  }
""";
