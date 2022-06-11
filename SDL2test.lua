project "SLD2test"
	kind "StaticLib"
	language "C"

	systemversion "latest"

	vectorextensions "SSE"

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir("bin-int/" .. outputDir .. "/%{prj.name}")

	includedirs {"include"}

	files {
		"src/test/*.c"
	}

	defines {
		"_WINDOWS",
		"WIN32"
	}

	filter "configurations:Debug"
		defines {
			"_DEBUG"
		}
		buildoptions {
			"/Z7",
			"/ZI",
			"/Od",
			"/MD",
			"/GS-",
			"/W3"
		}
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		defines {
			"NDEBUG"
		}
		buildoptions {
			"/Z7",
			"/GF",
			"/ZI",
			"/MD",
			"/GS-",
			"/W3"
		}
		runtime "Release"
		optimize "On"
