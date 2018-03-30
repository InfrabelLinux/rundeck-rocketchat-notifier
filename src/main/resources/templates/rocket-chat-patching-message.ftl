<#assign jobName="${executionData.job.name}">
<#assign message="Patching Notification:">
<#if trigger == "start">
    <#assign state="Started">
<#elseif trigger == "failure">
    <#assign state="Failed">
<#else>
    <#assign state="Succeeded">
</#if>
<#assign formattedTitle="${executionData.job.name} ${state?lower_case}">

{
   "channel":"${channel}",
   "attachments":[
      {
	 "title":"${formattedTitle}",
         "channel":"${channel}",
         "icon_emoji":":rundeck:",
         "fallback":"${state}: ${message}",
         "color":"${color}",
         "fields":[
            {
               "title":"Host",
               "value":"<${executionData.job.href}|${executionData.job.name}>",
               "short":true
            },
            {
               "title":"Started",
               "value":"<${executionData.href}|${executionData.dateStarted?string["yyyy-MM-dd HH:mm '('zzz')'"]}>",
               "short":true
            }
<#if trigger != "started">
            ,{
               "title":"Ended",
               "value":"<${executionData.href}|${executionData.dateEnded?string["yyyy-MM-dd HH:mm '('zzz')'"]}>",
               "short":true
            }
</#if>
]
      }
   ]
}
