# VDBench Heat

HEAT templates to implement an automated storage benchmark solution using vdbench
in OpenStack.

**_This is work in progress..._**

## Preparation

* Download vdbench from Oracle: http://www.oracle.com/technetwork/server-storage/vdbench-downloads-1901681.html
* Create SWIFT container (make it public)
* Enable web listings, allow anonymous access
```
swift post vdbench
swift post -m 'web-listings: true' vdbench
swift post -r '.r:*,.rlistings' vdbench
```
* Put vdbench.zip into container
```
swift upload vdbench50406.zip vdbench
```
* Add link to vdbench.zip to environment file (vdbench_binary), i.e.:
```
http://10.0.0.13:8080/v1/AUTH_f475ea5f46dd4689aff57287db44a944/vdbench/vdbench50406.zip
```
* This template requires an image (image_id) with Ansible hooks, i.e.: https://github.com/rjrooke/heat_w_ansible
* network_id should be a network with internet access so Ansible can download required packages

## Prime Data Device

* Copy template and update environment file with appropriate values
* Create heat stack
```
cp examples/vdbench_environment.yaml .

openstack stack create -t init_server.yaml -e vdbench_environment.yaml init_vdbench
```
* Create image of primed data volume for subsequent tests
    * Automated Mistral workflow
    * Manual version: ssh to server, unmount fs, upload_to_image
## Run Benchmark
```
openstack stack create -t execute_vdbench_benchmark.yaml \
    -e vdbench_environment.yaml \
    --parameter vdbench_data_image=<PRIMED_IMAGE_NAME_OR_ID>
    run_vdbench
```
## Cleanup
```
openstack stack delete run_vdbench
openstack stack delete init_vdbench
swift delete vdbench
```