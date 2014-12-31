class HelpController < ApplicationController
  before_filter :login_required # User must be logged in first
    def show
      @help = File.read(File.join(Rails.root, 'doc', 'help', "#{params[:page_id]}.md"))
      @sidebar = File.read(File.join(Rails.root, 'doc', 'help', 'sidebar.md'))
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
      # render :html => markdown.render(@help)
      # render :html => markdown.render(File.read(@help)).html_safe
    end


end