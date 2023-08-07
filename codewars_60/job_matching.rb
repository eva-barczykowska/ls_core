# Let's build a matchmaking system that helps discover jobs for developers based on a number of factors.
#
# One of the simplest, yet most important factors is compensation.
# As developers we know how much money we need to support our lifestyle,
# so we generally have a rough idea of the minimum salary we would be satisfied with.
#
# Let's give this a try. We'll create a function match (job_matching in Python) which takes a candidate and a job,
# which will return a Boolean indicating whether the job is a valid match for the candidate.
#
# A candidate will have a minimum salary, so it will look like this:
# candidate = {
#   'min_salary': 120000
# }
# # A job will have a maximum salary, so it will look like this:
# job = {
#   'max_salary': 140000
# }
# If job's maximum salary is not present, throw an error.
# For a valid match, the candidate's minimum salary must be less than or equal to the job's maximum salary.
# However, let's also include 10% wiggle room (deducted from the candidate's minimum salary)
# in case the candidate is a rockstar who enjoys programming on Codewars in their spare time.
# The company offering the job may be able to work something out.
# PEDAC
# ************** Problem **************
# -we have 2 hashes passed in as argument, 1 is with candidate and job
# -candidate's hash contains his MINUMUM salary expectations, job's hash has MAXIMUM salary they can offer
# -write a method that returns true, false or throws an error
#
# For the method to return true, the job's maximum salary must be less than or equal to the candidates minimum salary.
# However, there is 10% wiggle room (calculated from the candidate's minimum salary)
# in case the candidate is a rockstar who enjoys programming on Codewars in their spare time.
# The company offering the job may be able to work something out.
#
# method returns false if company's max salary is less than candidate's min salary + that 10 %
# -but if he's codewar's rockstar, company can give 10% more (calculated from developer's min salary)
#
# -method throws an error if min or max salary is not present
# -min and max salary is stored in a hash like in the problem description
#
# method takes candidate and job as an argument
# returns true if the salary for the candidate is less or equal to maximum salary
# wiggle room is introduced in the form of deducting 10% of the min salary when candidate is a codewars rockstar
#
# throw an error if min or max salary is not present

# ************** Examples **************
# candidate1 = { 'min_salary' => 120000 }
# candidate2 = { 'min_salary' => 190000 }
# job1 = { 'max_salary'=>130000 }
# job2 = { 'max_salary' => 80000 }
# job3 = { 'max_salary' => 171000 }

# p match(candidate1, job1) == true
# # => coz her min expectation is 120000 and job 1 offers 130000 so it meets the expectations
# p match(candidate1, job3) == true
# # => coz her min expectation is 120000 and job3 offers 171000 so more
# p match(candidate2, job3) == true
# # => coz her min expectation is 190000 and job3 offers 171000 so less BUT wiggle room was included in the form of 10%
# # of expected min salary so 10 % out of 190000 is 19000 and 171000 + 19000 = 190000 so now it meet expectation
#
# p match(candidate1, job2) == false
# => coz her min expectation is 12000 but the job offers 80 so less than expectation + wiggle room
# p match(candidate2, job1) == false
# => coz her min expectation is 190000 but the job offers 120000 so less than expectation + wiggle room
# p match(candidate2, job2) == false
# => coz her min expectation is 190000 but the job offers 80000 so less than expectation + wiggle room
#
# p match({}, job2) # will throw an error
# p match(candidate1, {}) # error

# ************** Data Structures **************
# Input: 2 hashes, candidate and job
#
# Output: true/false/error
# ************** Notes **************
# # how to throw an error if a value is not present for a key? fetch? YES, use fetch for the error
# ************** Algorithm **************
# -first check if salary is missing in the job hash, if it is, throw an error
#
# -calculate wiggle_room
# -if the salary offered by the company is less than developer's min salary + wiggle room, return false,
# else return true
#
# ************** Code **************
#
# ************** Refactor **************
def match(candidate, job)
  salary_offered = job.fetch("max_salary")
  # p "Salary offered is #{salary_offered}"
  salary_expected = candidate.fetch("min_salary")
  # p "Salary expected is #{salary_expected}"

  wiggle_room = salary_expected * 0.10
  # p "Wiggle room is #{wiggle_room}"
  salary_offered + wiggle_room >= salary_expected ? true : false
end

candidate1 = { 'min_salary' => 120000 }
candidate2 = { 'min_salary' => 190000 }
job1 = { 'max_salary' => 130000 }
job2 = { 'max_salary' => 80000 }
job3 = { 'max_salary' => 171000 }

p match(candidate1, job1) == true
p match(candidate1, job3) == true
p match(candidate2, job3) == true

puts

p match(candidate1, job2) == false
p match(candidate2, job1) == false
p match(candidate2, job2) == false

# p match({}, job2) # will throw an error
# p match(candidate1, {}) # error

puts
def match(candidate, job)
  raise ArgumentError, "min_salary missing from candidate" unless candidate.key?("min_salary")
  raise ArgumentError, "max_salary missing from job" unless job.key?("max_salary")

  candidate["min_salary"] * 0.9 <= job["max_salary"]
end

candidate1 = { 'min_salary' => 120000 }
candidate2 = { 'min_salary' => 190000 }
job1 = { 'max_salary' => 130000 }
job2 = { 'max_salary' => 80000 }
job3 = { 'max_salary' => 171000 }

p match(candidate1, job1) == true
p match(candidate1, job3) == true
p match(candidate2, job3) == true

puts

p match(candidate1, job2) == false
p match(candidate2, job1) == false
p match(candidate2, job2) == false

# p match({}, job2) # will throw an error
# p match(candidate1, {}) # error