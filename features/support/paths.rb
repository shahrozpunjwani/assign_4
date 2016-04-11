# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers

  def path_to(page_name)
    def movieId(t) 
      Movie.find_by_title(t).id.to_s
    end
    
    case page_name

    when /^the home\s?page$/
      '/movies'
    when /^the edit page for "(.*)"/
      id = movieId($1)
      "/movies/#{id}/edit"
    when /^the details page for "(.*)"/
      id = movieId($1)
      "/movies/#{id}"
    when /^the Similar Movies page for "(.*)"/
      id = movieId($1)
      "/movies/#{id}/similar"
      

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)