<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit1c71d752f30e27a4515b312970ddcf15
{
    public static $prefixLengthsPsr4 = array (
        'C' => 
        array (
            'Controllers\\' => 12,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Controllers\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app/Controllers',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit1c71d752f30e27a4515b312970ddcf15::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit1c71d752f30e27a4515b312970ddcf15::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit1c71d752f30e27a4515b312970ddcf15::$classMap;

        }, null, ClassLoader::class);
    }
}
