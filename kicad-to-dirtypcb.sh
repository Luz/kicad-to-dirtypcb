#/bin/bash
#Developer: Luz
#Website: github.com/Luz
#Description: This script takes the gerber-files made by KiCad and puts it in a zip-file which is ready for dirtypcbs.com.
#Input: gerber files created by KiCad
#Output: zip file with file extensions, ready for dirtypcbs.com

OUTDIR=`basename "$PWD"`-gerber
echo "Creating directory $OUTDIR/"
mkdir -p $OUTDIR

#Board Outline
for i in *-Edge.Cuts.gbr ; do cp "$i" "$OUTDIR/${i%%-Edge.Cuts.gbr}.GBR" ; done

#Copper Layer Top and Bottom
for i in *-F.Cu.gbr ; do cp "$i" "$OUTDIR/${i%%-F.Cu.gbr}.GTL" ; done
for i in *-B.Cu.gbr ; do cp "$i" "$OUTDIR/${i%%-B.Cu.gbr}.GBL" ; done

#Mask Top and Bottom
for i in *-F.Mask.gbr ; do cp "$i" "$OUTDIR/${i%%-F.Mask.gbr}.GTS" ; done
for i in *-B.Mask.gbr ; do cp "$i" "$OUTDIR/${i%%-B.Mask.gbr}.GBS" ; done

#Silkscreen Top and Bottom
for i in *-F.SilkS.gbr ; do cp "$i" "$OUTDIR/${i%%-F.SilkS.gbr}.GTO" ; done
for i in *-B.SilkS.gbr ; do cp "$i" "$OUTDIR/${i%%-B.SilkS.gbr}.GBO" ; done

#Drill 
for i in *.drl ; do cp "$i" "$OUTDIR/${i%%.drl}.TXT" ; done

zip -r $OUTDIR.zip $OUTDIR

