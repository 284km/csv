#!/usr/bin/env ruby -w
# encoding: UTF-8
# frozen_string_literal: false

require_relative "base"

class TestCSV::ParserParsing < TestCSV
  extend DifferentOFS

  def test_parser_parse
    data = <<~DATA
      a,b,c
    DATA
    assert_equal([["a", "b", "c"]], CSV::Parser.parse(data))
  end
end
