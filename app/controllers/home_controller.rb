class HomeController < ApplicationController

  def index
    @question_symptom = "Have you been experiencing any of the following symptoms?"
    @question_conditions = "Do you suffer from the following underlying conditions?"
    @question_travel = "Have you travelled internationally in the past:"
  end

  def result
    greeting
    if params[:symptom_fever] == '1' || params[:symptom_throat]|| params[:symptom_headaches] == '1'
      if params[:condition_HIV] == '1' || params[:condition_Asthma] == '1' || params[:condition_cancer] == '1'
        @final_result = "You need to consult your GP immediately"
      else
        @final_result = "You need to self-quarantine at home"
      end
    elsif params[:symptom_none] == '1' || params[:condition_none] == '1' || params[:travel_none] == '1'
      @final_result = "You're fine!"
    end
  end


  private

  def greeting
    @name = params[:name]
    @year = params[:year]
    t = Time.now
    if t.hour <= 11
      @greeting = "good morning!"
    elsif t.hour > 11 && t.hour <= 15
      @greeting = "good afternoon!"
    else
      @greeting = "good evening!"
    end
    if @name && @year
      @first_name = @name.split(" ")[0].capitalize
      if @first_name.size > 0 && @year.to_i > 0 && @year.to_i <= 2020
        @first_greeting = "Hello #{@first_name}! You are #{t.year.to_i - @year.to_i} years old"
      else
        @first_greeting = "Please submit valid credentials"
      end
    else
      @first_greeting = "Hello World!"
    end
  end

end
