/*
  # Update listings table policies

  1. Changes
    - Remove authentication requirement for creating listings
    - Allow public access for creating listings
    
  2. Security
    - Enable RLS on listings table
    - Add policy for public access
*/

-- Update RLS policies
DROP POLICY IF EXISTS "Authenticated users can create listings" ON listings;

CREATE POLICY "Anyone can create listings"
  ON listings FOR INSERT
  TO public
  WITH CHECK (true);