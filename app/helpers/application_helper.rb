# Methods added to this helper will be available to all templates in the application.

module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize                       
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
      # Returns a textarea opening and closing tag set tailored for accessing a specified attribute
      # ==== Examples
      #   ckeditor_tag(:post, :body, :cols => 20, :rows => 40)
      #   # => <textarea cols="20" rows="40" id="post_body" name="post[body]">
      #   #      #{@post.body}
      #   #    </textarea>
      #
      def ckeditor_tag(name, content = nil, options = {})
        text_area_tag(name, content, options)
      end

end


