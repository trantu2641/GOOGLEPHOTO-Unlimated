# Pixel1Photos RootHide

Research tweak for Google Photos on jailbroken iOS.

## Target

Google Photos only.

Bundle filter:

com.google.Photos

## Architecture

arm64e

## iOS

iOS 15+ / iOS 16.x

## Purpose

This project investigates device-information APIs accessed by
Google Photos on iOS.

The tweak does not modify system-wide device information.

## Build

```bash
export THEOS=$HOME/theos
make package FINALPACKAGE=1
