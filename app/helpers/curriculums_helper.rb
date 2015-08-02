module CurriculumsHelper
  def worksheets_completed_counter_for(curriculum)
    total_count = Worksheet.joins(:topic).where("topics.curriculum_id = ?", curriculum.id).count
    user_count  = UserWorksheet.joins(worksheet: :topic).where("topics.curriculum_id = ?", curriculum.id).count

    if total_count != 0 && user_count != 0
      if total_count == user_count
        "(complete)"
      else
        "(#{user_count}/#{total_count})"
      end
    end
  end
end
