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
               "title":"Patching Job",
               "value":"<${executionData.job.href}|${executionData.job.name}>",
               "short":true
            },
            {
               "title":"Status",
               "value":"${state}",
               "short":true
            },
            {
               "title":"Execution ID",
               "value":"<${executionData.href}|#${executionData.id}>",
               "short":true
            }
<#if trigger == "failure">
            ,{
                "title":"Failed Nodes",
                "value":"${executionData.failedNodeListString!"- (Job itself failed)"}",
                "short":false
            }
</#if>
]
      }
   ]
}
