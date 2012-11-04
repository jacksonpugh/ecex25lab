#!c:/PurePerl/bin/perl.exe -w
use warnings;

my $numArgs = $#ARGV + 1;
print "Parsing $numArgs Verilog Files.\n";

my $m;
my $highest;
my $line12;
my $Top_Module;
my $hdl_files;
my $comment = 0;
if($numArgs == 0)
{
    print "Usage perl Unix_Format_Verilog sample1.v sample2.v";
}
else
{
    foreach $argnum (0 .. $#ARGV)
    {
      open Verilog_File, "$ARGV[$argnum]" or die "couldn't open Verilog file";

      my @Verilog_Code = <Verilog_File>;

      $highest = $#Verilog_Code;

      close (Verilog_File);
      my $count = 0;

      open New_Verilog_File, ">$ARGV[$argnum]" or die "couldn't open Verilog file";

           for($m = 0; $m <= $highest; $m++)
           {
              $line12 = $Verilog_Code[$m];

              $line12 =~ s/, gnd, vdd//g;
              $line12 =~ s/, .gnd\(gnd\), .vdd\(vdd\)//g;
              if($line12 =~ 'specify')
              {
                 if($count == 0)
                 {
                    $line12 =  '/* specify ';
                    $count = 1;
                 }
                 else
                 {
                    $line12 = 'endspecify */ ';
                    $comment = 1;
                 }

              }
              if($line12 eq "endspecify")
              {
                 $line12 = 'endspecify */';
              }

              print New_Verilog_File "$line12";
              if($comment == 1)
              {
                 print New_Verilog_File "\n";
                 $comment = 0;
              }
           }
        close(New_Verilog_File);
      }


$hdl_files = '{ ';
for ($m = 0; $m < $numArgs; $m++)
{
     $hdl_files = $hdl_files . $ARGV[$m] . " ";
}
$Top_Module = $ARGV[0];
chop($Top_Module);
chop($Top_Module);
#print "\nTop = $Top_Module\n";

#print "\nhdl_Files = $hdl_files\n";

open RC_File, "./rc.tcl" or die "couldn't open file";

my @RTL_Code = <RC_File>;

$highest = $#RTL_Code;

close (RC_File);

open New_RC_File, ">./New_RC.tcl" or die "couldn't open file";

for($m = 0; $m <= $highest; $m++)
{
   $line12 = $RTL_Code[$m];
#   print "Line Before: $line12\n";
   if($line12 =~ 'set hdl_files')
   {
      $line12 = "set hdl_files " . $hdl_files . "}";
   }
   if($line12 =~ 'set DESIGN')
   {
      $line12 = "set DESIGN " . $Top_Module;
   }

   print New_RC_File "$line12";
}

close(New_RC_File);

open Encounter_File, "./encounter.conf" or die "couldn't open file";

my @Encounter_Code = <Encounter_File>;

$highest = $#Encounter_Code;

close (Encounter_File);

open New_Encounter_File, ">./new_encounter.conf" or die "couldn't open file";

for($m = 0; $m <= $highest; $m++)
{
   $line12 = $Encounter_Code[$m];
#   print "Line Before: $line12\n";
   if($line12 =~ 'set my_toplevel')
   {
      $line12 = "set my_toplevel " . $Top_Module;
   }
   print New_Encounter_File "$line12";
}

close(New_Encounter_File);#!C:/Perl/bin/perl.exe -w

system("rc < New_RC.tcl");
system("encounter -init encounter.tcl");
}
