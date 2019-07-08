package ${escapeKotlinIdentifiers(packageName)}.bindableRecyclerView

<#if useAndroidX="true">
import androidx.recyclerview.widget.RecyclerView
<#else>
import android.recyclerview.widget.RecyclerView
</#if>

interface RecyclerViewConfiguration<DATA_TYPE>{
    var layoutManager : RecyclerView.LayoutManager?
    var adapter : RecyclerBindingAdapter<*, DATA_TYPE>?
    var data : DATA_TYPE?
}