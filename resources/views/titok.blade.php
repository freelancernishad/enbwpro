<form action="/addvideo" method="POST">
    @csrf
<table width="100%" border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>link</th>
        <th><button type="button" style="background:green:color:white" class="add-row">Add</button></th>
    </tr>
</thead>
    <tbody>
    <?php


foreach ($data as $value) {



?>
    <tr id="row<?php echo $value['id'] ?>">
        <td><?php echo $value['id'] ?> <input type="hidden" name="id[]" value="<?php echo $value['id'] ?>"></td>
        <td><textarea name="video[]" id="" cols="30" rows="4" style="width: 100%"><?php echo $value['video'] ?></textarea></td>
        <td><button type="button" style="background: red;color:white" class="btn_remove"  id="<?php echo $value['id'] ?>">Remove</button></td>

    </tr>

<?php

}
?>

</tbody>
</table>
<button type="submit">Submit</button>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    let lineNo = <?php echo $value['id']+1 ?>;
    $(document).ready(function () {
        $(".add-row").click(function () {
            markup = `
            <tr id="row${lineNo}">
                <td>${lineNo} <input type="hidden" name="id[]" value="${lineNo}"></td>
                <td><textarea name="video[]" id="" cols="30" rows="4" style="width: 100%"></textarea></td>
                <td><button type="button" style="background: red;color:white" class="btn_remove"  id="${lineNo}">Remove</button></td>
            </tr>
            `;
            tableBody = $("table tbody");
            tableBody.append(markup);
            lineNo++;
        });




        $(document).on('click','.btn_remove',function(){
	var button_id = $(this).attr("id");
		$("#row"+button_id+"").remove();


    });

    });





</script>
