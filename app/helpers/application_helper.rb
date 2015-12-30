module ApplicationHelper
  def author_names(author, commiter)
    author == commiter ? author : "#{author} and #{commiter}"
  end
end
