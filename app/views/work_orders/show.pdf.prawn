#Creates a new cell object. Generally used indirectly via Document#cell
#
#Of the available options listed below, :point, :width, and :text must be provided. If you are not using the Document#cell shortcut, the :document must also be provided.
#:point	 = Absolute [x,y] coordinate of the top-left corner of the cell.
#:text = The text to be flowed within the cell
#:text_color = The color of the text to be displayed
#:width = The width in PDF points of the cell.
#:height = The height in PDF points of the cell.
#:horizontal_padding =The horizontal padding in PDF points
#:vertical_padding = The vertical padding in PDF points
#:padding = Overrides both horizontal and vertical padding
#:align = One of :left, :right, :center
#:borders = An array of sides which should have a border. Any of :top, :left, :right, :bottom
#:border_width = The border line width. Defaults to 1.
#:border_style = One of :all, :no_top, :no_bottom, :sides, :none, :bottom_only. Defaults to :all.
#:border_color = The color of the cell border.
#:font_size = The font size for the cell text.
#:font_style = The font style for the cell text.

# Declare local variables here first.
# Check if there is a user assigned and display it if there is, otherwise display "not assigned message"
if @work_order.assigned_to_username.blank?
    assignee = t "workorder.not_assigned_message"
else
    assignee = @work_order.assigned_to_username
end
# Logo
# mytodo - add if statement to include user supplied logo instead of default logo
pdf.image "public/images/logo.png", :at => [200, 720], :height => 40
# Business information
 pdf.bounding_box([450,720], :width => 400, :align => :right ) do
    pdf.text t "setting_details"
    pdf.text Setting::business_name, :size => 8
    pdf.text Setting::business_address, :size => 8
    pdf.text Setting::business_phone, :size => 8
    if Setting::business_email ||= nil
      pdf.text Setting::business_email, :size => 8
    end
  end
# Customer information
 pdf.bounding_box([10,720], :width => 200, :align => :right ) do
    pdf.text t "workorder.pdf.t_customer_details"
    pdf.text "#{@work_order.user.name}", :size => 8
    pdf.text "#{@work_order.user.address}", :size => 8
    pdf.text "#{@work_order.user.phone}", :size => 8
    pdf.text "#{@work_order.user.mobile}", :size => 8
    pdf.text "#{@work_order.user.email}", :size => 8

  end

# Lets move down the pdf xx points before next object
 pdf.move_down(15)

# Work Order details start

pdf.text "#{t "workorder.pdf.t_workorder"} : #{@work_order.id}", :size => 26, :align => :center
#pdf.move_down(5)
pdf.text "#{t "workorder.status"}: #{@work_order.status.name} | #{t "workorder.assigned_to"} : #{assignee}",:size => 9, :align => :center

=begin
pdf.move_down(2)
pdf.stroke_horizontal_rule
pdf.move_down(5)
=end
# Subject Block >>BOF


=begin
# Left Column
pdf.bounding_box([10,600], :width => 90, :height => 150) do
  pdf.stroke_bounds
  pdf.move_down(3)
  pdf.text "#{t "global.subject"}:" , :align => :right, :size => 9
  pdf.text "#{t "workorder.details"}:", :align => :right, :size => 9
end
pdf.move_down(15)
# Center Column

pdf.bounding_box([105,600], :width => 300,:height => 150) do
  pdf.stroke_bounds
  pdf.move_down(3)
  pdf.pad(5) {pdf.text @work_order.subject + "\n" + @work_order.description, :size => 9}
end

pdf.bounding_box [425, 600], :width => 125, :height => 150 do
pdf.stroke_bounds
pdf.text "Scheduled Time.",:align => :center, :size => 10
pdf.text "Date/Time : #{localize Time.now, :format => :medium}", :size => 7
end
=end
pdf.bounding_box([400,615],:width => 120, :height => 200 ) do
  pdf.transparent(0.9) {pdf.stroke_bounds}
    pdf.bounding_box([390,605],:width => 110, :height => 190 ) do
      pdf.transparent(0.1) {pdf.stroke_bounds}
      pdf.pad_top(5) {pdf.text "Schedule Info.",:align => :center, :size => 12 }
      pdf.pad_top(5) {pdf.text "  Scheduled Arrival: " + "\n" + " #{localize Time.now, :format => :medium}",:align => :left, :size => 9}
      pdf.pad_top(5) {pdf.text "  Actual Arrival: " + "\n" + "#{localize Time.now, :format => :short} ___:___ AM PM",:align => :left, :size => 9 }
    end
end
pdf.bounding_box([0,615],:width => 400 ) do
pdf.table([ ["#{t "global.subject"}:",@work_order.subject],
            ["#{t "workorder.details"}:", @work_order.description] ],
          :cell_style => { :overflow => :shrink_to_fit, :size => 9 },
          :column_widths => {0 => 60})
end
gap = 5
pdf.bounding_box([0, pdf.cursor], :width => 400) do
  pdf.stroke_bounds
pdf.text("1111111111")
pdf.bounding_box([gap, pdf.cursor - gap], :width => 380) do
  pdf.stroke_bounds
pdf.text "222222222222"
pdf.bounding_box([gap, pdf.bounds.top - gap], :width => 100) do
pdf.text "3333333333333"
pdf.transparent(0.5) { pdf.dash(0.5); pdf.stroke_bounds; pdf.undash }
end
pdf.bounding_box([gap * 30, pdf.bounds.top - gap], :width => 100, :height => 50) do
  pdf.stroke_bounds
pdf.text("44444444444")
end
pdf.transparent(0.5) { pdf.dash(1); pdf.stroke_bounds; pdf.undash }
end
pdf.bounding_box([gap, pdf.cursor - gap], :width => 300, :height => 50) do
  pdf.stroke_bounds
pdf.text("5555555555")
end
end
# Page X of X
pdf.bounding_box([0,0],:width => 520 ) do
  pdf.number_pages "Page <page> of <total>", :align => :center , :size => 8

end

