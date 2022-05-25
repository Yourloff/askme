module QuestionsHelper
  def author_present(author)
    if author == current_user && current_user.present?
      'От меня'
    elsif author.present?
      link_to "От #{ display_nickname(author) }", user_path(author)
    else
      'Анонимный вопрос'
    end
  end

  def render_with_hashtags(body)
    body.gsub(Tag::HASHTAG_REGEX) { |word| link_to word.downcase, "/questions#{@question}/hashtag/#{word.downcase.delete('#')}" }.html_safe
  end

  def link_hashtag(tag)
    "/questions#{@question}/hashtag/#{tag}"
  end
end
