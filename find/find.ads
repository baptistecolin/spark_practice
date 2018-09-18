package Find is
   type Nat_Array is array (Positive range <>) of Natural;

   function Find_f (A : Nat_Array; E : Natural) return Natural with
      Post => Find_f'Result in 0 | A'Range;
end Find;
