class StartController < ApplicationController
  def firstpage
    render({ :template => "calculation_templates/homepage" })
  end 

  def squareresults
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 2
    render({ :template => "calculation_templates/squareresultspage" })
  end


  def squarenew
    render({ :template => "calculation_templates/squarenewpage" })
  end

  def squarenewresults
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 2
    render({ :template => "calculation_templates/squareresultspage" })
  end

  def squareroot
    render({ :template => "calculation_templates/sqrtcalc" })
  end

  def sqrtresult
    @the_number = params.fetch("user_number").to_f
    @the_sqrt_result  = @the_number ** 0.5
    render({ :template => "calculation_templates/squarerootresult" })
  end

  def newpayment
    render({ :template => "calculation_templates/new_payment_calc" })
  end

  def paymentresults
    @apr = params.fetch("user_apr").to_f.round(3)
    @apr_display = "#{@apr}" + "%"
    @apr_calc = params.fetch("user_apr").to_f 
    @num_years = params.fetch("user_years").to_i
    @principal_display = "$" + params.fetch("user_pv").to_s  # String for display with '$'
    @principal_for_calculation = params.fetch("user_pv").to_f  # Float for calculations
    monthly_interest_rate = @apr_calc / (12 * 100) 
    total_payments = @num_years * 12  
    @payment = (@principal_for_calculation  * monthly_interest_rate * (1 + monthly_interest_rate) ** total_payments) / ((1 + monthly_interest_rate) ** total_payments - 1)

    def format_currency(amount)
      "$#{'%.2f' % amount}"  # Format to two decimal places and prepend '$'
    end
    @formatted_payment = format_currency(@payment) 
    render({ :template => "calculation_templates/payment_result" })
  end


  def random
    render({ :template => "calculation_templates/new_random" })
  end


  def randomresult
    @min_value = params.fetch("user_min").to_f
    @max_value = params.fetch("user_max").to_f
    @random = rand(@min_value..@max_value).round(15)
    render({ :template => "calculation_templates/allrandomresults" })
  end
end
