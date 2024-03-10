project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfwnative.h",
        "src/glfw_config.h",
        "src/context.h",
        "src/init.h",
        "src/input.h",
        "src/monitor.h",
        "src/vulkan.h",
        "src/window.h"
    }

    filter "system:windows"
    buildoptions { "-std=c11", "-lgdi32" }
    systemversion "latest"
    staticruntime "On"

    files
    {
        "src/win32_init.c",
        "src/win32_joystick.c",
        "src/win32_monitor.c",
        "src/win32_time.c",
        "src/win32_thread.c",
        "src/wgl_context.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
    }

    defines
    {
        "_GLFW_WIN32",
        "_CRT_SECURE_NO_WARNINGS"
    }

    filter { "systems:windows", "configurations:Release" }
    buildOptions "/MT"