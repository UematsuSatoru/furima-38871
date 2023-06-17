class OrdersController < ApplicationController
  def index
    @sends_records_form = SendsRecordsForm.new
  end
end
