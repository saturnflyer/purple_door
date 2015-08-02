module TopicsHelper
  def worksheets_complete_for_topic_by_user(topic, user)
    rel = topic.user_worksheets
    total_count = rel.count
    user_count  = rel.where(user: user).count

    if total_count != 0 && user_count != 0
      "(#{user_count}/#{total_count})"
    end
  end
end
