#!/bin/bash
set -e
set -o xtrace

echo "%%%%%% Testing default features %%%%%%"
cargo clippy -- -D warnings
cargo test -- "$@"
echo "%%%%%% Finished testing default features %%%%%%"

echo "%%%%%% Testing feature ws-no-park %%%%%%"
cargo clippy --features ws-no-park -- -D warnings
cargo test --features ws-no-park -- "$@"
echo "%%%%%% Finished testing feature ws-no-park %%%%%%"

echo "%%%%%% Testing feature !ws-timed-fairness %%%%%%"
cargo clippy --no-default-features  --features threadpool-exec,cb-channel-exec,workstealing-exec,defaults,thread-pinning -- -D warnings
cargo test --no-default-features  --features threadpool-exec,cb-channel-exec,workstealing-exec,defaults,thread-pinning -- "$@"
echo "%%%%%% Finished testing feature !ws-timed-fairness %%%%%%"

echo "%%%%%% Testing feature thread-pinning %%%%%%"
cargo clippy --features thread-pinning -- -D warnings
cargo test --features thread-pinning -- "$@"
echo "%%%%%% Finished testing feature thread-pinning %%%%%%"

echo "%%%%%% Testing feature numa-aware %%%%%%"
cargo clippy --features numa-aware -- -D warnings
cargo test --features numa-aware -- "$@"
echo "%%%%%% Finished testing feature numa-aware %%%%%%"
