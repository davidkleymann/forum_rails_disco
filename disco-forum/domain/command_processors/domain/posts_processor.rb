module Domain
  class PostsProcessor
    include ActiveDomain::CommandProcessor

    process DeletePostsCommand do |command|
      command.is_valid_do { event DeletedPostsEvent.new command.to_hash }
    end

    process UpdatePostsCommand do |command|
      command.is_valid_do { event UpdatedPostsEvent.new command.to_hash }
    end

    process CreatePostsCommand do |command|
      command.is_valid_do { event CreatedPostsEvent.new command.to_hash }
    end
  end
end