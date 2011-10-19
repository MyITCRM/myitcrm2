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
        "<div class='ckeditor_layout'>#{text_area_tag(name, content, options)}</div>".html_safe
      end



   def module_header(title = nil, module_class = nil)
     if title.present?
       title
       else
       title = [t "global.quick_links"]
     end
     "<div class='module_header text_shadow #{module_class}'>#{title}</div>".html_safe
   end
# Used to show Employees Overview
   def employees_work_overview(status_id, employee_number = nil)
     if employee_number.present?
      WorkOrder.where("assigned_to_id = #{employee_number} ").where("status_id = #{status_id}")
      else
      WorkOrder.where("status_id = #{status_id}")
     end
   end
#  Used to Show Clients Overview
  def clients_overview(status_id, client_number)
      WorkOrder.where("user_id = #{client_number} ").where("status_id = #{status_id}")
  end
end

