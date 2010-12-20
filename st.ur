sequence s
table t : { Id : int, S1 : string, S2:string, S3:string, S4:string }


fun page title body =
  <xml>
    <head> <title>{[title]}</title> </head>
    <body>
      {body}
    </body>
  </xml>

fun to a b = if a = b then Nil else a :: to (a+1) b

fun fill () =
    dml (DELETE FROM t WHERE 1=1);
    List.app ( fn i =>
      (nv <- nextval s;
      (dml (INSERT INTO t (Id, S1, S2, S3, S4) VALUES ({[nv]}, {["S1"]}, {["S2"]}, {["S3"]}, {["S4"]}))))
    ) (to 0 100000);
    return (page "fill" <xml>done</xml>)

fun fill_no_sgefault() =
    dml (DELETE FROM t WHERE 1=1);
    max <- return 10000;
    List.app ( fn i =>
      (nv <- nextval s;
      (dml (INSERT INTO t (Id, S1, S2, S3, S4) VALUES ({[nv]}, {["S1"]}, {["S2"]}, {["S3"]}, {["S4"]}))))
    ) (to 0 max);
    return (page "fill" <xml>done {[max]}</xml>)


fun list() =
    xml <- queryX (SELECT * FROM t)
      (fn t => <xml>Id: {[t.T.Id]} S1: {[t.T.S1]} S2: {[t.T.S2]} S3: {[t.T.S3]} S4: {[t.T.S4]}<br/></xml>);
    return (page  "list" xml)

fun main () = return (page "hello" <xml>
    <form><submit action={fill} value="fill"/></form>
    <form><submit action={fill_no_sgefault} value="fill_no_sgefault"/></form>
    <form><submit action={list} value="list"/></form>
</xml>)
