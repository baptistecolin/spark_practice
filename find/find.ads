package Find is
   type Nat_Array is array (Positive range <>) of Natural;

   function Find_f (A : Nat_Array; E : Natural) return Natural with
      Post => 
         (if (for all I in A'Range => A (I) /= E)
            then Find_f'Result = 0
          else Find_f'Result in A'Range and then A (Find_f'Result) = E);

end Find;
