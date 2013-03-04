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


#################################
# cassandra-topology.properties #
#################################
# Example:
#   default['cassandra']['topology'] = {
#     '192.168.1.100' => 'DC1:RAC1',
#     '192.168.2.200' => 'DC2:RAC2'
#   }
default['cassandra']['topology'] = {}


####################
# cassandra-env.sh #
####################
cassandra_env = default['cassandra']['cassandra_env']
cassandra_env['max_heap_size'] = '4G'
cassandra_env['heap_newsize'] = '800M'


##################
# cassandra.yaml #
##################
cassandra_yaml = default['cassandra']['cassandra_yaml']
cassandra_yaml['cluster_name'] = 'Test Cluster'
#cassandra_yaml['initial_token'] = 0
cassandra_yaml['num_tokens'] = 256
cassandra_yaml['seeds'] = '127.0.0.1'

cassandra_yaml['hinted_handoff_enabled'] = true
cassandra_yaml['max_hint_window_in_ms'] = 3600000
cassandra_yaml['hinted_handoff_throttle_in_kb'] = 1024
cassandra_yaml['max_hints_delivery_threads'] = 2

#cassandra_yaml['populate_io_cache_on_flush'] = false

cassandra_yaml['authenticator'] = 'org.apache.cassandra.auth.AllowAllAuthenticator'
cassandra_yaml['authorizer'] = 'org.apache.cassandra.auth.AllowAllAuthorizer'
cassandra_yaml['permissions_validity_in_ms'] = 2000

cassandra_yaml['partitioner'] = 'org.apache.cassandra.dht.Murmur3Partitioner'
# Recommendation: put commit log and data directory on different drives
cassandra_yaml['data_file_directories'] = ['/var/lib/cassandra/data']
cassandra_yaml['commitlog_directory'] = '/var/lib/cassandra/commitlog'
cassandra_yaml['disk_failure_policy'] = 'stop'

cassandra_yaml['key_cache_size_in_mb'] = nil
cassandra_yaml['key_cache_save_period'] = 14400
#cassandra_yaml['key_cache_keys_to_save'] = 100
cassandra_yaml['row_cache_size_in_mb'] = 0
cassandra_yaml['row_cache_save_period'] = 0
#cassandra_yaml['row_cache_keys_to_save'] = 100
cassandra_yaml['row_cache_provider'] = 'SerializingCacheProvider'
cassandra_yaml['saved_caches_directory'] = '/var/lib/cassandra/saved_caches'

cassandra_yaml['commitlog_sync'] = 'periodic'
cassandra_yaml['commitlog_sync_period_in_ms'] = 10000
cassandra_yaml['commitlog_segment_size_in_mb'] = 32

cassandra_yaml['seed_provider'] = [
  { 'class_name' => 'org.apache.cassandra.locator.SimpleSeedProvider',
      'parameters' => [
        { 'seeds' => cassandra_yaml['seeds'] }
      ]
  }
]

cassandra_yaml['flush_largest_memtables_at'] = 0.75
cassandra_yaml['reduce_cache_sizes_at'] = 0.85
cassandra_yaml['reduce_cache_capacity_to'] = 0.6

cassandra_yaml['concurrent_reads'] = 32
cassandra_yaml['concurrent_writes'] = 32

#cassandra_yaml['memtable_total_space_in_mb'] = 2048
#cassandra_yaml['commitlog_total_space_in_mb'] = 4096
#cassandra_yaml['memtable_flush_writers'] = 1
cassandra_yaml['memtable_flush_queue_size'] = 4

cassandra_yaml['trickle_fsync'] = false
cassandra_yaml['trickle_fsync_interval_in_kb'] = 10240

cassandra_yaml['storage_port'] = 7000
cassandra_yaml['ssl_storage_port'] = 7001
#cassandra_yaml['listen_address'] = 'localhost'
#cassandra_yaml['broadcast_address'] = '1.2.3.4'
cassandra_yaml['listen_address'] = node['ipaddress']
cassandra_yaml['broadcast_address'] = node['ipaddress']

cassandra_yaml['start_native_transport'] = false
cassandra_yaml['native_transport_port'] = 9042
cassandra_yaml['native_transport_min_threads'] = 16
cassandra_yaml['native_transport_max_threads'] = 128

cassandra_yaml['start_rpc'] = true
cassandra_yaml['rpc_address'] = '0.0.0.0'
cassandra_yaml['rpc_port'] = 9160
cassandra_yaml['rpc_keepalive'] = true
cassandra_yaml['rpc_server_type'] = 'sync'
#cassandra_yaml['rpc_min_threads'] = 16
#cassandra_yaml['rpc_max_threads'] = 2048
#cassandra_yaml['rpc_send_buff_size_in_bytes'] = nil
#cassandra_yaml['rpc_recv_buff_size_in_bytes'] = nil
#cassandra_yaml['internode_send_buff_size_in_bytes'] = nil
#cassandra_yaml['internode_recv_buff_size_in_bytes'] = nil
cassandra_yaml['thrift_framed_transport_size_in_mb'] = 15
cassandra_yaml['thrift_max_message_length_in_mb'] = 16

cassandra_yaml['incremental_backups'] = false
cassandra_yaml['snapshot_before_compaction'] = false
cassandra_yaml['auto_snapshot'] = true

cassandra_yaml['column_index_size_in_kb'] = 64
cassandra_yaml['in_memory_compaction_limit_in_mb'] = 64
cassandra_yaml['multithreaded_compaction'] = false
cassandra_yaml['compaction_throughput_mb_per_sec'] = 16
cassandra_yaml['compaction_preheat_key_cache'] = true

cassandra_yaml['read_request_timeout_in_ms'] = 10000
cassandra_yaml['range_request_timeout_in_ms'] = 10000
cassandra_yaml['write_request_timeout_in_ms'] = 10000
cassandra_yaml['truncate_request_timeout_in_ms'] = 60000
cassandra_yaml['request_timeout_in_ms'] = 10000
cassandra_yaml['cross_node_timeout'] = false
#cassandra_yaml['streaming_socket_timeout_in_ms'] = 0
#cassandra_yaml['phi_convict_threshold'] = 8

cassandra_yaml['endpoint_snitch'] = 'org.apache.cassandra.locator.SimpleSnitch'
cassandra_yaml['dynamic_snitch_update_interval_in_ms'] = 100
cassandra_yaml['dynamic_snitch_reset_interval_in_ms'] = 600000
cassandra_yaml['dynamic_snitch_badness_threshold'] = 0.1

cassandra_yaml['request_scheduler'] = 'org.apache.cassandra.scheduler.NoScheduler'
#cassandra_yaml['request_scheduler_options']['throttle_limit'] = 80
#cassandra_yaml['request_scheduler_options']['default_weight'] = 5
#cassandra_yaml['request_scheduler_options']['weights'] = { 'Keyspace1' => 1, 'Keyspace2' => 5' }
#cassandra_yaml['request_scheduler_id'] = 'keyspace'

cassandra_yaml['index_interval'] = 128

cassandra_yaml['server_encryption_options']['internode_encryption'] = 'none'
cassandra_yaml['server_encryption_options']['keystore'] = 'conf/.keystore'
cassandra_yaml['server_encryption_options']['keystore_password'] = 'cassandra'
cassandra_yaml['server_encryption_options']['truststore'] = 'conf/.truststore'
cassandra_yaml['server_encryption_options']['truststore_password'] = 'cassandra'

cassandra_yaml['client_encryption_options']['enabled'] = false
cassandra_yaml['client_encryption_options']['keystore'] = 'conf/.keystore'
cassandra_yaml['client_encryption_options']['keystore_password'] = 'cassandra'

cassandra_yaml['internode_compression'] = 'all'
cassandra_yaml['inter_dc_tcp_nodelay'] = true
