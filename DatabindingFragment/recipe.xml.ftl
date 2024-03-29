<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <#if !(hasDependency('com.android.support:support-v4')) && shouldAddDependencies>
        <dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/>
    </#if>
    <merge from="root/res/values/strings.xml" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	
<#if addDataBindingToGradle>
	<merge from="databinding.gradle.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/../../build.gradle" />
</#if>
    <#if includeLayout>
        <instantiate from="root/res/layout/fragment_databinding.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />
    </#if>

    <instantiate from="root/src/app_package/DatabindingFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}.${ktOrJavaExt}" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.${ktOrJavaExt}" />
</recipe>
