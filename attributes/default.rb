default[:cassandra][:user] = "cassandra"

default[:cassandra][:setup][:deployment] = "12x"
default[:cassandra][:setup][:cluster_size] = 4
default[:cassandra][:setup][:current_role] = "cassandra"

default[:cassandra][:limits][:nofile] = "48000"
default[:cassandra][:limits][:memlock] = "unlimited"
default[:cassandra][:limits][:as] = "unlimited"
