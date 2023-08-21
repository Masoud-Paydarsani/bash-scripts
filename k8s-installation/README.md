# k8s-installation-ubuntu.sh
can be used to install kubeadm, kubectl and kubelet with all requirements on ubuntu hosts both master and worker nodes. you can avoid installing kubectl only on worker nodes.

# k8s-master-initialization.sh
can be used to initialize the master node of kubernetes cluster and it will output a join command on the screen to be able to use on worker nodes to join the cluster.