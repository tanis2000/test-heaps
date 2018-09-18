import hxp.*;


class Script extends hxp.Script {
	
	
	public function new () {
		
		super ();
		
		if (command == "build" || command == "test") {
			
			build ();
			
		}
		
		if (command == "run" || command == "test") {
			
			run ();
			
		}
		
	}
	
	
	private function build () {
		
		System.runCommand ("", "haxe", [ "Build.lime.hxml" ]);
		
	}
	
	
	private function run ():Void {
		
		switch (System.hostPlatform) {
			
			case "linux":
				
				var ndll = new NDLL ("lime");
				ndll.haxelib = new Haxelib ("lime");
				var libraryPath = NDLL.getLibraryPath (ndll, "Linux64");
				
				if (libraryPath != null) {
					System.copyFile (libraryPath, "bin/linux/lime.ndll");
				}
				
				System.runCommand ("bin/main", "./Main-debug", []);
			
			case "mac":
				
				var ndll = new NDLL ("lime");
				ndll.haxelib = new Haxelib ("lime");
				var libraryPath = NDLL.getLibraryPath (ndll, "Mac64");
				
				if (libraryPath != null) {
					System.copyFile (libraryPath, "bin/macos/lime.ndll");
				}
				
				System.runCommand ("bin/main", "./Main-debug", []);
			
			case "windows":
				
				var ndll = new NDLL ("lime");
				ndll.haxelib = new Haxelib ("lime");
				var libraryPath = NDLL.getLibraryPath (ndll, "Windows");
				
				if (libraryPath != null) {
					System.copyFile (libraryPath, "bin/windows/lime.ndll");
				}
				
				System.runCommand ("bin/main", "Main-debug.exe", []);
			
			default:
				
				// Log.error ("Unknown target \"" + target + "\"");
			
		}
		
	}
	
	
}
