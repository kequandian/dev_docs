
declare -A map
map[com.baomidou.mybatisplus.activerecord.Model]='com.baomidou.mybatisplus.extension.activerecord.Model'
map[com.baomidou.mybatisplus.annotations.TableField]='com.baomidou.mybatisplus.annotation.TableField'
map[com.baomidou.mybatisplus.annotations.TableId]='com.baomidou.mybatisplus.annotation.TableId'
map[com.baomidou.mybatisplus.annotations.TableName]='com.baomidou.mybatisplus.annotation.TableName'
map[com.baomidou.mybatisplus.enums.IdType]='com.baomidou.mybatisplus.annotation.IdType'
map[com.baomidou.mybatisplus.mapper.BaseMapper]=com.baomidou.mybatisplus.core.mapper.BaseMapper
map[com.baomidou.mybatisplus.plugins.Page]=com.baomidou.mybatisplus.extension.plugins.pagination.Page
map[com.baomidou.mybatisplus.mapper.EntityWrapper]=com.baomidou.mybatisplus.core.conditions.query.QueryWrapper
map['EntityWrapper<']='QueryWrapper<'
map[com.jfeat.am.common.annotation.BusinessLog]=com.jfeat.am.module.log.annotation.BusinessLog
#map[com.baomidou.mybatisplus.toolkit.IdWorker]=

for key in ${!map[@]};do
   value=${map[$key]}
   find src -name *.java | xargs sed -i "s/$key/$value/g"
done



# for it in ${map[@]};do
#   echo $it
# done
