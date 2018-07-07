#use: perl rip.pl <vid id>
my $id = $ARGV[0];
my $json = `curl "https://hooktube.com/api?mode=video&id=$id"`;
my $url;

while ($json =~ /"18":\["([^"]+)"/g){ 
$url = "$1";
}

$url =~ s/\\\//\//g;

my $redirect = `curl "$url"`;

print "$redirect";
