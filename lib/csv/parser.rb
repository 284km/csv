# frozen_string_literal: true

class CSV
  class Parser
    def initialize(data)
    end

    def self.parse(*args, &block)
      csv = new(*args)
      # return csv.each(&block) if block_given?

      begin
        csv.read
      ensure
        # csv.close
      end
    end

    def read
      # rows = to_a

      rows = [["a", "b", "c"]]

      # if @use_headers
      #   Table.new(rows)
      # else
      #   rows
      # end
    end
  end
end
