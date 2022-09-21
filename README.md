## CMakeProject1

# What is it?
Generic CMake Project template for a full CI pipeline, with in-built CMake presets, vcpkg package dependancy manager, NuGet binary cacheing, git actions workflows, and html documetation generated by doxygen integration; plus a whole lot more to come.

## Features;

- Flexible project management and build targets driven by CMake
- An expansive range of CMake build, configure, test, and debug presets
- Support for Git submodule import
- Microsoft vcpkg toolchain for package dependency management (via Git)
- NuGet package hosting and cacheing support
- Git Action workflows that run a set of simple CTest presets on your code
- Clean and intuituve process documentation and result logging
- Doxygen html document generator
- Host a GitHub Page for your project documentation at the click of a button
- Full IntelliSense support for all imported modules (where available)
- Create shared and static libraries (.dll, .lib), executables (.exe), and all sorts of custom targets using modern, cutting-edge and well-supported toolsets
- Target, test, build, and deploy for a wide range of operating systems, architectures, compilers, and configurations from the very beginning of your project and beyond!

## Requirements;

- GitHub client & account
- CMake-enabled IDE for C/C++ development*

*(I recommend Visual Studio Code with the official CMake Tools extension enabled, to allow full use of the supplied CMake presets)

*Please note; this project is currently in beta phase (until I upload the v1.0.0.0 binaries) and as such, may contain unexpected behaviour in unfamiliar use cases. The author shall not be held liable for any damages arising from misuse of this intellectual property. This notice shall be updated in due course.*

<p align="center">
<a href= "https://stoneydsp.github.io/html/index.html">
 <img src="https://github.com/StoneyDSP/StoneyDSP.github.io/blob/main/assets/StoneyDSP-logo2_25.png?raw=true"/></a>
</p>

## Before we begin...

Coffee! That's how I get things done!! If you'd like to see me get more things done, please kindly consider <a href="https://www.patreon.com/bePatron?u=8549187" data-patreon-widget-type="become-patron-button">buying me a coffee</a> or two ;)

<p align="center">
 <a href= "https://paypal.me/StoneyDSPAudio?country.x=ES&locale.x=en_US"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif"/></a>
</p>

<p align="center">
 <a href= "https://twitter.com/Stoney_DSP/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/twitter.png?raw=true"/></a>
 <a href= "https://www.instagram.com/stoney.d.s.p/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/instagram.png?raw=true"/></a>
 <a href= "https://www.facebook.com/StoneyDSP.Audio/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/facebook.png?raw=true"/></a>
</p>

<p align="center">
 <img src="https://github.com/StoneyDSP/CMakeProject1/blob/main/CMakeProject1_Logo.gif?raw=true"/></a>
</p>

# How to use it?

<a href= "https://stoneydsp.github.io/CMakeProject1/html/index.html">Manual - v0.0.0.1</a>

Just <a href= "https://github.com/StoneyDSP/CMakeProject1.git">clone or fork the repo</a>, generate the project build files, and run.

You will find a project named "CMakeProject1" with some useful default settings in place; namely, a pre-defined executable target, and an optional library ("foo") that contains links to the imported third-party packages (as specified by the user in "support/vcpkg/vcpkg.json").

Once the configuration step has completed in your IDE, you will also notice a variety of new folders appear in the source tree, post-configuration; "downloads", "build", and "installed" - these folders are all outputs from the configure and build processes, and can be safely removed/rebuilt at any time (but will require re-compiling on next run, once deleted).

If you're new to CMake, or unfamiliar with what you see in the terminal during the configure step; Go to the kitware website and download the latest CMake binary installer for your system and install. Use the generated "CMake-GUI.exe" and point it at this project, to get a direct view of the options stored in the CMakeCache post-config, and control/expand your project accordingly.

# How does it work?

By default, CMake will run and detect the project "CMakeProject1" as specified in the top-level "CMakeLists.txt". CMake will then activate your local Git instance, which will scan for a list of submodules (".gitmodules") in the project's top-level folder.

A default submodule at "StoneyDSP/vcpkg.git" will be detected and cloned into the "extern" folder*. At this point, the "extern" folder - the hub of all of our git and vcpkg package management - will be populated with the full vcpkg runtime binary, and it's supporting build scripts, meaning it is ready to inject packages into our project.

vcpkg will be activated by the project creation in the CMake files. "support/vcpkg/vcpkg.json" will be read, and the packages listed under "dependencies" will be pulled from Git and built into the "installed" folder, where your project may link to them as needed. CMakeProject1 currently ships with some dependencies for demonstration purposes only - it has no actual dependencies of it's own outside of a CMake-enabled IDE - but the ones provided allow the demonstration use case to proceed.

The CMake option "USE_FOO" controls whether we include our C++ files, "foo.h" and "foo.cpp". In the shipment example, these two files are where the third-party vcpkg are "#included" and their usage defined. This is all linked into our CMake executable as an *optional* linked library, it's linkage controlled at configure-time by the "USE_FOO" option. Setting "USE_FOO" to off will, in this example, exclude the linked vcpkg packages and resort to a "default" behaviour using the C++ standard library, defined in "main.h" and "main.cpp", which themeselves comprise the necessary source files for our .exe output target - the "foo" library being expressed as an optional inclusion.

# Optional behaviours - a beginning...

*You can switch to your own or the official vcpkg branch at will; my fork will be tested against this repo periodically and sync'd if no issues occur to ensure stability.

You may add, remove, clean, and manage Git submodules in the "extern" folder in the usual ways as needed, but keep in mind that all Git commands should be run relative to the project's root folder (hence, "etern/vcpkg"). Note that vcpkg can happily store it's downloaded packages here too - that is infact it's own default behaviour - but this has been changed to allow a much easier workflow, where package source and header files sit safely next to our own project files while still being safely managed by vcpkg.

A further default behaviour is that the use of vcpkg itself, and also the git detection, is specified as an optional parameter - these may be set to "off", and the project will resort to using the C++ standard library in order to successfully build and run it's usual task. Be careful switching the Git option to "OFF" as this may cause the project to fail at configing itself in some cases (you should at least have an active Git instance running in the background).

# Continuous integration

It is possible to store the downloaded packages and in some cases, the built binaries, generated from git/vcpkg either inside your "extern" folder - where 'git clean' can friends can look after it - or even in NuGet packages hosted on your git.

Once you make any changes and push to your develop branch, switch to Github's "actions" tab to watch multi-platform tests (defined in ".github/workflows" and "tests/CMakeLists.txt") performed remotely on git servers, to ensure your code remains portable even on systems out of reach from within your usual develop environment (while enabling you to continue running your own machine locally, remaining productive). Note that the vcpkg package builds can be stashed and cached in your NuGet host/server, further spedding up both the remote testing AND the local building processes (stay tuned).

# What else?

There's a more going on in here currently undocumented, and a whole lot more other bits and pieces that I'm tapping into bit by bit. Once I'm happy to use it for my own projects, I will share a v1.0.0.0 binary release here on git with a full manual...

If you happen upon this project and would like to make suggestions, contribute, discuss, etc then I'd love to hear from you :) elsewise, I will simply continue building this for my own use!

# What's next?

I hope to expand my generic Console Application as a kind of shell for this project, and then build a GUI project from it which might control the entire project interface...

*more coming soon, but for now, it really is that simple!*

# Further reading

Read the <a href= "https://stoneydsp.github.io/CMakeProject1/index.html">docs.</a>

View the <a href= "https://github.com/StoneyDSP/CMakeProject1.git">source code.</a>

# Additional Download Content

## <a href= "https://cmake.org/">CMake</a>

## <a href= "https://vcpkg.io/en/index.html">vcpkg</a>

## <a href= "https://doxygen.nl/">Doxygen</a>

## <a href= "https://code.visualstudio.com/">Visual Studio Code</a>

## <a href= "https://vcpkg.io/en/packages.html">vcpkg packages</a>

# Before you go...

Coffee! That's how I get things done!! If you'd like to see me get more things done, please kindly consider <a href="https://www.patreon.com/bePatron?u=8549187" data-patreon-widget-type="become-patron-button">buying me a coffee</a> or two ;)

<p align="center">
 <a href= "https://paypal.me/StoneyDSPAudio?country.x=ES&locale.x=en_US"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif"/></a>
</p>

<p align="center">
 <a href= "https://twitter.com/Stoney_DSP/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/twitter.png?raw=true"/></a>
 <a href= "https://www.instagram.com/stoney.d.s.p/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/instagram.png?raw=true"/></a>
 <a href= "https://www.facebook.com/StoneyDSP.Audio/"><img src="https://github.com/StoneyDSP/StoneyDSP/blob/main/assets/facebook.png?raw=true"/></a>
</p>

Copyright © 2022 StoneyDSP - All rights reserved.

Cheers and happy coding.

Nathan,

@StoneyDSP
