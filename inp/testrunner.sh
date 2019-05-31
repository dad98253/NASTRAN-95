export FT06=$1.out
export NPTPNM=$1.nptp
export PLTNM=$1.plt2
export PUNCHNM=$1.pnh
export OUT11=$1.out11
export IN12=$1.plt
export LOGNM=$1.log
export FT05=$1
export FTN04=$1.out04
export RFDIR=../rf
if [ -z "$SOF1" ]; then
	export SOF1=$1.sof1
fi 
export SOF2=$1.sof2
export DICTNM="none"
export FTN11="none"
export FTN12="none"
export FTN13="none"
export FTN14="none"
export FTN15=$1.out15
export FTN16=$1.out16
export FTN17="none"
export FTN18="none"
export FTN19="none"
export FTN20="none"
export FTN21="none"
export FTN22="none"
export FTN23="none"
#export DBMEM="14000000"
#export OCMEM="14000000"
source ../params.sh
export PROJ="."

set > /tmp/set.txt
export DIRCTY="${TMPDIR:-/tmp}"
#valgrind --tool=memcheck --error-limit=no --track-origins=yes --max-stackframe=20000000 
#gdb ../mds/nastran
#ddd ../mds/nastran
../mds/nastran

#/usr/local/bin/nastran


cat $1.out | /home/dad/workspace/fixnastranoutput/Release/fixnastranoutput -k > $1.out.striped
#cat $1.out.striped | sha1sum -c $1.demo.sha1
cat $1.out.striped | sha1sum -c $1.out.O0.sha1

#cat $1.out.striped | sha1sum > $1.out.O0.sha1
#cp $1.out.striped $1.out.O0.striped



