<recipe>

<#if shouldAddDependencies>
<#if !(hasDependency('com.android.support:appcompat-v7'))>
    <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
</#if>
    <dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />
</#if>

    <instantiate from="root/res/layout/simple_with_dataBinding.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${simpleLayoutName}.xml" />

<#if (isNewProject!false) && !(excludeMenu!false)>
    <#include "recipe_simple_menu.xml.ftl" />
</#if>
</recipe>
