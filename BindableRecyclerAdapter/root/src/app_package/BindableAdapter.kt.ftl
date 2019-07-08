package ${escapeKotlinIdentifiers(packageName)}.bindableRecyclerView

<#if useAndroidX="true">
import androidx.databinding.BindingAdapter
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
<#else>
import android.databinding.BindingAdapter
import android.databinding.ViewDataBinding
import android.recyclerview.widget.RecyclerView
import ${applicationPackage}.BindableRecyclerView.RecyclerViewConfiguration
</#if>
abstract class RecyclerBindingAdapter<R:ViewDataBinding,T> : RecyclerView.Adapter<BindableViewholder<R>>(){
    var data:T? = null
}

@Suppress("UNCHECKED_CAST")
@BindingAdapter("data")
fun <DATA_TYPE> setRecyclerViewProperties(recyclerView: RecyclerView, items: DATA_TYPE) {
    (recyclerView.adapter as? RecyclerBindingAdapter<*, DATA_TYPE>)?.data = items
}

@BindingAdapter("setRecyclerViewConfiguration")
fun <T> setupRecyclerView(recyclerView: RecyclerView, recyclerViewConfiguration: RecyclerViewConfiguration<T>){
    recyclerViewConfiguration.adapter?.let{adapter->
        recyclerViewConfiguration.data?.let{data->
            adapter.data = data
        }
        recyclerView.adapter = adapter
    }
    recyclerViewConfiguration.layoutManager?.let{layoutManager->
        recyclerView.layoutManager = layoutManager
    }

}

open class BindableViewholder<T:ViewDataBinding >(var bindable:T): RecyclerView.ViewHolder(bindable.root)