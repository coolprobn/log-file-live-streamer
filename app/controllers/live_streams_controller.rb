require 'file_streaming_app/sse'
require 'file_streaming_app/log_file'

class LiveStreamsController < ApplicationController
  include ActionController::Live

  def log_file
    response.headers['Content-Type'] = 'text/event-stream'

    # hack due to new version of rack not supporting sse and sending all response at once: https://github.com/rack/rack/issues/1619#issuecomment-848460528
    response.headers['Last-Modified'] = Time.now.httpdate

    sse = FileStreamingApp::SSE.new(response.stream)

    log_file_path = Rails.root.join('log/development.log').to_s

    file = FileStreamingApp::LogFile.new

    # watch development.log file for changes
    Filewatcher.new([log_file_path]).watch do |_file_path, event_type|
      next unless event_type.to_s.eql?('updated')

      file_lines = file.added_lines(log_file_path)

      sse.write(file_lines)
    end
  ensure
    sse.close
  end
end
