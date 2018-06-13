#!/usr/bin/env ruby

require "csv"
# require "optparse"

require "benchmark/ips"

n_rows = 10000

# parser = OptionParser.new
# parser.on("--n-rows=N", Integer,
#           "The number of rows to be parsed",
#           "(#{n_rows})") do |n|
#   n_rows = n
# end
# parser.parse!(ARGV)

alphas = []
n = 5
# n.times { alphas << "AAAAA"*10000 }
n.times { alphas << "AAAAA" }
unquoted = (alphas.join(",") + "\r\n") * n_rows
quoted = (alphas.map { |s| %("#{s}") }.join(",") + "\r\n") * n_rows

# data = File.read('big.csv')

Benchmark.ips do |x|
  # inc_col_sep = (alphas.map { |s| %(",#{s}") }.join(",") + "\r\n") * n_rows
  # inc_row_sep = (alphas.map { |s| %("#{s}\r\n") }.join(",") + "\r\n") * n_rows

  # hiraganas = ["あああああ"] * 50
  # enc_utf8 = (hiraganas.join(",") + "\r\n") * n_rows
  # enc_sjis = enc_utf8.encode("Windows-31J")

  # x.report("big") { CSV.parse(data) }
  # x.report("big libcsv") { LibCsv.parse(data) }
  x.report("unquoted") { CSV.parse(unquoted) }
  x.report("quoted") { CSV.parse(quoted) }
  x.report("(libcsv) unquoted") { LibCsv.parse(unquoted) }
  x.report("(libcsv) quoted") { LibCsv.parse(quoted) }
  # x.report("include col_sep") { CSV.parse(inc_col_sep) }
  # x.report("include row_sep") { CSV.parse(inc_row_sep) }
  # x.report("encode utf-8") { CSV.parse(enc_utf8) }
  # x.report("encode sjis") { CSV.parse(enc_sjis) }

  # x.report("(libcsv) unquoted") { LibCsv.parse(unquoted) }
  # x.report("(libcsv) quoted") { LibCsv.parse(quoted) }
  # x.report("(libcsv) include col_sep") { LibCsv.parse(inc_col_sep) }
  # x.report("(libcsv) include row_sep") { LibCsv.parse(inc_row_sep) }
  # x.report("(libcsv) encode utf-8") { LibCsv.parse(enc_utf8) }
  # x.report("(libcsv) encode sjis") { LibCsv.parse(enc_sjis) }
end
