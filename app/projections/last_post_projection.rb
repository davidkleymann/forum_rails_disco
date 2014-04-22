class LastPostProjection
  include ActiveProjection::ProjectionType

  def created_post_event(event)
    find(event)
    LastPost.create! event.values.merge(id: event.id)
  end

  def deleted_post_event(event)
    LastPost.where(id: event.id).each { |post| post.destroy! }
  end

  private

  def find(event)
    @last_post = LastPost.where(user_id: event.values[:user_id]).order(created_at: :desc)
    if @last_post.length == 10
      id = @last_post[9].id
      LastPost.find(id).destroy!
    end
  end

end

