class GenerateQuestion
  OPERATIONS = [{ name: 'plus', operator: :+ },
  { name: 'minus', operator: :- },
  { name: 'multiplied by', operator: :* },
  { name: 'divided by', operator: :/ }].freeze


  def self.call
    index = rand(0..3)
    num1 = rand(1..20)
    num2 = rand(1..20)
    answer = num1.send(OPERATIONS[index][:operator], num2).round()

    [num1, num2, answer, OPERATIONS[index][:name]]
  end
end