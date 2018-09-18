package body Sorting is
   
   procedure Swap
      (T : in out Nat_Array;
       I : Positive;
       J : Positive) is
      Tmp : Integer := T (I);
    begin
      T(I) := T(J);
      T(J) := Tmp;
    end Swap;
   
   function Max
      (T : Nat_Array;
       I : Positive;
       J : Positive)
   return Positive is
      Tmp : Positive := J;
   begin
      for K in reverse I .. J loop
         -- at each step, Tmp is the index of the local maximum in the I .. K-1 slice
         -- and Tmp does not go outside the bounds I .. K
         pragma Loop_Invariant 
             ((for all L in K .. J => L=K or else T (Tmp) >= T(L)) and (Tmp in K .. J));

         if T (K) > T (Tmp) then
            Tmp := K;
         end if;
      end loop;
      return Tmp;
   end Max;
  
   function Sorted (T : Nat_Array; I, J : Positive) return Boolean is
      (for all K in I .. J-1 => T(K) <= T(K+1))
   with Ghost,
      Pre => J > Integer'First
         and then (if I<=J then I in T'Range and J in T'Range);

   procedure Sort (T : in out Nat_Array) is
      Local_Max : Positive;
   begin
      for K in 0 .. T'Length-1 loop
         Local_Max := Max (T, T'First, T'Last-K);
         Swap (T, T'Last-K, Local_Max);

         pragma Loop_Invariant (Sorted(T, T'Last-K, T'Last));
      end loop;
   end Sort;

end Sorting;
