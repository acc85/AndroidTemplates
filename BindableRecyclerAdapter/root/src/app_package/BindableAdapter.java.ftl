package ${escapeKotlinIdentifiers(packageName)}.bindableRecyclerView;

<#if useAndroidX="true">
import androidx.databinding.BindingAdapter;
import androidx.databinding.ViewDataBinding;
import androidx.recyclerview.widget.RecyclerView;
<#else>
import android.databinding.BindingAdapter;
import android.databinding.ViewDataBinding;
import android.recyclerview.widget.RecyclerView;
import ${applicationPackage}.BindableRecyclerView.RecyclerViewConfiguration;
</#if>
abstract class RecyclerBindingAdapter<R extends ViewDataBinding,T> extends RecyclerView.Adapter<BindableViewholder<R>>(){
    T data = null;
	
	void getData(){
		return data;
	
	void setData(T data){
		this.data = data;
}

@BindingAdapter("data")
public static void <DATA_TYPE> setRecyclerViewProperties(RecyclerView recyclerView, DATA_TYPE items) {
    ((RecyclerBindingAdapter<*, DATA_TYPE>)recyclerView.adapter).setData(items)
}

@BindingAdapter("setRecyclerViewConfiguration")
public static void <T> setupRecyclerView(RecyclerView recyclerView, RecyclerViewConfiguration<T> recyclerViewConfiguration){
	if(recyclerViewConfiguration.adapter != null){
		if(recyclerViewConfiguration.data != null){
			recyclerViewConfiguration.adapter.data = recyclerViewConfiguration.data;
		}
		recyclerView.adapter = recyclerViewConfiguration.adapter;
	}
	if(recyclerViewConfiguration.layoutManager != null){
		recyclerView.layoutManager = recyclerViewConfiguration.layoutManager;
	}
}

public class BindableViewholder<T extends ViewDataBinding >(T bindable): RecyclerView.ViewHolder(bindable.root)