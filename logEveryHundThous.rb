require_relative 'log'

def logEveryHundThous(n, m, s)
    if (n > 100000 && ((m % 100000) == 0)) then puts s end
end