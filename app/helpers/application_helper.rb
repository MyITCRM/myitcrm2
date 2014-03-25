# MyITCRM - Repairs Business CRM Software
# Copyright (C) 2009-2014  Glen Vanderhel
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

  # Adds a sortable column to the header of any table.
  # example:
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  # Menu and Action Icons helper
  def menu_button(link_name = nil, link_action = nil, icon_class = nil, button_class = nil)
    if button_class == nil
      button_class = "btn btn-large btn-inverse btn-block"
    end
    "<a href='#{link_action}' class='#{button_class}'><i class='#{icon_class}'></i> #{link_name}</a>".html_safe

  end
# Help Icon Linkhelper
  def help_button(help_page = nil)

    "<a href='/help/#{help_page}', target='_blank'><i class='icon-question-sign'></i></a>".html_safe

  end

# Used to show Employees Overview
  def employees_work_overview(status_id, employee_number = nil)
    if employee_number.present?
      WorkOrder.where("assigned_to_id = ? AND status_id = ? ", "#{employee_number}", "#{status_id}")
    else
      WorkOrder.where("status_id = ?", "#{status_id}")
    end
  end

#  Used to Show Clients Overview
  def clients_overview(status_id, client_number)
    WorkOrder.where("user_id = ? AND status_id = ?", "#{client_number}", "#{status_id}")
  end

#  TEXT Helpers
  def markdown(text)
    #rendered_text =text.gsub( /(\[([a-zA-Z0-9]{1,60})\:)+[a-zA-Z0-9]{2,60}\]/,'<a href='"/\2"'>Link</a>')
    interlinked = %r{([a-zA-Z0-9]{1,60}):([a-zA-Z0-9]{1,60})+}i
    rendered_text =text.gsub(interlinked, '<a href=' '/\1/\2' '>/\1/\2</a>')
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, with_toc_data:true)
    markdown.render(rendered_text).html_safe
  end
  # Shows markdown examples in a slide down div. The @inst_id is used to randomly generate a unique div id when
  # the link is displayed more then once on the same page
  def markdown_hint
    @inst_id = rand(1..10)
    render "layouts/markdown_examples"
  end


  # Used to add and remove fields through JQuery in Invoice Service and Product Lines
  #def link_to_remove_fields(f)
  #  image_title = t "global.delete"
  #  f.hidden_field(:_destroy) + link_to_function(image_tag('delete.png', :title => "#{image_title}" ), "remove_fields(this)")
  #end

  def link_to_add_fields(name, f, association, section)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "#{section} btn btn-small btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end

  #def link_to_add_fields(name, f, association)
  #  new_object = f.object.class.reflect_on_association(association).klass.new
  #  fields = f.simple_fields_for(association, new_object, :index => "new_#{association}") do |builder|
  #    render(association.to_s.singularize, :f => builder)
  #  end
  #  link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')" )
  #
  #end

  def toggle_link(name, id, options={})
    onclick = "Element.toggle('#{id}'); "
    onclick << (options[:focus] ? "Form.Element.focus('#{options[:focus]}'); " : "this.blur(); ")
    onclick << "return false;"
    link_to(name, "#", :onclick => onclick)
  end

  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end

  # Used to display list of active work orders when creating or editing that relate to that client.
  def recent_activity (status_id)
    WorkOrder.where("user_id = ? AND status_id = ?", "#{params[:user_id]}", "#{status_id}").order("created_at ASC")
  end


end

# <%= f.input :due_date, :as => :date_picker %>
module SimpleForm
  module Inputs
    class DatePickerInput < SimpleForm::Inputs::StringInput
      def input_html_options
        value = object.send(attribute_name)
        options = {
            value: value.nil? ? nil : I18n.localize(value),
            data: {behaviour: 'datepicker'} # for example
        }
        # add all html option you need...
        super.merge options
      end
    end
  end
end

