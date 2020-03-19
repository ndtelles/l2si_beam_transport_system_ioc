TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = bts_vacuum
# bts_vacuum.dbd will be created and installed
DBD += bts_vacuum.dbd

# bts_vacuum.dbd will be made up from these files:
bts_vacuum_DBD += base.dbd

# Include dbd files from all support applications:
bts_vacuum_DBD += asyn.dbd
bts_vacuum_DBD += ads.dbd
bts_vacuum_DBD += asSupport.dbd

# Add all the support libraries needed by this IOC
#bts_vacuum_LIBS += xxx
bts_vacuum_LIBS += asyn
bts_vacuum_LIBS += ads
bts_vacuum_LIBS += autosave

# bts_vacuum_registerRecordDeviceDriver.cpp derives from bts_vacuum.dbd
bts_vacuum_SRCS += bts_vacuum_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
bts_vacuum_SRCS_DEFAULT += bts_vacuumMain.cpp
bts_vacuum_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#bts_vacuum_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
bts_vacuum_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

