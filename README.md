# Compiler-project
Project in TDT4205 - Kompilatorteknikk, created a basic compiler in C that compiles VSL

## Requirements
- GCC
- GNU make
- Bison
- Yacc/Lex

## To Run

Run the first makefile in root folder

```properties
make
```

To delete 

```properties
make clean
make purge
```

Then move over to vsl_programs

```properties
cd vsl_programs
make
```

To compile the vsl programs will create an assembly file and a binary file

```properties
make compile
```

To delete 

```properties
make clean
```

Run the resulting assembly files in each folder ps2-parser to ps6-codegen2

For example:

```properties
cd ps5-codegen1
./function_call.bin
```



