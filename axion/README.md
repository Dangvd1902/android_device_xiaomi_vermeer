# AxionOS Android 17 / Redmi K70 (vermeer) — work in progress

This branch is an **experimental integration**, not a tested or flashable ROM.

## WSL2 checkout

```bash
mkdir -p ~/android/axion17 && cd ~/android/axion17
repo init -u https://github.com/AxionAOSP/android.git -b lineage-24.0 --git-lfs
mkdir -p .repo/local_manifests
curl -fL https://raw.githubusercontent.com/Dangvd1902/android_device_xiaomi_vermeer/axion-android17/axion/local_manifest_vermeer.xml -o .repo/local_manifests/vermeer.xml
# Inspect .repo/manifests/default.xml for duplicate project paths before syncing.
repo sync -c -j8 --fail-fast
```

## Not yet resolved

- Proprietary trees `vendor/xiaomi/vermeer` and `vendor/xiaomi/sm8550-common` are required by the device BoardConfig/product makefiles. Do not assume they exist in the AxionOS manifest.
- Confirm that AxionOS `lineage-24.0` has all expected framework/build changes and that the product naming convention is supported.
- Check manifest path conflicts with upstream projects before sync.
- Verify boot, radio, camera, fingerprint, sensors, SELinux and firmware on hardware before release.
- Auto-brightness debounce changes are experimental and are **not** a confirmed root-cause fix.

After all required proprietary sources and dependencies are present, try:

```bash
source build/envsetup.sh
lunch axion_vermeer-userdebug
# Choose the supported AxionOS build target after inspecting its build instructions.
```

**Never flash an unvalidated build to a daily-use device.**
