# Go Compiler

A Docker image for compiling Go to any supported combination of platform and architecture.

## Usage

This example compiles Go for Apple Silicon:
> docker run --rm -v ${PWD}/.cache:/tmp -v ${PWD}/data:/data -e GOARCH=arm64 -e GOOS=darwin didstopia/go-compiler:latest

Note that the mountable `/data` directory will contain all the compiled/bootstrapped files.

See [compile.sh](compile.sh) for more information.

## Apple Silicon

These instructions are specific to compiling for Apple Silicon running macOS Big Sur.

1. Compile Go for Apple Silicon using the usage example above
2. Sign all binaries in the mounted `/data` folder (see [codesign.sh](codesign.sh) for more details/example usage)
3. Copy everything from `/data` to `/opt/go` on your Apple Silicon machine
4. Add `/opt/go` to your `PATH` environment variable

Note that this project was created when official support Go for Apple Silicon wasn't released yet.

## License

See [LICENSE](LICENSE).
