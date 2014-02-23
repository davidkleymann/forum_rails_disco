class LastpostProjection
  include ActiveProjection::ProjectionType

  def created_post_event(event)
    find
    Lastpost.create! event.values.merge(event.id)
  end

  private

  def find
    @lastpost = Lastpost.where("user=?", event.values[:user_id]).order(time: :desc)
    if @lastpost.length == 10
      id = @lastpost[10].id
      Lastpost.find(id).destroy!
    end
  end

end

