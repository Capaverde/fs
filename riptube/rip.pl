#use: perl rip.pl <vid id> <filename>
#e.g. perl rip.pl gOqblSqx_VI pigs.mp4

my $id = $ARGV[0];
my $filename = $ARGV[1];
my $json = `curl "https://hooktube.com/api?mode=video&id=$id"`;
my $url;

if ($json =~ /"18":\["([^"]+)"/){ #18 - 640x360 mp4
	$url = "$1";
}

$url =~ s/\\\//\//g;

`curl -L "$url" > $filename`;
