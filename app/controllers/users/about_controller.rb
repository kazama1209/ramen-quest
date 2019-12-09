class Users::AboutController < Users::ApplicationController
  def questions
    @questions = File.read(Rails.root.join('static', 'questions.md'))
  end

  def corporation
    @corporation = File.read(Rails.root.join('static', 'corporation.md'))
  end

  def privacy
    @privacy = File.read(Rails.root.join('static', 'privacy.md'))
  end

  def terms
    @terms = File.read(Rails.root.join('static', 'terms.md'))
  end
end
