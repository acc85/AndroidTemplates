package ${escapeKotlinIdentifiers(packageName)}.bindableRecyclerView;

<#if useAndroidX="true">
import androidx.recyclerview.widget.RecyclerView;
<#else>
import android.recyclerview.widget.RecyclerView;
</#if>

interface RecyclerViewConfiguration<DATA_TYPE>{
   RecyclerView.LayoutManager layoutManager;
   RecyclerBindingAdapter<*, DATA_TYPE> adapter;
   DATA_TYPE data;
}