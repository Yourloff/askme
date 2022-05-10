module QuestionsHelper
  def author_present(author)
    if author.present?
      link_to "От #{ display_nickname(author) }", user_path(author)
    else
      'Анонимный вопрос'
    end
  end
end
