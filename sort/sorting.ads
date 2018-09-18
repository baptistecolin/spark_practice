package Sorting is
   type Nat_Array is array (Positive range <>) of Integer;

   procedure Sort (T : in out Nat_Array) with
      Post => (for all I in T'Range => I = T'Last or else T (I) <= T (I+1));

private

   function Max
      (T : Nat_Array;
       I : Positive;
       J : Positive) return Positive with 
      Pre  => I in T'Range and I >= T'First
          and J in T'Range and J <= T'Last 
          and J-I >= 0,
      Post => (for all K in I .. J => T (Max'Result) >= T(K))
          and Max'Result >= I
          and Max'Result <= J;

   procedure Swap 
      (T : in out Nat_Array;
       I : Positive;
       J : Positive) with
      Pre  => I in T'Range and J in T'Range,
      Post => (for all K in T'Range => 
         (K = I and T (K) = T'Old (J)) or
         (K = J and T (K) = T'Old (I)) or
         (K /= I and K /= J and T (K) = T'Old (K)));
end Sorting;
