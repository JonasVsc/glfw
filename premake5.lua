workspace "GLFW_Build"
    configurations { "Release" }
    architecture "x64"

project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("bin/%{cfg.buildcfg}/%{prj.name}")
    objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}")

    files {
        "glfw/include/GLFW/*.h",
        "glfw/src/*.c"
    }

    includedirs { "glfw/include" }

    filter "system:windows"
        systemversion "latest"
        files {
            "glfw/src/win32_*.c",
            "glfw/src/wgl_context.c",
            "glfw/src/egl_context.c",
            "glfw/src/osmesa_context.c"
        }
        defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }
        buildoptions "/MT"

    filter { "system:windows", "configurations:Release" }
        runtime "Release"
        optimize "On"
