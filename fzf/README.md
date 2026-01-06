# Cross Compile fzf

yazi can make use of fzf.
Here is a Dockerfile for crosscompiling fzf for TS431.

## Compilation

1. Clone fzf from https://github.com/junegunn/fzf.git
2. Copy `Dockerfile.ts431`
3. Build `docker build --output type=local,dest=. -f Dockerfile.ts431 .`

