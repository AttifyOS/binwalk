# Binwalk

Binwalk packaged for AttifyOS

## Build instructions

```
cd src/
snapcraft
```

### Patches
- Uses sasquatch from https://github.com/threadexio/sasquatch
- In `src/binwalk/modules/extractor.py`: 
    - `child_pid is 0` is replaced with `child_pid == 0`
    - Lines containing `os.chown` are deleted as `chown` is not permitted for snap apps
