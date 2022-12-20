nextflow.enable.dsl=2

include { abacas123_1 } from './modules/abacas123_1/module.nf'
include { gunzip_1 } from './modules/gunzip_1/module.nf'

workflow {
input1 = Channel.fromPath(params.abacas123_1.meta_scaffold).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1]) }
input2 = Channel.fromPath(params.abacas123_1.fasta)
abacas123_1(input1, input2)
gunzip_1(abacas123_1.out.output2)
}
