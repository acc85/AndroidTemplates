<?xml version="1.0"?>
<recipe>


		<instantiate from="root/res/databinding_layout.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />
	<#if addDataBindingToGradle>
	<merge from="databinding.gradle.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/../../build.gradle" />
	</#if>
	
  <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />
  
  
</recipe>
