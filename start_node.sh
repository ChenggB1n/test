#!/bin/bash

# 定义基础名称、起始IP地址、和起始主机名编号
base_name="node_exporter"
base_ip="10.1.4."
base_hostname="store"
start_index=211
end_index=250

# 定义挂载的卷
volumes=(

	"/lotus-data/store-4-1-sda1:/lotus-data/store-sda1"
	"/lotus-data/store-4-1-sdb1:/lotus-data/store-sdb1"
	"/lotus-data/store-4-1-sdc1:/lotus-data/store-sdc1"
	"/lotus-data/store-4-1-sde1:/lotus-data/store-sde1"
	"/lotus-data/store-4-1-sdf1:/lotus-data/store-sdf1"
	"/lotus-data/store-4-1-sdg1:/lotus-data/store-sdg1"
	"/lotus-data/store-4-1-sdh1:/lotus-data/store-sdh1"
	"/lotus-data/store-4-1-sdi1:/lotus-data/store-sdi1"
	"/lotus-data/store-4-1-sdj1:/lotus-data/store-sdj1"
	"/lotus-data/store-4-1-sdk1:/lotus-data/store-sdk1"
	"/lotus-data/store-4-1-sdl1:/lotus-data/store-sdl1"
	"/lotus-data/store-4-1-sdm1:/lotus-data/store-sdm1"
	"/lotus-data/store-4-1-sdn1:/lotus-data/store-sdn1"
	"/lotus-data/store-4-1-sdo1:/lotus-data/store-sdo1"
	"/lotus-data/store-4-1-sdp1:/lotus-data/store-sdp1"
	"/lotus-data/store-4-1-sdq1:/lotus-data/store-sdq1"
	"/lotus-data/store-4-1-sdr1:/lotus-data/store-sdr1"
	"/lotus-data/store-4-1-sds1:/lotus-data/store-sds1"
	"/lotus-data/store-4-1-sdt1:/lotus-data/store-sdt1"
	"/lotus-data/store-4-1-sdu1:/lotus-data/store-sdu1"
	"/lotus-data/store-4-1-sdv1:/lotus-data/store-sdv1"
	"/lotus-data/store-4-1-sdw1:/lotus-data/store-sdw1"
	"/lotus-data/store-4-1-sdx1:/lotus-data/store-sdx1"
	"/lotus-data/store-4-1-sdy1:/lotus-data/store-sdy1"
	"/lotus-data/store-4-1-sdz1:/lotus-data/store-sdz1"
	"/lotus-data/store-4-1-sdaa1:/lotus-data/store-sdaa1"
	"/lotus-data/store-4-1-sdab1:/lotus-data/store-sdab1"
	"/lotus-data/store-4-1-sdac1:/lotus-data/store-sdac1"
	"/lotus-data/store-4-1-sdad1:/lotus-data/store-sdad1"
	"/lotus-data/store-4-1-sdae1:/lotus-data/store-sdae1"
	"/lotus-data/store-4-1-sdaf1:/lotus-data/store-sdaf1"
	"/lotus-data/store-4-1-sdag1:/lotus-data/store-sdag1"
	"/lotus-data/store-4-1-sdah1:/lotus-data/store-sdah1"
	"/lotus-data/store-4-1-sdai1:/lotus-data/store-sdai1"
	"/lotus-data/store-4-1-sdaj1:/lotus-data/store-sdaj1"
	"/lotus-data/store-4-1-sdak1:/lotus-data/store-sdak1"
)


# 循环启动多个容器
for i in $(seq $start_index $end_index); do
  container_name="${base_name}${i}"
  container_ip="${base_ip}${i}"
  container_hostname="${base_hostname}${i}"

  # 构建 docker run 命令
  docker_run_cmd="docker run -d --name ${container_name} --network my_macvlan_network --ip ${container_ip} --hostname ${container_hostname}"

  # 添加挂载的卷
  for volume in "${volumes[@]}"; do
    docker_run_cmd+=" -v ${volume}"
  done

  # 指定镜像
  docker_run_cmd+=" docker.chenby.cn/bitnami/node-exporter"

  # 执行 docker run 命令
  echo "Running: ${docker_run_cmd}"
  eval "${docker_run_cmd}"
done

