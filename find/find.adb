package body Find is

   function Find_f (A : Nat_Array; E : Natural) return Natural is
   begin
      for I in A'Range loop
         pragma Loop_Invariant
            (for all J in A'First .. I-1 => A (J) /= E);
         if A (I) = E then
            return I;
         end if;
      end loop;
      pragma assert (for all J in A'Range => A(J) /= E);
      return 0;
   end Find_f;

end Find;
