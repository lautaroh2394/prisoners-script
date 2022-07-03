require_relative 'BoxFinder'
require_relative 'runPrision'
require_relative 'runNPrisions'


$ALLOWED_BOXES_TO_LOOK = 50
$TOTAL_PRISIONERS = 100
$LOG = false
$TOTAL_PRISIONS = 1000

if ARGV[0] then $TOTAL_PRISIONS = ARGV[0].to_i end
if ARGV[1] then $LOG = (ARGV[1] == 'true') end
if ARGV[2] then $ALLOWED_BOXES_TO_LOOK = ARGV[2].to_i end
if ARGV[3] then $TOTAL_PRISIONERS = ARGV[3].to_i end

start = Time.now
runNPrisions($TOTAL_PRISIONS)
endTime = Time.now
total = endTime - start
formatted = "#{total} seconds"
if total > 60 then formatted = "#{total / 60} minutes" end

puts "total time: #{formatted}"
puts("average calculation time for each run: #{total / $TOTAL_PRISIONS}")