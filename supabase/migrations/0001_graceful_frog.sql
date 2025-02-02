/*
  # Create listings table

  1. New Tables
    - `listings`
      - `id` (uuid, primary key)
      - `category` (text)
      - `title` (text)
      - `description` (text)
      - `price` (numeric, nullable)
      - `image` (text)
      - `location` (jsonb)
      - `contact` (jsonb)
      - `amenities` (text[], nullable)
      - `created_at` (timestamptz)
      - `user_id` (uuid, references auth.users)

  2. Security
    - Enable RLS on `listings` table
    - Add policies for CRUD operations
*/

CREATE TABLE listings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category text NOT NULL CHECK (category IN ('house', 'market', 'job', 'others')),
  title text NOT NULL,
  description text NOT NULL,
  price numeric,
  image text NOT NULL,
  location jsonb NOT NULL,
  contact jsonb NOT NULL,
  amenities text[],
  created_at timestamptz DEFAULT now(),
  user_id uuid REFERENCES auth.users(id)
);

ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read listings
CREATE POLICY "Anyone can view listings"
  ON listings
  FOR SELECT
  TO public
  USING (true);

-- Allow authenticated users to create listings
CREATE POLICY "Authenticated users can create listings"
  ON listings
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Allow users to update their own listings
CREATE POLICY "Users can update own listings"
  ON listings
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Allow users to delete their own listings
CREATE POLICY "Users can delete own listings"
  ON listings
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);