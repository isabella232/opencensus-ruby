# Release History

### 0.2.1 / 2018-03-05

* Clarify Ruby version requirement (2.2+)
* Fix exceptions in the config library on Ruby 2.2 and 2.3.
* Automatically require opencensus base library from standard integrations.

### 0.2.0 / 2018-02-13

* Span creation sets the "same_process_as_parent_span" field if possible.
* The "stack_trace_hash_id" field was missing from the interfaces. Fixed.
* Nullability of a few fields did not match the proto specs. Fixed.
* Fixed some documentation errors and omissions.

### 0.1.0 / 2018-01-12

Initial release of the core library, including:

* Trace interfaces
* Rack integration
* Rails integration
* Faraday integration
* Logging exporter