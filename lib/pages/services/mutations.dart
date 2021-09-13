class Mutations {
  static const createUser = 
  '''
    mutation CreateUser(
      \$input: CreateUserInput!
      \$condition: ModelUserConditionInput
    ) {
      createUser(input: \$input, condition: \$condition) {
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

  static const updateUser = 
  '''
    mutation UpdateUser(
      \$input: UpdateUserInput!
      \$condition: ModelUserConditionInput
    ) {
      updateUser(input: \$input, condition: \$condition) {
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

  static const deleteUser = 
  '''
    mutation DeleteUser(
      \$input: DeleteUserInput!
      \$condition: ModelUserConditionInput
    ) {
      deleteUser(input: \$input, condition: \$condition) {
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

  static const createEvent =
  ''' 
    mutation CreateEvent(
      \$input: CreateEventInput!
      \$condition: ModelEventConditionInput
    ) {
      createEvent(input: \$input, condition: \$condition) {
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

  static const updateEvent =
  '''
    mutation UpdateEvent(
      \$input: UpdateEventInput!
      \$condition: ModelEventConditionInput
    ) {
      updateEvent(input: \$input, condition: \$condition) {
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

  static const deleteEvent = 
  '''
    mutation DeleteEvent(
      \$input: DeleteEventInput!
      \$condition: ModelEventConditionInput
    ) {
      deleteEvent(input: \$input, condition: \$condition) {
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

  static const createComment = 
  '''
    mutation CreateComment(
      \$input: CreateCommentInput!
      \$condition: ModelCommentConditionInput
    ) {
      createComment(input: \$input, condition: \$condition) {
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

  static const updateComment = 
  '''
    mutation UpdateComment(
      \$input: UpdateCommentInput!
      \$condition: ModelCommentConditionInput
    ) {
      updateComment(input: \$input, condition: \$condition) {
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

  static const deleteComment = 
  '''
    mutation DeleteComment(
      \$input: DeleteCommentInput!
      \$condition: ModelCommentConditionInput
    ) {
      deleteComment(input: \$input, condition: \$condition) {
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

  static const createUserImage = 
  '''
    mutation CreateUserImage(
      \$input: CreateUserImageInput!
      \$condition: ModelUserImageConditionInput
    ) {
      createUserImage(input: \$input, condition: \$condition) {
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

  static const updateUserImage =
  '''
    mutation UpdateUserImage(
      \$input: UpdateUserImageInput!
      \$condition: ModelUserImageConditionInput
    ) {
      updateUserImage(input: \$input, condition: \$condition) {
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

  static const deleteUserImage = 
  '''
    mutation DeleteUserImage(
      \$input: DeleteUserImageInput!
      \$condition: ModelUserImageConditionInput
    ) {
      deleteUserImage(input: \$input, condition: \$condition) {
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

  static const createEventImage = 
  '''
    mutation CreateEventImage(
      \$input: CreateEventImageInput!
      \$condition: ModelEventImageConditionInput
    ) {
      createEventImage(input: \$input, condition: \$condition) {
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

  static const updateEventImage =
  '''
    mutation UpdateEventImage(
      \$input: UpdateEventImageInput!
      \$condition: ModelEventImageConditionInput
    ) {
      updateEventImage(input: \$input, condition: \$condition) {
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

  static const deleteEventImage =
  '''
    mutation DeleteEventImage(
      \$input: DeleteEventImageInput!
      \$condition: ModelEventImageConditionInput
    ) {
      deleteEventImage(input: \$input, condition: \$condition) {
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
}