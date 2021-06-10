module FileStreamingApp
  class LogFile
    def added_lines(file_path)
      file_content = File.open(file_path).readlines
      total_lines = file_content.length

      @last_known_line_position ||= initial_line_position(total_lines)

      start_position = @last_known_line_position

      @last_known_line_position = total_lines

      file_content[start_position, total_lines]
    end

    private

    def initial_line_position(total_lines)
      return 0 if total_lines.zero? || total_lines <= 20

      # print last 20 lines from the file if event is emitted for the first time
      total_lines - 20
    end
  end
end
