export async function getCoordinates(address: string): Promise<{ lat: number; lng: number }> {
  // Check if Google Maps API is available
  if (!window.google?.maps?.Geocoder) {
    // Return default coordinates for Toronto as fallback
    return {
      lat: 43.6532,
      lng: -79.3832
    };
  }

  const geocoder = new google.maps.Geocoder();
  
  try {
    const result = await new Promise((resolve, reject) => {
      geocoder.geocode({ address }, (results, status) => {
        if (status === 'OK' && results?.[0]) {
          resolve(results[0].geometry.location);
        } else {
          reject(new Error('Could not find location'));
        }
      });
    });

    const location = result as google.maps.LatLng;
    return {
      lat: location.lat(),
      lng: location.lng()
    };
  } catch (error) {
    // Return default coordinates for Toronto as fallback
    return {
      lat: 43.6532,
      lng: -79.3832
    };
  }
}