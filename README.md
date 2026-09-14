# Satisfy 935 — Garmin Forerunner 935

A from-scratch Satisfy-inspired recreation of the supplied reference watch face,
targeted ONLY at the Garmin Forerunner 935.

Target:
- Garmin product ID: `fr935`
- Resolution: 240×240
- Display: round 64-colour Memory-In-Pixel
- Connect IQ API: 3.1
- Manifest ID: `01f19f14-595b-4c6f-9630-a4243c656f19`

The Forerunner 935 is officially listed by Garmin as a 240×240 round 64-colour MIP
device with Connect IQ API level 3.1.

## Build requirements

You need Garmin Connect IQ SDK 9.2.0 (or a compatible SDK), Java 11+, and the Monkey C
tools. Garmin's current SDK page provides SDK Manager downloads for macOS, Windows and Linux.

You also need a Garmin developer signing key. Keep your private key private.

### Easiest method — VS Code

1. Install Garmin Connect IQ SDK Manager.
2. Install the Garmin Monkey C extension in VS Code.
3. Download the SDK and the Forerunner 935 device definition.
4. Open this folder in VS Code.
5. Run `Monkey C: Verify Installation`.
6. Run `Monkey C: Build for Device`.
7. Select `Forerunner 935`.
8. The generated signed `.prg` will be placed in the project's `bin/` folder.

### Command line — macOS / Linux

After installing the SDK, point PATH at the active SDK's `bin` directory.

Then:

    mkdir -p bin
    monkeyc -d fr935 -f monkey.jungle -o bin/Satisfy935.prg -y /path/to/developer_key.der -r -w

### Command line — Windows

    mkdir bin
    monkeyc -d fr935 -f monkey.jungle -o bin\Satisfy935.prg -y C:\path\to\developer_key.der -r -w

## Developer key

Garmin documents this OpenSSL method:

    openssl genrsa -out developer_key.pem 4096
    openssl pkcs8 -topk8 -inform PEM -outform DER -in developer_key.pem -out developer_key.der -nocrypt

Use the resulting `developer_key.der` with `monkeyc -y`.

## Installing on the 935

After building, the `.prg` is the actual device executable. Connect the 935 to your
computer by USB and use Garmin's supported development/sideload workflow. Keep a copy
of the PRG and your developer key.

## Design notes

The reference image contains COROS/Satisfy-specific data fields. This recreation keeps
the visual hierarchy while mapping fields to Garmin data where the 935 exposes it.

Live:
- Time
- Date
- Daily steps
- Daily calories
- Heart rate history
- Activity distance where available

Visual/static:
- Satisfy label
- Halftone lower panel
- Recovery-style graph
- Sunrise marker

This is intentionally optimized for the 935's older low-resolution MIP display rather
than trying to imitate a modern AMOLED watch face.

