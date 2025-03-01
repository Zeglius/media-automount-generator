## [0.2.3](https://github.com/Zeglius/media-automount-generator/compare/v0.2.2...v0.2.3) (2025-02-23)


### Bug Fixes

* Ensure we are not processing LUKS or LVM devices ([c3fb6bb](https://github.com/Zeglius/media-automount-generator/commit/c3fb6bb80315466341b5ee44d1da698450919425))



## [0.2.4](https://github.com/Zeglius/media-automount-generator/compare/v0.2.3...v0.2.4) (2025-03-01)


### Bug Fixes

* Add /dev/dm-X LVM devices to be filtered out ([#5](https://github.com/Zeglius/media-automount-generator/issues/5)) ([1bbae4e](https://github.com/Zeglius/media-automount-generator/commit/1bbae4e10fa3041ce890fc865f5cb5e5c4336f69))
* Use systemd-mount --list to fetch partition devices ([#2](https://github.com/Zeglius/media-automount-generator/issues/2)) ([9e0e805](https://github.com/Zeglius/media-automount-generator/commit/9e0e80562953e91334c8199321db35e0fa4a8eae))

## [0.2.2](https://github.com/Zeglius/media-automount-generator/compare/v0.2.1...v0.2.2) (2025-02-09)



## [0.2.1](https://github.com/Zeglius/media-automount-generator/compare/v0.2.0...v0.2.1) (2025-02-09)


### Bug Fixes

* More reliable fstab check ([f820212](https://github.com/Zeglius/media-automount-generator/commit/f8202126d002da3fbc118f11dba1302db0f2b3cc))



# [0.2.0](https://github.com/Zeglius/media-automount-generator/compare/v0.1.0...v0.2.0) (2025-02-08)


### Features

* Move configuration to media-automount.d ([08821d0](https://github.com/Zeglius/media-automount-generator/commit/08821d02bb1d4cd28752f56dc8d3479e0ea054d9))
* Suffix configuration files with '.conf' ([951d622](https://github.com/Zeglius/media-automount-generator/commit/951d622189307e86e50f432cb2aa0724bc15a8e5))



# [0.1.0](https://github.com/Zeglius/media-automount-generator/compare/284c1d63872f37a48d0d975c38819041f20569d1...v0.1.0) (2025-02-07)


### Features

* Set mountpoints under '/media/media-automount' ([284c1d6](https://github.com/Zeglius/media-automount-generator/commit/284c1d63872f37a48d0d975c38819041f20569d1))
