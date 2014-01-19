class HelpController < ApplicationController
  before_filter :login_required # User must be logged in first
    def show
      @help = File.open(File.join(Rails.root, 'lib', 'help', "#{params[:page_id]}.md"), 'r') { |f| f.read }
      @sidebar = File.open(File.join(Rails.root, 'lib', 'help', 'sidebar.md'), 'r') { |f| f.read }
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
      render :html => markdown.render(File.join(Rails.root, 'lib', 'help', "#{params[:page_id]}.md"))
    end


end