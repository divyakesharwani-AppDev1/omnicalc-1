class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template=>"calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    # params = {"elephant"=>"42"}
    @num = params.fetch("elephant").to_f
    @square_of_num = @num*@num


    render({:template=>"calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({:template=>"calculation_templates/random_form.html.erb"})
  end


  def calculate_random
    #params = {"user_min"=>"1.5", "user_max"=>"4.5"}

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @random_results = rand(@lower..@upper)   


    render({:template=>"calculation_templates/rand_results.html.erb"})
  end

  def blank_square_root_form
    render({:template=>"calculation_templates/square_root_form.html.erb"})
  end

  def calculate_sqrt
    #Parameters: {"user_number"=>"24"}

    @num_to_sqrt = params.fetch("user_number").to_f
    @sqrt_result = @num_to_sqrt**0.5
    
    render({:template=>"calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({:template=>"calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    #Parameters: {"user_apr"=>"3s", "user_years"=>"5", "user_pv"=>"250000"}
    
    rate1 = params.fetch("user_apr").to_f.round(4)
    @rate = rate1.to_s(:percentage)
    rate_per_month = rate1/12
    
    @num_of_year = params.fetch("user_years").to_i
    total_period = @num_of_year*12
    
    principal1 = params.fetch("user_pv").to_f
    @principal = principal1.to_s(:currency)
    
    term1 = (rate_per_month/100)*((1+rate_per_month/100)**(total_period))
    term2 = ((1+rate_per_month/100)**(total_period))-1
    
    payment_cal1 = principal1*(term1)/(term2)
    @payment_cal = payment_cal1.round(2).to_s(:currency)

    render({:template=>"calculation_templates/payment_results.html.erb"})
  end

end
