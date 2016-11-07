# VDBench Heat

HEAT templates to implement an automated storage benchmark solution using vdbench
in OpenStack.

## Preparation

* Download vdbench from Oracle: http://www.oracle.com/technetwork/server-storage/vdbench-downloads-1901681.html
* Create SWIFT container (make it public)
* Enable web listings

    `swift post -m 'web-listings: true' vdbench`

* Put vdbench.zip in container
* Add link to vdbench.zip to environment file

## Prime Data Device

* Update environment file with appropriate values
* Create heat stack

`openstack stack create -t init_server.yaml init_vdbench`


## Run Benchmarks

