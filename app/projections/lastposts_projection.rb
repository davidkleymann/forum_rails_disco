class LastpostProjection
  include ActiveProjection::ProjectionType

  def created_post_event(event)
    find(event)
    Lastpost.create! event.values.merge(id: event.id)
  end

  def deleted_post_event(event)
    Lastpost.where(id: event.id).each { |post| post.destroy! }
  end

  private

  def find(event)
    @lastpost = Lastpost.where(user_id: event.values[:user_id]).order(created_at: :desc)
    if @lastpost.length == 10
      id = @lastpost[9].id
      Lastpost.find(id).destroy!
    end
  end

end

