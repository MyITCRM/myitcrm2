module WorkOrdersHelper
  def invoice(work_order_id = nil)
   Invoice.where("work_order_id = ?", "#{work_order_id}")
  end

  def replies
    @replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 10, :page => params[:page])
  end


    #@invoiced = Invoice.find_all_by_work_order_id(params[:id]).first
    #@reply = Reply.new(:work_order_id => @work_order.id)
    #@replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 4, :page => params[:page])


end
