# Kubernetes API Endpoints (v1.26.0)

## Discovery Endpoints
- `/api`   <!-- available endpoints -->
- `/apis`  <!-- available endpoints -->
- `/healthz`
- `/version`
- `/metrics`
- `/logs`
  
<!-- - `curl --cacert /etc/kubernetes/pki/ca.crt \
     --cert /etc/kubernetes/pki/apiserver-kubelet-client.crt \
     --key /etc/kubernetes/pki/apiserver-kubelet-client.key \
     https://SERVER-IP:6443/api/v1/pods
` -->


## Core API Group (`/api/v1`)
- `/api/v1/namespaces`
- `/api/v1/namespaces/{namespace}`
- `/api/v1/namespaces/{namespace}/pods`
- `/api/v1/namespaces/{namespace}/pods/{name}`
- `/api/v1/namespaces/{namespace}/pods/{name}/log`
- `/api/v1/namespaces/{namespace}/services`
- `/api/v1/namespaces/{namespace}/services/{name}`
- `/api/v1/nodes`
- `/api/v1/nodes/{name}`
- `/api/v1/persistentvolumes`
- `/api/v1/persistentvolumes/{name}`
- `/api/v1/persistentvolumeclaims`
- `/api/v1/persistentvolumeclaims/{name}`
- `/api/v1/configmaps`
- `/api/v1/configmaps/{name}`
- `/api/v1/secrets`
- `/api/v1/secrets/{name}`
- `/api/v1/endpoints`
- `/api/v1/endpoints/{name}`
- `/api/v1/events`
- `/api/v1/events/{name}`
- `/api/v1/limitranges`
- `/api/v1/limitranges/{name}`
- `/api/v1/poddisruptionbudgets`
- `/api/v1/poddisruptionbudgets/{name}`
- `/api/v1/podtemplates`
- `/api/v1/podtemplates/{name}`
- `/api/v1/replicationcontrollers`
- `/api/v1/replicationcontrollers/{name}`
- `/api/v1/resourcequotas`
- `/api/v1/resourcequotas/{name}`
- `/api/v1/secrets`
- `/api/v1/secrets/{name}`
- `/api/v1/serviceaccounts`
- `/api/v1/serviceaccounts/{name}`

## Apps API Group (`/apis/apps/v1`)
- `/apis/apps/v1/namespaces/{namespace}/deployments`
- `/apis/apps/v1/namespaces/{namespace}/deployments/{name}`
- `/apis/apps/v1/namespaces/{namespace}/replicasets`
- `/apis/apps/v1/namespaces/{namespace}/replicasets/{name}`
- `/apis/apps/v1/namespaces/{namespace}/statefulsets`
- `/apis/apps/v1/namespaces/{namespace}/statefulsets/{name}`

## Batch API Group (`/apis/batch/v1`)
- `/apis/batch/v1/namespaces/{namespace}/jobs`
- `/apis/batch/v1/namespaces/{namespace}/jobs/{name}`
- `/apis/batch/v1/namespaces/{namespace}/cronjobs`
- `/apis/batch/v1/namespaces/{namespace}/cronjobs/{name}`

## Extensions API Group (`/apis/extensions/v1beta1`)
- `/apis/extensions/v1beta1/namespaces/{namespace}/deployments`
- `/apis/extensions/v1beta1/namespaces/{namespace}/deployments/{name}`
- `/apis/extensions/v1beta1/namespaces/{namespace}/replicasets`
- `/apis/extensions/v1beta1/namespaces/{namespace}/replicasets/{name}`
- `/apis/extensions/v1beta1/namespaces/{namespace}/ingresses`
- `/apis/extensions/v1beta1/namespaces/{namespace}/ingresses/{name}`

## Networking API Group (`/apis/networking.k8s.io/v1`)
- `/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies`
- `/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}`

## Policy API Group (`/apis/policy/v1`)
- `/apis/policy/v1/namespaces/{namespace}/poddisruptionbudgets`
- `/apis/policy/v1/namespaces/{namespace}/poddisruptionbudgets/{name}`

## Rbac Authorization API Group (`/apis/rbac.authorization.k8s.io/v1`)
- `/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles`
- `/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles/{name}`
- `/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings`
- `/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings/{name}`
- `/apis/rbac.authorization.k8s.io/v1/clusterroles`
- `/apis/rbac.authorization.k8s.io/v1/clusterroles/{name}`
- `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings`
- `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}`

## Scheduling API Group (`/apis/scheduling.k8s.io/v1`)
- `/apis/scheduling.k8s.io/v1/namespaces/{namespace}/priorityclasses`
- `/apis/scheduling.k8s.io/v1/namespaces/{namespace}/priorityclasses/{name}`

## Storage API Group (`/apis/storage.k8s.io/v1`)
- `/apis/storage.k8s.io/v1/storageclasses`
- `/apis/storage.k8s.io/v1/storageclasses/{name}`
- `/apis/storage.k8s.io/v1/persistentvolumeclaims`
- `/apis/storage.k8s.io/v1/persistentvolumeclaims/{name}`
- `/apis/storage.k8s.io/v1/persistentvolumes`
- `/apis/storage.k8s.io/v1/persistentvolumes/{name}`

## Authentication API Group (`/apis/authentication.k8s.io/v1`)
- `/apis/authentication.k8s.io/v1/tokenreviews`
- `/apis/authentication.k8s.io/v1/tokenreviews/{name}`

## Authorization API Group (`/apis/authorization.k8s.io/v1`)
- `/apis/authorization.k8s.io/v1/selfsubjectaccessreviews`
- `/apis/authorization.k8s.io/v1/selfsubjectaccessreviews/{name}`
- `/apis/authorization.k8s.io/v1/selfsubjectrulesreviews`
- `/apis/authorization.k8s.io/v1/selfsubjectrulesreviews/{name}`
- `/apis/authorization.k8s.io/v1/subjectaccessreviews`
- `/apis/authorization.k8s.io/v1/subjectaccessreviews/{name}`

## Admissionregistration API Group (`/apis/admissionregistration.k8s.io/v1`)
- `/apis/admissionregistration.k8s.io/v1/mutatingwebhookconfigurations`
- `/apis/admissionregistration.k8s.io/v1/mutatingwebhookconfigurations/{name}`
- `/apis/admissionregistration.k8s.io/v1/validatingwebhookconfigurations`
- `/apis/admissionregistration.k8s.io/v1/validatingwebhookconfigurations/{name}`

## Apiextensions API Group (`/apis/apiextensions.k8s.io/v1`)
- `/apis/apiextensions.k8s.io/v1/customresourcedefinitions`
- `/apis/apiextensions.k8s.io/v1/customresourcedefinitions/{name}`

## Apiregistration API Group (`/apis/apiregistration.k8s.io/v1`)
- `/apis/apiregistration.k8s.io/v1/apiservices`
- `/apis/apiregistration.k8s.io/v1/apiservices/{name}`

## Certificates API Group (`/apis/certificates.k8s.io/v1`)
- `/apis/certificates.k8s.io/v1/certificateigningrequests`
- `/apis/certificates.k8s.io/v1/certificateigningrequests/{name}`

## Events API Group (`/apis/events.k8s.io/v1`)
- `/apis/events.k8s.io/v1/namespaces/{namespace}/events`
- `/apis/events.k8s.io/v1/namespaces/{namespace}/events/{name}`

## Flowcontrol API Group (`/apis/flowcontrol.apiserver.k8s.io/v1beta2`)
- `/apis/flowcontrol.apiserver.k8s.io/v1beta2/prioritylevelconfigurations`
- `/apis/flowcontrol.apiserver.k8s.io/v1beta2/prioritylevelconfigurations/{name}`
- `/apis/flowcontrol.apiserver.k8s.io/v1beta2/flowschemas`
- `/apis/flowcontrol.apiserver.k8s.io/v1beta2/flowschemas/{name}`

## Storage.k8s.io API Group (`/apis/storage.k8s.io/v1`)
- `/apis/storage.k8s.io/v1/storageclasses`
- `/apis/storage.k8s.io/v1/storageclasses/{name}`

## Metrics.k8s.io API Group (`/apis/metrics.k8s.io/v1beta1`)
- `/apis/metrics.k8s.io/v1beta1/nodes`
- `/apis/metrics.k8s.io/v1beta1/nodes/{name}`
- `/apis/metrics.k8s.io/v1beta1/pods`
- `/apis/metrics.k8s.io/v1beta1/pods/{name}`
