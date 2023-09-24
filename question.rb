class Question

  attr_accessor :question, :answer # creates getter and setter method for each attribute

  def initialize
    # generates a random integer between 1 and 20
    num1 = rand(1..20) # local variables
    num2 = rand(1..20)

    @question = "What is #{num1} + #{num2}?"
    @answer = num1 + num2
  end

end