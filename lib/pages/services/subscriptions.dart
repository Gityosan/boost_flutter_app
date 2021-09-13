class Subscriptions {
  static const onCreateUser =  
  '''
    subscription OnCreateUser(\$owner: String) {
      onCreateUser(owner: \$owner) {
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

  static const onUpdateUser =  
  '''
    subscription OnUpdateUser(\$owner: String) {
      onUpdateUser(owner: \$owner) {
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

  static const onDeleteUser =  
  '''
    subscription OnDeleteUser(\$owner: String) {
      onDeleteUser(owner: \$owner) {
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

  static const onCreateEvent =  
  '''
    subscription OnCreateEvent(\$owner: String) {
      onCreateEvent(owner: \$owner) {
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

  static const onUpdateEvent =  
  '''
    subscription OnUpdateEvent(\$owner: String) {
      onUpdateEvent(owner: \$owner) {
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

  static const onDeleteEvent =  
  '''
    subscription OnDeleteEvent(\$owner: String) {
      onDeleteEvent(owner: \$owner) {
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

  static const onCreateComment =  
  '''
    subscription OnCreateComment(\$owner: String) {
      onCreateComment(owner: \$owner) {
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

  static const onUpdateComment =  
  '''
    subscription OnUpdateComment(\$owner: String) {
      onUpdateComment(owner: \$owner) {
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

  static const onDeleteComment =  
  '''
    subscription OnDeleteComment(\$owner: String) {
      onDeleteComment(owner: \$owner) {
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

  static const onCreateUserImage =  
  '''
    subscription OnCreateUserImage(\$owner: String) {
      onCreateUserImage(owner: \$owner) {
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

  static const onUpdateUserImage =  
  '''
    subscription OnUpdateUserImage(\$owner: String) {
      onUpdateUserImage(owner: \$owner) {
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

  static const onDeleteUserImage =  
  '''
    subscription OnDeleteUserImage(\$owner: String) {
      onDeleteUserImage(owner: \$owner) {
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

  static const onCreateEventImage =  
  '''
    subscription OnCreateEventImage(\$owner: String) {
      onCreateEventImage(owner: \$owner) {
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

  static const onUpdateEventImage =  
  '''
    subscription OnUpdateEventImage(\$owner: String) {
      onUpdateEventImage(owner: \$owner) {
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

  static const onDeleteEventImage =  
  '''
    subscription OnDeleteEventImage(\$owner: String) {
      onDeleteEventImage(owner: \$owner) {
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