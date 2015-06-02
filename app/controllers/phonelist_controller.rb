class PhonelistController < ApplicationController
  
  respond_to :html
  
  def conv
  end

  def converted
    file = params[:file]
    options = {
        headers_in_file: false,
        user_provided_headers: %i[name emp_no manager phone_no]
     }
    @numbers = SmarterCSV.process(file.tempfile, options)
    respond_with(@numbers)
  end

end
