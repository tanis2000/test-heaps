# Heaps + Lime test project

This is just a simple project I'm using to test the integration between Heaps and Lime.

## Compiling

Make sure you're using my lime-7 branch of Heaps that can be found here: <https://github.com/tanis2000/heaps/tree/feature/lime-7>
`haxe Build.lime.hxml`

or

`hxp test`

## Compiling to HL/C

If you want to compile to HL and its C counterpart just run

`haxe Build.hxml`

and it will create both the .hl and .c files in the bin/ folder.

You can then copy all the hashlink *.hdll and libdl.dylib to the bin folder and run the following command to compile the C sources to a binary:

```sh
gcc -O3 -o main -std=c11 -I. main.c sdl.hdll ui.hdll openal.hdll fmt.hdll uv.hdll -lhl -lsdl2 -lm -lopenal -L/usr/local/opt/openal-soft/lib -framework OpenGL
```
