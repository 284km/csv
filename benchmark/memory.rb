require "benchmark/memory"

require 'csv'

n_rows = 100000
alphas = []
n = 5
n.times { alphas << "AAAAA" }
unquoted = (alphas.join(",") + "\r\n") * n_rows
quoted = (alphas.map { |s| %("#{s}") }.join(",") + "\r\n") * n_rows

# def allocate_string
#   "this string was dynamically allocated"
# end

# def give_frozen_string
#   "this string is frozen".freeze
# end

Benchmark.memory do |x|
  # x.report("dynamic allocation") { allocate_string }
  # x.report("frozen string") { give_frozen_string }

  x.report("unquoted") { CSV.parse(unquoted) }
  x.report("quoted") { CSV.parse(quoted) }
  x.report("(libcsv) unquoted") { LibCsv.parse(unquoted) }
  x.report("(libcsv) quoted") { LibCsv.parse(quoted) }

  x.compare!
end
