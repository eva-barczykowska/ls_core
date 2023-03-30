# VARIABLE SHADOWING
# A situation can occur in which a variable with the same name is initialized within the block - in the inner/block scope
# and outside of the block, in the outer scope.
# The program will not crash because of this but we may get unexpected results.
# Ruby parser while executing code in the block is looking for the variable with a certain name
# and when it finds it in the form of the block variable, it looks no further.
# Giving the block parameter the same name as the outer scope variable is considered something to be avoided
# because it can lead to unexpected results.
#
# LOCAL VARIABLE SCOPING RULES
# Inner scope has access to variables defined in the outer scope but not vice versa.