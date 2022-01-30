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

end
