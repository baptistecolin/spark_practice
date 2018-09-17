package body Array_Search is

   procedure Search_Array
      (A       : Positive_Array;
       E       : Positive;
       Result  : out Search_Result) is
   begin
      for I in A'Range loop
         if A(I) = E then
            Result := (Found   => True,
                       Content => I);
            return;
         end if;
      end loop;
      Result := (Found => False);
   end Search_Array;

end Array_Search;

