with Array_Search; use Array_Search;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   T : Positive_Array := (5,6,3);
   N : Positive := 6;
   R : Search_Result;
begin
   Search_Array (T, N, R);
   Put_Line (Boolean'Image(R.Found));
   if R.Found then
      Put_Line (Positive'Image(R.Content));
   end if;
end Main;

