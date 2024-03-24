#!/usr/bin/env nextflow

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Bonjour PROVA', 'Ciao PROVA', 'Hello', 'Hola') | sayHello | view
}
