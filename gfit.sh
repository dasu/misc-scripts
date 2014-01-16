#!/bin/bash

#simple script to grab amount of total miles, members, and the average from the challenge pages on endomondo for the three offices participating

mmiles=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Total|sed 's/   Total://g'|sed 's/ mi//g'`
mpeople=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Members|sed 's/   Members://g'`
maverage=`echo "scale=3; $mmiles/$mpeople"|bc`

smiles=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Total|sed 's/   Total://g'|sed 's/ mi//g'`
speople=`echo 72`
#speople=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Members|sed 's/   Members://g'`
saverage=`echo "scale=3; $smiles/$speople"|bc`

bmiles=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Total|sed 's/   Total://g'|sed 's/ mi//g'`
bpeople=`lynx -dump "http://www.endomondo.com/challenges/0000000"|grep Members|sed 's/   Members://g'`
baverage=`echo "scale=3; $bmiles/$bpeople"|bc`
date=`date`
people=$(($mpeople+$bpeople+$speople))
miles=$(($mmiles+$smiles+$bmiles))
#perl
winner=`perl -e "if (($maverage > $saverage) && ($maverage > $baverage)) { print 'Office is winning!';} elsif(($saverage > $maverage) && ($saverage > $baverage)) { print 'Office is winning!';} elsif (($baverage > $maverage) && ($baverage > saverage)) { print 'Office is winning!';} else { print 'Could not determine winner';}"`
moon=`perl -e "print (($miles / 238900) * 100);"`
moooon=`printf "%.2f\n" $moon`
earth=`perl -e "print (($miles / 24901) * 100);"`
earth2=`printf "%.2f\n" $earth`

cat <<- _EOF_
<html>
<table border=1>
  <tbody>
    <tr>
      <th>Office</th>
      <th>Miles</th>
      <th>Amount of members</th>
      <th>Average</th>
    </tr>
    <tr>
      <td><a href="http://www.endomondo.com/challenges/0000000" target="_blank">Office #1</a></td>
      <td>$mmiles</td>
      <td>$mpeople</td>
      <td>$maverage</td>
    </tr>
    <tr>
      <td><a href="http://www.endomondo.com/challenges/0000000" target="_blank">Office #2</a></td>
      <td>$smiles</td>
      <td>$speople</td>
      <td>$saverage</td>
    </tr>
    <tr>
      <td><a href="http://www.endomondo.com/challenges/0000000" target="_blank">Office #3</a></td>
      <td>$bmiles</td>
      <td>$bpeople</td>
      <td>$baverage</td>
    </tr>
</tbody>
</table>
<br>
$winner
<br>
<br>
<strong>Stats:</strong><br>
Total amount of people participating:<b> $people</b> <br>
Total amount of miles:<b> $miles</b> <br>
Collective distance travelled around Earth: <b>$earth2%</b> around Earth's circumference!<br>
Collective distance to Moon: <b>$moooon%</b> of the way there!<br>

<br>
Last updated: $date
<br>
<i>Updates automatically every hour or so.  <br>
All information grabbed from Endomondo.</i> <br>
<a href="javascript:history.go(-1)">Click here to go back.</a>

</html>
_EOF_
