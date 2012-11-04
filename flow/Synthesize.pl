#!c:/PurePerl/bin/perl.exe -w
use warnings;

my $numArgs = $#ARGV + 1;
print "Parsing $numArgs Verilog Files.\n";

my $m;

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
                    $line12 = 'endspecify */';

                 }

              }
              if($line12 eq "endspecify")
              {
                 $line12 = 'endspecify */';
              }

              print New_Verilog_File "$line12";
           }
        close(New_Verilog_File);
      }
}

my $hdl_files = '{ ';
for ($m = 0; $m < $numArgs; $m++)
{
     $hdl_files = $hdl_files . $ARGV[$m] . " ";
}
my $Top_Module = $ARGV[0];
chop($Top_Module);
chop($Top_Module);
#print "\nTop = $Top_Module\n";

#print "\nhdl_Files = $hdl_files\n";

open RC_File, "./rc.tcl" or die "couldn't open file";

my @RTL_Code = <RC_File>;

my $highest = $#RTL_Code;

my $line12;

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

system("rc < New_RC.tcl");
