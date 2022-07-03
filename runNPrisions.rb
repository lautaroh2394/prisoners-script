require_relative 'logEveryHundThous'

def runNPrisions(n, thread = nil)
    successes = 0
    failures = 0

    n.times do |m|
        result = runPrision($TOTAL_PRISIONERS)
        log "#{thread.nil? ? "" : "thread-#{thread} "}prison #{m}: #{result}"
        !$LOG && logEveryHundThous(n, m, "#{thread.nil? ? "" : "thread-#{thread} "}running prison #{m}...")
        if result then successes = successes + 1
        else failures = failures + 1
        end
    end

    if thread.nil? then
        puts("successes: #{successes}")
        puts("failures: #{failures}")
        puts("success rate: #{successes.to_f / (successes + failures)}")
    end
    return {
        :successes=> successes,
        :failures=> failures
    }
end