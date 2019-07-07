package ${escapeKotlinIdentifiers(packageName)}

import android.os.Bundle
<#if useDagger>
import dagger.android.support.AndroidSupportInjection
import dagger.android.support.DaggerFragment
<#else>
import ${getMaterialComponentName('android.support.v4.app.Fragment', useAndroidX)}
</#if>
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
<#if !includeLayout>import android.widget.TextView</#if>
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
import ${escapeKotlinIdentifiers(packageName)}.databinding.${fragmentName?replace("_"," ")?capitalize?replace(" ","")}Binding
import androidx.databinding.DataBindingUtil


/**
 * A simple [Fragment] subclass.
 *
 */
 <#if useDagger>
class ${className} : DaggerFragment() {
<#else>
class ${className} : Fragment() {
</#if>
	override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
<#if useDagger>
		AndroidSupportInjection.inject(this)
</#if>
<#if includeLayout>
        // Inflate the layout for this fragment         
		DataBindingUtil.inflate<${fragmentName?replace("_"," ")?capitalize?replace(" ","")}Binding>(layoutInflater,R.layout.${fragmentName},container,false).apply{
            return root
        }
<#else>
        return TextView(activity).apply {
            setText(R.string.hello_blank_fragment)
        }
</#if>
    }
}
