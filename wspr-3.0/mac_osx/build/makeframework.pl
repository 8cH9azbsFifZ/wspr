#!/usr/bin/perl

my $library = $ARGV[0];

my ( $name ) = ($library =~ /\/lib\/lib(.*?)(\-|\.)[0-9.]+\.dylib/);
print "Making $name.framework\n";

`mkdir -p $name.framework/Versions/A/Resources`;
#`lipo -arch x86_64 $library -create -output $name.framework/Versions/A/$name`;
`lipo $library -create -output $name.framework/Versions/A/$name`;
`perl ~/fixframeworks.pl $name.framework/Versions/A/$name`;
`ln -s A $name.framework/Versions/Current`;
#`ln -s Versions/Current/$name $name`;
`ln -s Versions/Current/$name $name.framework/$name`;
#`ln -s Versions/Current/Resources Resources`;
`ln -s Versions/Current/Resources $name.framework/Resources`;

open INFO, ">$name.framework/Versions/A/Resources/Info.plist";
print INFO '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
print INFO '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' . "\n";
print INFO '<plist version="1.0">' . "\n";
print INFO "<dict>\n";
print INFO "\t<key>CFBundleIdentifier</key>\n";
print INFO "\t<string>com.xenotropic.$name</string>\n";
print INFO "\t<key>CFBundleName</key>\n";
print INFO "\t<string>$name</string>\n";
print INFO "\t<key>CFBundlePackageType</key>\n";
print INFO "\t<string>FMWK</string>\n";
print INFO "\t<key>CFBundleSignature</key>\n";
print INFO "\t<string>handbundle</string>\n";
print INFO "\t<key>CFBundleVersion</key>\n";
print INFO "\t<string>1.0.0</string>\n";
print INFO "</dict>\n";
print INFO "</plist>\n";
close INFO;
