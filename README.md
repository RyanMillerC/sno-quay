# SNO (Single-Node OpenShift) Quay

Install Red Hat Quay on a SNO (Single-Node OpenShift) deployment. **This is not
supported and should only be used for testing.** This repo contains a Helm
chart that deploys Quay with unmanaged HPA (horizontal pod autoscaling) and
unmanaged object storage. The chart deploys successfully for me on OpenShift
4.10.8.

**Even though object storage is deployed unmanaged, Quay still requires backing
storage.** I use [sno-minio-deployment](https://github.com/RyanMillerC/sno-minio-deployment)
to provide S3-compatible storage (MinIO) on SNO. It's not a hard requirement
that you use MinIO, any S3 compatible storage should work.

## Installing

**First, install the Quay Operator from Operator Hub! (Install to "All
Namespaces")**

After installing the operator, update `./values.yaml` with values for your
environment. Then, run:

```bash
$ make install
```

You can monitor the deployment with:

```bash
watch -d oc get pods -n quay-enterprise
```

**NOTE:** Even though HPA is set to unmanaged, some deployments still get
created with 2 repliacas. After installing, you can safely scale those
deployments to 1.

## Uninstalling

Use this command if you need to uninstall (or re-install) for some reason.
**NOTE: This will delete all Quay data!**

```bash
$ make uninstall
```
