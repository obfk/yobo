module ApplicationHelper
  def author_names(author, commiter)
    if author == 'Pivotal Tracker'
      if commiter == 'Pivotal Tracker'
        'Tracker Gremlin'
      else
        commiter
      end
    else
      if author == commiter
        author
      else
        "#{author} and #{commiter}"
      end
    end
  end

  private

  def valid_names(author, commiter)

  end
end
