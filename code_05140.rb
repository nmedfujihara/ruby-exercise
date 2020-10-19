p a = :foo    #=> :foo
p a.object_id #=> 987228
p b = :foo    #=> :foo
p b.object_id #=> 987228
p c = :fo     #=> :fo
p c.object_id #=> 987548
d = :foo
p d.object_id
