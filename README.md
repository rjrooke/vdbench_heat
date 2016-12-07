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
* Put vdbench.zip in container
* Add link to vdbench.zip to environment file
* This template requires an image with Ansible hooks, i.e.: https://github.com/rjrooke/heat_w_ansible

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

