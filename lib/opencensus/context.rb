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
  class Context
    THREAD_KEY = :__opencensus_context__

    class << self
      def set key, value
        storage[key] = value
      end

      def get key
        storage[key]
      end

      def reset!
        Thread.current[THREAD_KEY] = {}
      end

      private

      def storage
        Thread.current[THREAD_KEY] ||= reset!
      end
    end
  end
end
