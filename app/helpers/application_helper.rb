# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Adds a sortable column to the header of the table
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

   # This is the module
   def module_header(title = nil, module_class = nil)
     title.present? ? title : title = t('global.quick_links')
     css_class = module_class
     "<div class='module_header text_shadow #{css_class}'>#{title}</div>".html_safe
   end

# Used to show Employees Overview
   def employees_work_overview(status_id, employee_number = nil)
     if employee_number.present?
      WorkOrder.where("assigned_to_id = ? AND status_id = ? ", "#{employee_number}","#{status_id}")
      else
      WorkOrder.where("status_id = ?","#{status_id}")
     end
   end
#  Used to Show Clients Overview
  def clients_overview(status_id, client_number)
      WorkOrder.where("user_id = ? AND status_id = ?","#{client_number}", "#{status_id}")
  end

#  TEXT Helpers
  # Returns a textarea opening and closing tag set tailored for accessing a specified attribute
      # ==== Examples
      #   <%= ckeditor_tag 'work_order[description]', @work_order.description , :cols => 60, :rows => 40, :class => 'ckeditor' %>
      #   ckeditor_tag(:post, :body, :cols => 20, :rows => 40)
      #   # => <textarea cols="20" rows="40" id="post_body" name="post[body]">
      #   #      #{@post.body}
      #   #    </textarea>
      #
      def ckeditor_tag(name, content = nil, options = {})
#        content_tag :div, text_area_tag(name, content, options), :class => "ckeditor_layout"
        "<div class='ckeditor_layout'>#{text_area_tag(name, content, options)}</div>".html_safe
 end

  # Returns a textarea opening and closing tag set tailored for accessing a specified attribute
      # ==== Examples
      #   textile_tag(content)
      #   # => RedCloth3.new(content).to_html).html_safe
      #
def textile_tag(content)
   (RedCloth3.new(content).to_html).html_safe
end
  # Used to add and remove fields through JQuery in Invoice Service and Product Lines
  def link_to_remove_fields(f)
    image_title = t "global.delete"
    f.hidden_field(:_destroy) + link_to_function(image_tag('delete.png', :title => "#{image_title}" ), "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.simple_fields_for(association, new_object, :index => "new_#{association}") do |builder|
      render(association.to_s.singularize, :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')" )

  end

end

