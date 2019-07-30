## [Vector](https://vector.dev/) Performance Test

## Setup

- Create cluster

```
$ project="xxx"
$ gcloud beta container --project "${project}" \
  clusters create "data-router" \
  --zone "asia-northeast1-a" \
  --no-enable-basic-auth \
  --cluster-version "1.13.7-gke.8" \
  --machine-type "n1-highcpu-4" \
  --image-type "COS" \
  --disk-type "pd-standard" \
  --disk-size "100" \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes "4" \
  --no-enable-cloud-logging \
  --no-enable-cloud-monitoring \
  --enable-ip-alias \
  --network "projects/${project}/global/networks/default" \
  --subnetwork "projects/${project}/regions/asia-northeast1/subnetworks/default" \
  --default-max-pods-per-node "110" \
  --addons HorizontalPodAutoscaling \
  --enable-autoupgrade --enable-autorepair \
  --preemptible

# Switch kubernetes context
$ gcloud container clusters get-credentials data-router --project ${project}

$ kubectl get nodes
```

- Apply Manifest

```
$ kubectl apply -k base
```

- Show result


```
$ kubectl -n kube-system port-forward svc/grafana 3000:3000
$ open http://127.0.0.1:3000/
```

