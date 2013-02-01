# MyITCRM - Repairs Business CRM Software
# Copyright (C) 2009-2012  Glen Vanderhel
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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

  # Menu and Action Icons helper
  def menu_action(link_action = nil, link_name = nil, icon_class = nil)

    "<a href='#{link_action}'><i class='#{icon_class}'></i> #{link_name}</a>".html_safe

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

    def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      markdown.render(text).html_safe
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

  def toggle_link(name, id, options={})
      onclick = "Element.toggle('#{id}'); "
      onclick << (options[:focus] ? "Form.Element.focus('#{options[:focus]}'); " : "this.blur(); ")
      onclick << "return false;"
      link_to(name, "#", :onclick => onclick)
  end

end

