#!../../bin/linux-x86_64/bts_vacuum

#- You may have to change bts_vacuum to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/bts_vacuum.dbd",0,0)
bts_vacuum_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/bts_vacuum.db","user=nathan")

## Load record instances
epicsEnvSet("ASYN_PORT",     "BTS_VAC_ADS")

## Production
epicsEnvSet("IPADDR",        "192.168.74.1")
epicsEnvSet("AMSID",         "192.168.74.1.1.1")
epicsEnvSet("IPPORT",        851)

adsAsynPortDriverConfigure("$(ASYN_PORT)","$(IPADDR)","$(AMSID)",$(IPPORT), 10000, 0, 0, 500, 100, 500, 0)

asynSetTraceIOMask("$(ASYN_PORT)", -1, 2)
asynSetTraceInfoMask("$(ASYN_PORT)", -1, 5)
asynOctetSetOutputEos("$(ASYN_PORT)", -1, "\n")
asynOctetSetInputEos("$(ASYN_PORT)", -1, "\n")
asynSetTraceMask("$(ASYN_PORT)", -1, 0x41)


dbLoadRecords("../../db/bts_vac_tmc.db")


iocInit()

## Start any sequence programs
#seq sncbts_vacuum,"user=nathan"
