<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
<#if useAndroidX="true">
	<instantiate from="root/src/app_package/BindableAdapter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bindableRecyclerView/BindableAdapter.kt" />
	<instantiate from="root/src/app_package/RecyclerViewConfigurable.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bindableRecyclerView/RecyclerViewConfiguration.kt" />			   
<#else>
	<instantiate from="root/src/app_package/BindableAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bindableRecyclerView/BindableAdapter.java" />
	<instantiate from="root/src/app_package/RecyclerViewConfigurable.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bindableRecyclerView/RecyclerViewConfiguration.java" />
</#if>

<#if addDataBindingToGradle>
		<merge from="databinding.gradle.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/../../build.gradle" />
</#if>
				   
				   
</recipe>
