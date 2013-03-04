# Copyright 2012, Nathan Milford.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


####################
# cassandra-env.sh #
####################
default['Cassandra']['cassandra_env']['max_heap_size'] = '4G'
default['Cassandra']['cassandra_env']['heap_newsize'] = '800M'


##################
# cassandra.yaml #
##################
default['Cassandra']['cassandra_yaml']['cluster_name'] = 'Test Cluster'
#default['Cassandra']['cassandra_yaml']['initial_token'] = 0
default['Cassandra']['cassandra_yaml']['num_tokens'] = 256
default['Cassandra']['cassandra_yaml']['seeds'] = '127.0.0.1'

default['Cassandra']['cassandra_yaml']['hinted_handoff_enabled'] = true
default['Cassandra']['cassandra_yaml']['max_hint_window_in_ms'] = 3600000
default['Cassandra']['cassandra_yaml']['hinted_handoff_throttle_in_kb'] = 1024
default['Cassandra']['cassandra_yaml']['max_hints_delivery_threads'] = 2

#default['Cassandra']['cassandra_yaml']['populate_io_cache_on_flush'] = false

default['Cassandra']['cassandra_yaml']['authenticator'] = 'org.apache.cassandra.auth.AllowAllAuthenticator'
default['Cassandra']['cassandra_yaml']['authorizer'] = 'org.apache.cassandra.auth.AllowAllAuthorizer'
default['Cassandra']['cassandra_yaml']['permissions_validity_in_ms'] = 2000

default['Cassandra']['cassandra_yaml']['partitioner'] = 'org.apache.cassandra.dht.Murmur3Partitioner'
default['Cassandra']['cassandra_yaml']['data_file_directories'] = ['/var/lib/cassandra/data']
default['Cassandra']['cassandra_yaml']['commitlog_directory'] = '/var/lib/cassandra/commitlog'
default['Cassandra']['cassandra_yaml']['disk_failure_policy'] = 'stop'

default['Cassandra']['cassandra_yaml']['key_cache_size_in_mb'] = nil
default['Cassandra']['cassandra_yaml']['key_cache_save_period'] = 14400
#default['Cassandra']['cassandra_yaml']['key_cache_keys_to_save'] = 100
default['Cassandra']['cassandra_yaml']['row_cache_size_in_mb'] = 0
default['Cassandra']['cassandra_yaml']['row_cache_save_period'] = 0
#default['Cassandra']['cassandra_yaml']['row_cache_keys_to_save'] = 100
default['Cassandra']['cassandra_yaml']['row_cache_provider'] = 'SerializingCacheProvider'
default['Cassandra']['cassandra_yaml']['saved_caches_directory'] = '/var/lib/cassandra/saved_caches'

default['Cassandra']['cassandra_yaml']['commitlog_sync'] = 'periodic'
default['Cassandra']['cassandra_yaml']['commitlog_sync_period_in_ms'] = 10000
default['Cassandra']['cassandra_yaml']['commitlog_segment_size_in_mb'] = 32

default['Cassandra']['cassandra_yaml']['seed_provider'] = [
  { 'class_name' => 'org.apache.cassandra.locator.SimpleSeedProvider',
      'parameters' => [
        { 'seeds' => default['Cassandra']['cassandra_yaml']['seeds'] }
      ]
  }
]

default['Cassandra']['cassandra_yaml']['flush_largest_memtables_at'] = 0.75
default['Cassandra']['cassandra_yaml']['reduce_cache_sizes_at'] = 0.85
default['Cassandra']['cassandra_yaml']['reduce_cache_capacity_to'] = 0.6

default['Cassandra']['cassandra_yaml']['concurrent_reads'] = 32
default['Cassandra']['cassandra_yaml']['concurrent_writes'] = 32

#default['Cassandra']['cassandra_yaml']['memtable_total_space_in_mb'] = 2048
#default['Cassandra']['cassandra_yaml']['commitlog_total_space_in_mb'] = 4096
#default['Cassandra']['cassandra_yaml']['memtable_flush_writers'] = 1
default['Cassandra']['cassandra_yaml']['memtable_flush_queue_size'] = 4

default['Cassandra']['cassandra_yaml']['trickle_fsync'] = false
default['Cassandra']['cassandra_yaml']['trickle_fsync_interval_in_kb'] = 10240

default['Cassandra']['cassandra_yaml']['storage_port'] = 7000
default['Cassandra']['cassandra_yaml']['ssl_storage_port'] = 7001
#default['Cassandra']['cassandra_yaml']['listen_address'] = 'localhost'
#default['Cassandra']['cassandra_yaml']['broadcast_address'] = '1.2.3.4'
default['Cassandra']['cassandra_yaml']['listen_address'] = node['ipaddress']
default['Cassandra']['cassandra_yaml']['broadcast_address'] = node['ipaddress']

default['Cassandra']['cassandra_yaml']['start_native_transport'] = false
default['Cassandra']['cassandra_yaml']['native_transport_port'] = 9042
default['Cassandra']['cassandra_yaml']['native_transport_min_threads'] = 16
default['Cassandra']['cassandra_yaml']['native_transport_max_threads'] = 128

default['Cassandra']['cassandra_yaml']['start_rpc'] = true
default['Cassandra']['cassandra_yaml']['rpc_address'] = '0.0.0.0'
default['Cassandra']['cassandra_yaml']['rpc_port'] = 9160
default['Cassandra']['cassandra_yaml']['rpc_keepalive'] = true
default['Cassandra']['cassandra_yaml']['rpc_server_type'] = 'sync'
#default['Cassandra']['cassandra_yaml']['rpc_min_threads'] = 16
#default['Cassandra']['cassandra_yaml']['rpc_max_threads'] = 2048
#default['Cassandra']['cassandra_yaml']['rpc_send_buff_size_in_bytes'] = nil
#default['Cassandra']['cassandra_yaml']['rpc_recv_buff_size_in_bytes'] = nil
#default['Cassandra']['cassandra_yaml']['internode_send_buff_size_in_bytes'] = nil
#default['Cassandra']['cassandra_yaml']['internode_recv_buff_size_in_bytes'] = nil
default['Cassandra']['cassandra_yaml']['thrift_framed_transport_size_in_mb'] = 15
default['Cassandra']['cassandra_yaml']['thrift_max_message_length_in_mb'] = 16

default['Cassandra']['cassandra_yaml']['incremental_backups'] = false
default['Cassandra']['cassandra_yaml']['snapshot_before_compaction'] = false
default['Cassandra']['cassandra_yaml']['auto_snapshot'] = true

default['Cassandra']['cassandra_yaml']['column_index_size_in_kb'] = 64
default['Cassandra']['cassandra_yaml']['in_memory_compaction_limit_in_mb'] = 64
default['Cassandra']['cassandra_yaml']['multithreaded_compaction'] = false
default['Cassandra']['cassandra_yaml']['compaction_throughput_mb_per_sec'] = 16
default['Cassandra']['cassandra_yaml']['compaction_preheat_key_cache'] = true

default['Cassandra']['cassandra_yaml']['read_request_timeout_in_ms'] = 10000
default['Cassandra']['cassandra_yaml']['range_request_timeout_in_ms'] = 10000
default['Cassandra']['cassandra_yaml']['write_request_timeout_in_ms'] = 10000
default['Cassandra']['cassandra_yaml']['truncate_request_timeout_in_ms'] = 60000
default['Cassandra']['cassandra_yaml']['request_timeout_in_ms'] = 10000
default['Cassandra']['cassandra_yaml']['cross_node_timeout'] = false
#default['Cassandra']['cassandra_yaml']['streaming_socket_timeout_in_ms'] = 0
#default['Cassandra']['cassandra_yaml']['phi_convict_threshold'] = 8

default['Cassandra']['cassandra_yaml']['endpoint_snitch'] = 'org.apache.cassandra.locator.SimpleSnitch'
default['Cassandra']['cassandra_yaml']['dynamic_snitch_update_interval_in_ms'] = 100
default['Cassandra']['cassandra_yaml']['dynamic_snitch_reset_interval_in_ms'] = 600000
default['Cassandra']['cassandra_yaml']['dynamic_snitch_badness_threshold'] = 0.1

default['Cassandra']['cassandra_yaml']['request_scheduler'] = 'org.apache.cassandra.scheduler.NoScheduler'
#default['Cassandra']['cassandra_yaml']['request_scheduler_options']['throttle_limit'] = 80
#default['Cassandra']['cassandra_yaml']['request_scheduler_options']['default_weight'] = 5
#default['Cassandra']['cassandra_yaml']['request_scheduler_options']['weights'] = { 'Keyspace1' => 1, 'Keyspace2' => 5' }
#default['Cassandra']['cassandra_yaml']['request_scheduler_id'] = 'keyspace'

default['Cassandra']['cassandra_yaml']['index_interval'] = 128

default['Cassandra']['cassandra_yaml']['server_encryption_options']['internode_encryption'] = 'none'
default['Cassandra']['cassandra_yaml']['server_encryption_options']['keystore'] = 'conf/.keystore'
default['Cassandra']['cassandra_yaml']['server_encryption_options']['keystore_password'] = 'cassandra'
default['Cassandra']['cassandra_yaml']['server_encryption_options']['truststore'] = 'conf/.truststore'
default['Cassandra']['cassandra_yaml']['server_encryption_options']['truststore_password'] = 'cassandra'

default['Cassandra']['cassandra_yaml']['client_encryption_options']['enabled'] = false
default['Cassandra']['cassandra_yaml']['client_encryption_options']['keystore'] = 'conf/.keystore'
default['Cassandra']['cassandra_yaml']['client_encryption_options']['keystore_password'] = 'cassandra'

default['Cassandra']['cassandra_yaml']['internode_compression'] = 'all'
default['Cassandra']['cassandra_yaml']['inter_dc_tcp_nodelay'] = true
