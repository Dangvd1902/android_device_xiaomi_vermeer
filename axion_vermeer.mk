# Experimental AxionOS product for Redmi K70 (vermeer).
# Inherit LineageOS device settings, preserving kernel and vendor configuration.
$(call inherit-product, device/xiaomi/vermeer/lineage_vermeer.mk)

PRODUCT_NAME := axion_vermeer
TARGET_DISABLE_EPPE := true
