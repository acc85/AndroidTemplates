package ${packageName};

<#if useDagger>
import dagger.android.support.AndroidSupportInjection;
import dagger.android.support.DaggerFragment;
<#else>
import ${getMaterialComponentName('android.support.v4.app.Fragment', useAndroidX)};
</#if>
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
<#if !includeLayout>import android.widget.TextView;</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${escapeKotlinIdentifiers(packageName)}.databinding.${underscoreToCamelCase(fragmentName)}Binding;
<#if useAndroidX>
import androidx.databinding.DataBindingUtil;
<#else>
import android.databinding.DataBindingUtil;
</#if>


/**
 * A simple {@link Fragment} subclass.
 *
 */
<#if useDagger>
public class ${className} extends DaggerFragment {
<#else>
public class ${className} extends Fragment {
</#if>
    public ${className}() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
<#if useDagger>
		AndroidSupportInjection.inject(this);
</#if>
<#if includeLayout>
        // Inflate the layout for this fragment
        ${underscoreToCamelCase(fragmentName)}Binding binding = DataBindingUtil.inflate(inflater,R.layout.${fragmentName},container,false);
		return binding.getRoot();
<#else>
        TextView textView = new TextView(getActivity());
        textView.setText(R.string.hello_blank_fragment);
        return textView;
</#if>
    }
}
