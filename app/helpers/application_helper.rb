# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize                       
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end


 def textiletoolbar_for(field_id)
          javascript_include_tag('jstoolbar/jstoolbar') +
            javascript_include_tag('jstoolbar/textile') +
            javascript_include_tag("jstoolbar/lang/jstoolbar-en") +
          javascript_tag("var textileToolbar = new jsToolBar($('#{field_id}'));  textileToolbar.draw();")
        end
        end