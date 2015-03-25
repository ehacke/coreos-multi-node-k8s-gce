#!/bin/bash

mkdir ~/k8s-bin
# download etcd and fleet clients for Linux
ETCD_RELEASE=$(cat bootstrap_k8s_cluster.sh | grep ETCD_RELEASE= | head -1 | cut -f2 -d"=")
echo "Downloading etcdctl $ETCD_RELEASE for Linux"
curl -L -o etcd.tar.gz "https://github.com/coreos/etcd/releases/download/$ETCD_RELEASE/etcd-$ETCD_RELEASE-linux-amd64.tar.gz"
tar xzvf "etcd.tar.gz" "etcd-$ETCD_RELEASE-linux-amd64/etcdctl"
mv etcd-$ETCD_RELEASE-linux-amd64/etcdctl ~/k8s-bin
# clean up
rm -f etcd.tar.gz
echo "etcdctl was copied to ~/k8s-bin"
echo " "

#
FLEET_RELEASE=$(cat bootstrap_k8s_cluster.sh | grep FLEET_RELEASE= | head -1 | cut -f2 -d"=")
echo "Downloading fleetctl $FLEET_RELEASE for Linux"
curl -L -o fleet.tar.gz "https://github.com/coreos/fleet/releases/download/$FLEET_RELEASE/fleet-$FLEET_RELEASE-linux-amd64.tar.gz"
tar xzvf "fleet.tar.gz" "fleet-$FLEET_RELEASE-linux-amd64/fleetctl"
mv fleet-$FLEET_RELEASE-linux-amd64/fleetctl ~/k8s-bin
# clean up
rm -f fleet.tar.gz
echo "fleetctl was copied to ~/k8s-bin "
echo " "

# download kubernetes binaries for OS X
# k8s version
k8s_version=$(cat bootstrap_k8s_cluster.sh | grep k8s_version= | head -1 | cut -f2 -d"=")
echo "Downloading kubernetes $k8s_version for Linux"
wget -c https://github.com/GoogleCloudPlatform/kubernetes/releases/download/$k8s_version/kubernetes.tar.gz
tar -xzvf kubernetes.tar.gz kubernetes/platforms/linux/amd64
mv -f ./kubernetes/platforms/linux/amd64/kubectl ~/k8s-bin
mv -f ./kubernetes/platforms/linux/amd64/kubecfg ~/k8s-bin
# clean up
rm -fr ./kubernetes
rm -fr ./kubernetes.tar.gz

echo "kubecfg and kubectl were copied to ~/k8s-bin"
echo " "

