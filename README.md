# Cross Compile yazi for Different Platforms with Docker

I do not like to have multiple different development dependencies installed on
my computer, so I usually use [Docker](https://www.docker.com) to develop and
build.

Here are some dockerfiles to help in cross-compiling yazi for different
platforms which I use.

- QNAP TS 431 with OS 4.3.6
- RaspberryPi 3b with LibreElec
- Anbernic RG35XX H
- macOS

You should clone this repository as `crosscompile` inside your yazi repository:

```shell
cd yazi
git clone https://github.com/Skeeve/yazi-crosscompile.git crosscompile
```

## Build for QNAP TS431

As I own a QNAP TS431, I wanted to run yazi there as well.
Unfortunately it's a quite old system so I doubt many of you will have a use for
this, but maybe it helps someone to adapt it for another, older Linux.

To build simply run

`crosscompile/ts431/build.sh`

When finished, you should have a directory `crosscompile/build/ts431` containing
both, `ya` and `yazi`.

## Build for Apple

Here we have some options:

- `-a` `apple`|`intel`
- `-s` *own-sdk-version*
- `-m` *minimal-target-version*

When you have another macOS SDK than version 11.3, you can pass the version
number using `-s VERSIONNUMBER`.
Otherwise 11.3 will be downloaded and used.

To generate an SDK tarball, follow the instructions for
[osxcross](https://github.com/tpoechtrager/osxcross?tab=readme-ov-file#packaging-the-sdk).

Place your `MacOSX${VERSIONNMBER}.sdk.tar.xz` in`crosscompile/mac/`.

Running `crosscompile/mac/build.sh` without any options, will generate executables
for Apple Silicon hardware using SDK 11.3 and targeting at least 11.0.

To compile the same for Intel hardware run `crosscompile/mac/build.sh -a intel`.

The resulting `ya` and `yazi` can be found in `crosscompile/build/mac/apple` for
Apple Silicon and `crosscompile/build/mac/intel` for Intel hardware.

## Build for Raspberry Pi 3b

I also have a Raspberry Pi 3b running LibreElec.
I noticed that it seems to run the QNAP version well, so I simply copied the
files from ts431 for pi3b.
It's not really required this way, but should I ever notice that there are
better compile options for the 3b, I can change it without affecting ts431.

`crosscompile/pi3b/build.sh`

When finished, you should have a directory `crosscompile/build/pi3b` containing
both, `ya` and `yazi`.

## Build for Anbernic RG35XX H

If you regularly ssh into your RG35XX H Anbernic device, yazi might be quite
helpful here as well.

`crosscompile/rg35xxh/build.sh`

When finished, you should have a directory `crosscompile/build/rg35xxh` containing
both, `ya` and `yazi`.

## Use Buildx if build.sh won't work for you (on Windows?)

Alternatively there is a docker-compose.yaml that you can use.

`docker buildx bake -f crosscompile/docker-compose.yaml <PLATFORM>`

`<PLATFORM>` is one of

- macapple
- macintel
- ts431
- pi3b
- rg35xxh

To change the SDK (OWNSDK) or the minimal Version (MINMAC) for the macOS builds,
you have to change the build variables in `crosscompile/docker-compose.yaml`.

