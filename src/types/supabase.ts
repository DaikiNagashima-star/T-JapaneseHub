export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      listings: {
        Row: {
          id: string
          category: 'house' | 'market' | 'job' | 'others'
          title: string
          description: string
          price: number | null
          image: string
          location: Json
          contact: Json
          amenities: string[] | null
          created_at: string
          user_id: string | null
        }
        Insert: {
          id?: string
          category: 'house' | 'market' | 'job' | 'others'
          title: string
          description: string
          price?: number | null
          image: string
          location: Json
          contact: Json
          amenities?: string[] | null
          created_at?: string
          user_id?: string | null
        }
        Update: {
          id?: string
          category?: 'house' | 'market' | 'job' | 'others'
          title?: string
          description?: string
          price?: number | null
          image?: string
          location?: Json
          contact?: Json
          amenities?: string[] | null
          created_at?: string
          user_id?: string | null
        }
      }
    }
  }
}