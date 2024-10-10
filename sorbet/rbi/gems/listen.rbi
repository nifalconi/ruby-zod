# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/listen/all/listen.rbi
#
# listen-3.9.0

module Listen
  def self.adapter_warn(message); end
  def self.adapter_warn_behavior; end
  def self.adapter_warn_behavior=(arg0); end
  def self.adapter_warn_behavior_callback(message); end
  def self.default_logger; end
  def self.logger; end
  def self.logger=(arg0); end
  def self.stop; end
  def self.to(*args, &block); end
end
class Listen::Options
  def initialize(opts, defaults); end
  def method_missing(name, *_); end
  def respond_to_missing?(name, *_); end
end
class Listen::Record
  def _fast_build_dir(remaining, symlink_detector); end
  def _fast_try_file(entry); end
  def _fast_unset_path(dirname, basename); end
  def _fast_update_file(dirname, basename, data); end
  def add_dir(rel_path); end
  def build; end
  def dir_entries(rel_path); end
  def empty_dirname?(dirname); end
  def file_data(rel_path); end
  def initialize(directory, silencer); end
  def reset_tree; end
  def root; end
  def unset_path(rel_path); end
  def update_file(rel_path, data); end
end
class Listen::Record::Entry
  def _entries(dir); end
  def _join; end
  def children; end
  def initialize(root, relative, name = nil); end
  def meta; end
  def name; end
  def real_path; end
  def record_dir_key; end
  def relative; end
  def root; end
  def sys_path; end
end
class Listen::Error < RuntimeError
end
class Listen::Error::NotStarted < Listen::Error
end
class Listen::Error::SymlinkLoop < Listen::Error
end
class Listen::Error::INotifyMaxWatchesExceeded < Listen::Error
end
class Listen::Record::SymlinkDetector
  def _fail(symlinked, real_path); end
  def initialize; end
  def verify_unwatched!(entry); end
  def warn(message); end
end
class Listen::File
  def self.change(record, rel_path); end
  def self.inaccurate_mac_time?(stat); end
end
class Listen::Directory
  def self._async_changes(snapshot, path, previous, options); end
  def self._change(snapshot, type, path, options); end
  def self._children(path); end
  def self.ascendant_of?(base, other); end
  def self.scan(snapshot, rel_path, options); end
end
class Listen::Change
  def initialize(config, record); end
  def invalidate(type, rel_path, options); end
  def record; end
end
class Listen::Change::Config
  def initialize(queue, silencer); end
  def queue(*args); end
  def silenced?(path, type); end
end
module Listen::Thread
  def self._exception_with_causes(exception); end
  def self._log_exception(exception, thread_name, caller_stack: nil); end
  def self.new(name, &block); end
  def self.rescue_and_log(method_name, *args, caller_stack: nil); end
end
module Listen::Adapter
  def self._usable_adapter_class; end
  def self._warn_polling_fallback(options); end
  def self.select(options = nil); end
end
class Listen::Adapter::Base
  def _log_exception(msg, caller_stack); end
  def _queue_change(type, dir, rel_path, options); end
  def _stop; end
  def _timed(title); end
  def config; end
  def configure; end
  def initialize(config); end
  def options; end
  def self.usable?; end
  def start; end
  def started?; end
  def stop; end
end
class Listen::Adapter::BSD < Listen::Adapter::Base
  def _change(event_flags); end
  def _configure(directory, &callback); end
  def _event_path(event); end
  def _find(*paths, &block); end
  def _process_event(dir, event); end
  def _run; end
  def _watch_file(path, queue); end
  def _watch_for_new_file(event); end
  def self.usable?; end
end
class Listen::Adapter::Darwin < Listen::Adapter::Base
  def _configure(dir, &callback); end
  def _process_changes(dirs); end
  def _process_event(dir, path); end
  def _run; end
  def _stop; end
  def self.usable?; end
end
class Listen::Adapter::Linux < Listen::Adapter::Base
  def _change(event_flags); end
  def _configure(directory, &callback); end
  def _dir_event?(event); end
  def _process_event(dir, event); end
  def _run; end
  def _skip_event?(event); end
  def _stop; end
end
class Listen::Adapter::Polling < Listen::Adapter::Base
  def _configure(_, &callback); end
  def _process_event(dir, _); end
  def _run; end
end
class Listen::Adapter::Windows < Listen::Adapter::Base
  def _change(type); end
  def _configure(dir); end
  def _process_event(dir, event); end
  def _run; end
  def self.usable?; end
end
class Listen::Adapter::Config
  def adapter_options; end
  def directories; end
  def initialize(directories, queue, silencer, adapter_options); end
  def queue; end
  def silencer; end
end
class Listen::Backend
  def adapter; end
  def initialize(directories, queue, silencer, config); end
  def min_delay_between_events; end
  def start(*args, **, &block); end
  def stop(*args, **, &block); end
  extend Forwardable
end
class Listen::Silencer
  def _ignore?(path); end
  def _init_ignores(ignores, overrides); end
  def _only?(path); end
  def configure(options); end
  def ignore_patterns; end
  def ignore_patterns=(arg0); end
  def initialize(**options); end
  def only_patterns; end
  def only_patterns=(arg0); end
  def silenced?(relative_path, type); end
end
class Listen::Silencer::Controller
  def _reconfigure_silencer(extra_options); end
  def append_ignores(*regexps); end
  def initialize(silencer, default_options); end
  def replace_with_bang_ignores(regexps); end
  def replace_with_only(regexps); end
end
class Listen::QueueOptimizer
  def _calculate_add_remove_difference(actions, path, default_if_exists); end
  def _logical_action_for(path, actions); end
  def _reinterpret_related_changes(cookies); end
  def _squash_changes(changes); end
  def config; end
  def editor_modified?(changes); end
  def initialize(config); end
  def smoosh_changes(changes); end
end
class Listen::QueueOptimizer::Config
  def debug(*args, &block); end
  def exist?(path); end
  def initialize(adapter_class, silencer); end
  def silenced?(path, type); end
end
module Listen::FSM
  def current_state; end
  def initialize_fsm; end
  def self.included(klass); end
  def state; end
  def transition!(new_state_name); end
  def transition(new_state_name); end
  def transition_with_callbacks!(new_state); end
  def validate_and_sanitize_new_state(new_state_name); end
  def wait_for_state(*wait_for_states, timeout: nil); end
end
module Listen::FSM::ClassMethods
  def start_state(new_start_state = nil); end
  def state(state_name, to: nil, &block); end
  def states; end
end
class Listen::FSM::State
  def call(obj); end
  def initialize(name, transitions, &block); end
  def name; end
  def transitions; end
  def valid_transition?(new_state); end
end
module Listen::MonotonicTime
  def self.now; end
end
module Listen::Event
end
class Listen::Event::Processor
  def _check_stopped; end
  def _deadline; end
  def _flush_wakeup_reasons; end
  def _process_changes(event); end
  def _remember_time_of_first_unprocessed_event; end
  def _reset_no_unprocessed_events; end
  def _sleep(seconds); end
  def _wait_until_events; end
  def _wait_until_events_calm_down; end
  def _wait_until_no_longer_paused; end
  def config; end
  def initialize(config, reasons); end
  def loop_for(latency); end
end
class Listen::Event::Processor::Stopped < RuntimeError
end
class Listen::Event::Loop
  def _process_changes; end
  def _wakeup(reason); end
  def initialize(config); end
  def pause; end
  def start; end
  def started?; end
  def stop; end
  def stopped?; end
  def wakeup_on_event; end
  extend Listen::FSM::ClassMethods
  include Listen::FSM
end
class Listen::Event::Queue
  def <<(args); end
  def _safe_relative_from_cwd(dir); end
  def close(*args, **, &block); end
  def empty?(*args, **, &block); end
  def initialize(config); end
  def pop(*args, **, &block); end
  extend Forwardable
end
class Listen::Event::Queue::Config
  def initialize(relative); end
  def relative?; end
end
class Listen::Event::Config
  def call(*args); end
  def callable?; end
  def event_queue; end
  def initialize(listener, event_queue, queue_optimizer, wait_for_delay, &block); end
  def listener; end
  def min_delay_between_events; end
  def optimize_changes(changes); end
  def sleep(seconds); end
end
class Listen::Listener
  def ignore!(regexps); end
  def ignore(regexps); end
  def initialize(*dirs, &block); end
  def only(regexps); end
  def pause; end
  def paused?; end
  def processing?; end
  def start; end
  def stop; end
  def stopped?; end
  extend Listen::FSM::ClassMethods
  include Listen::FSM
end
class Listen::Listener::Config
  def adapter_instance_options(klass); end
  def adapter_select_options; end
  def initialize(opts); end
  def min_delay_between_events; end
  def relative?; end
  def silencer_rules; end
end
