<?php
function stringInsert($str,$pos,$insertstr)
{
    if (!is_array($pos))
        $pos=array($pos);

    $offset=-1;
    foreach($pos as $p)
    {
        $offset++;
        $str = substr($str, 0, $p+$offset) . $insertstr . substr($str, $p+$offset);
    }
    return $str;
}

$str = "12022017";
echo stringInsert(stringInsert($str,2,'.'),5,'.');