require_relative 'BoxFinder'
require_relative 'runPrision'
require_relative 'runNPrisions'


$ALLOWED_BOXES_TO_LOOK = 50
$TOTAL_PRISIONERS = 100
$LOG = false
$TOTAL_PRISIONS = 1000
$NUMBER_OF_THREADS = 4

if ARGV[0] then $TOTAL_PRISIONS = ARGV[0].to_i end
if ARGV[1] then $NUMBER_OF_THREADS = ARGV[1].to_i end
if ARGV[2] then $LOG = (ARGV[2] == 'true') end
if ARGV[3] then $ALLOWED_BOXES_TO_LOOK = ARGV[3].to_i end
if ARGV[4] then $TOTAL_PRISIONERS = ARGV[4].to_i end

start = Time.now
prisonsForThread = ($TOTAL_PRISIONS.to_f / $NUMBER_OF_THREADS).to_i
puts "Asigning #{prisonsForThread} prisons for each threads"

results = (1..$NUMBER_OF_THREADS).map{ |i|
    puts "starting thread #{i}..."
    Thread.new {
        Thread.current[:results] = runNPrisions(prisonsForThread, i)
    }
}.map{ |thread|
    thread.join
    thread[:results]
}.reduce({
    :successes => 0,
    :failures => 0,
}){ | acc, results|
 {
    :successes=> results[:successes] + acc[:successes],
    :failures=> results[:failures] + acc[:failures],
 }
}

puts("total runs: #{results[:successes] + results[:failures]}")
puts("successes: #{results[:successes]}")
puts("failures: #{results[:failures]}")
puts("success rate: #{results[:successes].to_f / (results[:successes] + results[:failures])}")

endTime = Time.now
total = endTime - start
formatted = "#{total} seconds"
if total > 60 then formatted = "#{total / 60} minutes" end

puts "total time: #{formatted}"
