class PagesController < ApplicationController
  def index
    # render plain: "Can pass as plain text"   # as plain text
    # render template: "/directory/file"       # as template render
    # render "/directory/file" # as similar as template where specifying template is not mandatory

    # redirect_to some_path # redirect_to some path

    
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
