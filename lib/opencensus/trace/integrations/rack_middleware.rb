# Copyright 2017 OpenCensus Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module OpenCensus
  module Trace
    module Integrations
      class RackMiddleware
        def initialize app
          @app = app
        end

        def call env
          OpenCensus::Context.clear
          trace = OpenCensus::Trace.start
          begin
            OpenCensus::Trace.in_span "rack-request" do |span|
              @app.call env
            end
          ensure
            send_trace trace, env
          end
        end

        def send_trace trace, env
          require 'pp'
          pp trace
        end
      end
    end
  end
end
