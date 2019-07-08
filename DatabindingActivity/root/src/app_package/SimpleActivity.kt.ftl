package ${escapeKotlinIdentifiers(packageName)}

<#if useDagger>
import dagger.android.AndroidInjection
import dagger.android.support.DaggerAppCompatActivity
<#else>
import ${superClassFqcn}
</#if>
import android.os.Bundle
<#if useAndroidX>
import androidx.databinding.DataBindingUtil
<#else>
import android.databinding.DataBindingUtil
</#if>
import ${escapeKotlinIdentifiers(packageName)}.databinding.${layoutName?replace("_"," ")?capitalize?replace(" ","")}Binding


<#if useDagger>
class ${activityClass} : DaggerAppCompatActivity() {
<#else>
class ${activityClass} : AppCompatActivity() {
</#if>
    override fun onCreate(savedInstanceState: Bundle?) {
	<#if useDagger>
		AndroidInjection.inject(this)
	</#if>
        super.onCreate(savedInstanceState)
        DataBindingUtil.setContentView<${layoutName?replace("_"," ")?capitalize?replace(" ","")}Binding>(this, R.layout.${layoutName}).apply{

		}
    }
}
