package ${packageName};

<#if useDagger>
import dagger.android.AndroidInjection;
import dagger.android.support.DaggerAppCompatActivity;
<#else>
import ${superClassFqcn};
</#if>
import android.os.Bundle;
<#if (includeCppSupport!false) && generateLayout>
import android.widget.TextView;
</#if>
<#if useAndroidX>
import androidx.databinding.DataBindingUtil;
<#else>
import android.databinding.DataBindingUtil;
</#if>
import ${escapeKotlinIdentifiers(packageName)}.databinding.${layoutName?replace("_"," ")?capitalize?replace(" ","")}Binding;


<#if useDagger>
public class ${activityClass} extends DaggerAppCompatActivity {
<#else>
public class ${activityClass} extends AppCompatActivity {
</#if>
    @Override
    protected void onCreate(Bundle savedInstanceState) {
	<#if useDagger>
		AndroidInjection.inject(this)
	</#if>
        super.onCreate(savedInstanceState);
	    ${layoutName?replace("_"," ")?capitalize?replace(" ","")}Binding binding = DataBindingUtil.setContentView(this, R.layout.${layoutName});
    }
}
