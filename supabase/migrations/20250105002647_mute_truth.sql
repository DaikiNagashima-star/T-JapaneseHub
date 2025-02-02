/*
  # Fix duplicate policies

  1. Changes
    - Safely drop existing policies if they exist
    - Recreate policies only if they don't exist
  
  2. Safety
    - Uses IF EXISTS checks to prevent errors
    - Maintains existing policy functionality
*/

-- Safely drop existing policies if they exist
DO $$ 
BEGIN
  -- Drop existing policies if they exist
  IF EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename = 'listings' 
    AND policyname = 'Anyone can view listings'
  ) THEN
    DROP POLICY "Anyone can view listings" ON listings;
  END IF;

  IF EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename = 'listings' 
    AND policyname = 'Anyone can create listings'
  ) THEN
    DROP POLICY "Anyone can create listings" ON listings;
  END IF;

  IF EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename = 'listings' 
    AND policyname = 'Users can update own listings'
  ) THEN
    DROP POLICY "Users can update own listings" ON listings;
  END IF;

  IF EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename = 'listings' 
    AND policyname = 'Users can delete own listings'
  ) THEN
    DROP POLICY "Users can delete own listings" ON listings;
  END IF;
END $$;

-- Recreate policies
CREATE POLICY "Anyone can view listings"
  ON listings FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Anyone can create listings"
  ON listings FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Users can update own listings"
  ON listings FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own listings"
  ON listings FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);