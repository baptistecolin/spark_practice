package body Find is

   function Find_f (A : Nat_Array; E : Natural) return Natural is
   begin
      for I in A'Range loop
         if A (I) = E then
            return I;
         end if;
      end loop;
      return 0;
   end Find_f;

end Find;
