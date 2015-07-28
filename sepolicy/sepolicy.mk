#
# This policy configuration will be used by all products that
# inherit from SimpleAOSP
#

BOARD_SEPOLICY_DIRS += \
    vendor/twisted/sepolicy

BOARD_SEPOLICY_UNION += \
service_contexts \
sysinit.te \
system.te \
userinit.te

  

