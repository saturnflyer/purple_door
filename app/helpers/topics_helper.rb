module TopicsHelper
  def worksheets_complete_for_topic_by_user(topic, user)
    total_count = topic.worksheets.count
    user_count  = topic.user_worksheets.where(user: user).count

    if total_count != 0 && user_count != 0
      if total_count == user_count
        "(complete)"
      else
        "(#{user_count}/#{total_count})"
      end
    end
  end
end
