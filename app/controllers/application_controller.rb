class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square

    @num = params.fetch("monkey").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb"})
  end

  def calculate_random

    @minimum  = params.fetch("user_min").to_f
    @maximum  = params.fetch("user_max").to_f
    @rand_output = rand(@minimum .. @maximum)

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_sqrt_form
    render({ :template => "calculation_templates/sqrt_form.html.erb"})
  end

  def calculate_sqrt

    @num = params.fetch("user_input").to_f
    @sqrt_of_num = @num ** 0.5

    render({ :template => "calculation_templates/sqrt_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment


    @apr = params.fetch("user_apr").to_f
    m_int = (@apr * 0.01)/12.0
    
    @yrs = params.fetch("user_yrs").to_f
    mos = @yrs * 12.0
    @principal = params.fetch("user_principal").to_f
    
    
    @payment_output = m_int * @principal / (1-((1 + m_int) ** (-1 * mos)))

    @apr = ActiveSupport::NumberHelper.number_to_percentage(@apr, precision: 4)
    @principal = ActiveSupport::NumberHelper.number_to_currency(@principal, precision: 2)
    @payment_output = ActiveSupport::NumberHelper.number_to_currency(@payment_output, precision: 2)
    
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end


end

