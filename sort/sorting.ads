package Sorting is
   type Nat_Array is array (Positive range <>) of Integer;
   
   function Sorted (T : Nat_Array; I,J : Positive) return Boolean
      with Ghost,
         Pre => (if I<=J then I in T'Range and J in T'Range);

   procedure Sort (T : in out Nat_Array) with
      Pre  => T'Length > 0,
      Post => (Sorted (T, T'First, T'Last));

private

   function Max
      (T : Nat_Array;
       I : Positive;
       J : Positive) return Positive with 
      Pre  => I in T'Range and J in T'Range 
          and J-I >= 0,
      Post => (for all K in I .. J => T (Max'Result) >= T(K))
          and Max'Result in I .. J;

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
