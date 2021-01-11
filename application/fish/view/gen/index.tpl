{extend name="Public:Baseindex" /}
{block name="content"}
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i
                    class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
        <a href="{:url('save')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加</a></span>
        <span class="r">共有数据：<strong>{$count}</strong> 条</span></div>
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr>
            <th width="25"><input type="checkbox"></th>
            <?php foreach($fileds as $field):   ?>
            <th><?php $arr =  explode('@',$field['Comment']); echo $arr[0];?></th>
            <?php endForeach;  ?>
            <th>操作</th>
        </tr>
        </thead>
        {volist name="rows" id="row"}
            <tbody>
            <tr>
                <td><input type="checkbox" value="{$row.id}" name="id"></td>
                <?php foreach($fileds as $field):
                if($field['Field']=='logo'):?>
                <td><img style="width: 100px;height: 80px;" src="{$row.<?php echo $field['Field'] ?>}" alt=""></td>
                <?php elseif($field['Field']=='create_time'): ?>
                <td>{$row.<?php echo $field['Field'] ?>|date='Y-m-d H:i:s',###}</td>
                <?php else: ?>
                <td>{$row.<?php echo $field['Field'] ?>}</td>
                <?php endif;?>
                <?php endForeach;  ?>
                <td class="td-manage">
                    <a title="编辑" href="{:url('save',array('id'=>$row['id']))}" class="ml-5"
                       style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6df;</i>
                    </a> <a title="删除" href="javascript:;" onclick="obj_del(this,{$row['id']})" class="ml-5"
                            style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6e2;</i></a>
                </td>
            </tr>
            </tbody>
        {/volist}
    </table>
{/block}
