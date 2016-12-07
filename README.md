# VDBench Heat

HEAT templates to implement an automated storage benchmark solution using vdbench
in OpenStack.

**_This is work in progress..._**

## Preparation

* Download vdbench from Oracle: http://www.oracle.com/technetwork/server-storage/vdbench-downloads-1901681.html
* Create SWIFT container (make it public)
* Enable web listings, allow anonymous access
```
swift post -m 'web-listings: true' vdbench
swift post -r '.r:*,.rlistings' vdbench
```
* Put vdbench.zip into container
```
swift upload vdbench50406.zip vdbench
```
* Add link to vdbench.zip to environment file, i.e.:
```
http://10.0.0.13:8080/v1/AUTH_f475ea5f46dd4689aff57287db44a944/vdbench/vdbench50406.zip
```
* This template requires an image (IMAGEID) with Ansible hooks, i.e.: https://github.com/rjrooke/heat_w_ansible
* NETWORKID should be a network with internet access so Ansible can download required packages

## Prime Data Device

* Update environment file with appropriate values
* Create heat stack
```
openstack stack create -t init_server.yaml \
--parameter image_id=<IMAGEID> \
--parameter network_id=<NETWORKID> \
init_vdbench
```
## Run Benchmarks

