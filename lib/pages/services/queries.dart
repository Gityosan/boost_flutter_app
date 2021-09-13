class Queries {
  static const getUser = 
  '''
    query GetUser(\$userId: ID!) {
      getUser(userId: \$userId) {
        userId
        name
        introduction
        lat
        lng
        tag
        acquaintance
        userImageId
        status
        owner
        createdAt
        updatedAt
        event {
          items {
            eventId
            userId
            name
            eventImageId
            introduction
            tag
            lat
            lng
            limit
            reserved
            start
            end
            from
            to
            reported
            owner
            createdAt
            updatedAt
          }
          nextToken
        }
        icon {
          userImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
      }
    }
  ''';

  static const listUsers = 
  '''
    query ListUsers(
      \$userId: ID
      \$filter: ModelUserFilterInput
      \$limit: Int
      \$nextToken: String
      \$sortDirection: ModelSortDirection
    ) {
      listUsers(
        userId: \$userId
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
        sortDirection: \$sortDirection
      ) {
        items {
          userId
          name
          introduction
          lat
          lng
          tag
          acquaintance
          userImageId
          status
          owner
          createdAt
          updatedAt
          event {
            nextToken
          }
          icon {
            userImageId
            name
            type
            size
            alt
            url
            identityId
            owner
            createdAt
            updatedAt
          }
        }
        nextToken
      }
    }
  ''';

  static const listUserByOwner =  
  '''
    query ListUserByOwner(
      \$owner: ID
      \$sortDirection: ModelSortDirection
      \$filter: ModelUserFilterInput
      \$limit: Int
      \$nextToken: String
    ) {
      listUserByOwner(
        owner: \$owner
        sortDirection: \$sortDirection
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
      ) {
        items {
          userId
          name
          introduction
          lat
          lng
          tag
          acquaintance
          userImageId
          status
          owner
          createdAt
          updatedAt
          event {
            nextToken
          }
          icon {
            userImageId
            name
            type
            size
            alt
            url
            identityId
            owner
            createdAt
            updatedAt
          }
        }
        nextToken
      }
    }
  ''';

  static const getEvent =  
  '''
    query GetEvent(\$eventId: ID!) {
      getEvent(eventId: \$eventId) {
        eventId
        userId
        name
        eventImageId
        introduction
        tag
        lat
        lng
        limit
        reserved
        start
        end
        from
        to
        reported
        owner
        createdAt
        updatedAt
        comment {
          items {
            commentId
            eventId
            value
            owner
            createdAt
            updatedAt
          }
          nextToken
        }
        image {
          eventImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
      }
    }
  ''';

  static const listEvents =  
  '''
    query ListEvents(
      \$eventId: ID
      \$filter: ModelEventFilterInput
      \$limit: Int
      \$nextToken: String
      \$sortDirection: ModelSortDirection
    ) {
      listEvents(
        eventId: \$eventId
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
        sortDirection: \$sortDirection
      ) {
        items {
          eventId
          userId
          name
          eventImageId
          introduction
          tag
          lat
          lng
          limit
          reserved
          start
          end
          from
          to
          reported
          owner
          createdAt
          updatedAt
          comment {
            nextToken
          }
          image {
            eventImageId
            name
            type
            size
            alt
            url
            identityId
            owner
            createdAt
            updatedAt
          }
        }
        nextToken
      }
    }
  ''';

  static const listEventByOwner =  
  '''
    query ListEventByOwner(
      \$owner: ID
      \$sortDirection: ModelSortDirection
      \$filter: ModelEventFilterInput
      \$limit: Int
      \$nextToken: String
    ) {
      listEventByOwner(
        owner: \$owner
        sortDirection: \$sortDirection
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
      ) {
        items {
          eventId
          userId
          name
          eventImageId
          introduction
          tag
          lat
          lng
          limit
          reserved
          start
          end
          from
          to
          reported
          owner
          createdAt
          updatedAt
          comment {
            nextToken
          }
          image {
            eventImageId
            name
            type
            size
            alt
            url
            identityId
            owner
            createdAt
            updatedAt
          }
        }
        nextToken
      }
    }
  ''';
  
  static const getComment =  
  '''
    query GetComment(\$commentId: ID!) {
      getComment(commentId: \$commentId) {
        commentId
        eventId
        author {
          userId
          name
          introduction
          lat
          lng
          tag
          acquaintance
          userImageId
          status
          owner
          createdAt
          updatedAt
          event {
            nextToken
          }
          icon {
            userImageId
            name
            type
            size
            alt
            url
            identityId
            owner
            createdAt
            updatedAt
          }
        }
        value
        owner
        createdAt
        updatedAt
      }
    }
  ''';

  static const listComments =  
  '''
    query ListComments(
      \$commentId: ID
      \$filter: ModelCommentFilterInput
      \$limit: Int
      \$nextToken: String
      \$sortDirection: ModelSortDirection
    ) {
      listComments(
        commentId: \$commentId
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
        sortDirection: \$sortDirection
      ) {
        items {
          commentId
          eventId
          author {
            userId
            name
            introduction
            lat
            lng
            tag
            acquaintance
            userImageId
            status
            owner
            createdAt
            updatedAt
          }
          value
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';

  static const lisByOwner =  
  '''
    query LisByOwner(
      \$owner: ID
      \$sortDirection: ModelSortDirection
      \$filter: ModelCommentFilterInput
      \$limit: Int
      \$nextToken: String
    ) {
      lisByOwner(
        owner: \$owner
        sortDirection: \$sortDirection
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
      ) {
        items {
          commentId
          eventId
          author {
            userId
            name
            introduction
            lat
            lng
            tag
            acquaintance
            userImageId
            status
            owner
            createdAt
            updatedAt
          }
          value
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';

  static const getUserImage =  
  '''
    query GetUserImage(\$userImageId: ID!) {
      getUserImage(userImageId: \$userImageId) {
        userImageId
        name
        type
        size
        alt
        url
        identityId
        owner
        createdAt
        updatedAt
      }
    }
  ''';

  static const listUserImages =  
  '''
    query ListUserImages(
      \$userImageId: ID
      \$filter: ModelUserImageFilterInput
      \$limit: Int
      \$nextToken: String
      \$sortDirection: ModelSortDirection
    ) {
      listUserImages(
        userImageId: \$userImageId
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
        sortDirection: \$sortDirection
      ) {
        items {
          userImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';

  static const listUserImageByOwner =  
  '''
    query ListUserImageByOwner(
      \$owner: ID
      \$sortDirection: ModelSortDirection
      \$filter: ModelUserImageFilterInput
      \$limit: Int
      \$nextToken: String
    ) {
      listUserImageByOwner(
        owner: \$owner
        sortDirection: \$sortDirection
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
      ) {
        items {
          userImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';

  static const getEventImage = 
  '''
    query GetEventImage(\$eventImageId: ID!) {
      getEventImage(eventImageId: \$eventImageId) {
        eventImageId
        name
        type
        size
        alt
        url
        identityId
        owner
        createdAt
        updatedAt
      }
    }
  ''';

  static const listEventImages =  
  '''
    query ListEventImages(
      \$eventImageId: ID
      \$filter: ModelEventImageFilterInput
      \$limit: Int
      \$nextToken: String
      \$sortDirection: ModelSortDirection
    ) {
      listEventImages(
        eventImageId: \$eventImageId
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
        sortDirection: \$sortDirection
      ) {
        items {
          eventImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';

  static const listEventImageByOwner =  
  '''
    query ListEventImageByOwner(
      \$owner: ID
      \$sortDirection: ModelSortDirection
      \$filter: ModelEventImageFilterInput
      \$limit: Int
      \$nextToken: String
    ) {
      listEventImageByOwner(
        owner: \$owner
        sortDirection: \$sortDirection
        filter: \$filter
        limit: \$limit
        nextToken: \$nextToken
      ) {
        items {
          eventImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        nextToken
      }
    }
  ''';
}