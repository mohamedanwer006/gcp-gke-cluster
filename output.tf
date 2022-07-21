
# https://cloud.google.com/kubernetes-engine/docs/tutorials/private-cluster-bastion#gcloud_1
#  tutorial of how to to use proxy to forward traffic to cluster from remote machine using bastion as proxy 
output "ssh_to_bastion" {
  description = "GCloud ssh command to connect to the Bastion instance."
  value       = "gcloud container clusters get-credentials gke-cluster --zone us-central1-a --project anwer-gcp ; gcloud compute ssh ${google_compute_instance.bastion.name} --project ${var.project_id} --tunnel-through-iap --zone ${google_compute_instance.bastion.zone} -- -4 -L8888:localhost:8888 -N -q -f && export HTTPS_PROXY=localhost:8888 "
}

