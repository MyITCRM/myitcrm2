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

pdf.move_down(5)
# Subject Block >>BOF


# Left Column
pdf.bounding_box([10,600], :width => 90) do

  pdf.text "#{t "global.subject"}:" , :align => :right, :size => 9
  pdf.text "#{t "workorder.details"}:", :align => :right, :size => 9
end
pdf.move_down(15)
# Center Column

pdf.bounding_box([105,600], :width => 300,  :padding => 3) do
#  pdf.stroke_bounds
  pdf.text @work_order.subject, :size => 9
  pdf.text @work_order.description, :size => 9
end

# myTODO - Add more cells, eg Resolution, Notes, Scheduled Time(s), Actual Times, Travel, Signatures, logging info....printed at, etc

