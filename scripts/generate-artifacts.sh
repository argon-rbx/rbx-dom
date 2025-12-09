#!/bin/sh

cargo run --bin rbx_reflector values allValues.json --no-pretty

cargo run --bin rbx_reflector generate database.msgpack --patches patches --human-readable
