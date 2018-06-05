const userType =document.getElementById('user_user_type');

if (userType != undefined) {
  userType.addEventListener('change', (e) => {
    const selector = document.getElementById('user_user_type');
    const value = selector[selector.selectedIndex].value;
    if (value === 'client') {
      document.querySelector('.user_client_type').classList.remove('hidden');
      document.querySelector('.user_company').classList.add('hidden');
          document.querySelector('.user_address').classList.add('hidden');
      document.querySelector('.user_phone_number').classList.add('hidden');
      document.querySelector('.user_photo').classList.add('hidden');
    }
    else if (value === 'provider'){
      document.querySelector('.user_client_type').classList.add('hidden');
      document.querySelector('.user_first_name').classList.add('hidden');
      document.querySelector('.user_last_name').classList.add('hidden');
      document.querySelector('.user_company').classList.remove('hidden');
      document.querySelector('.user_address').classList.remove('hidden');
      document.querySelector('.user_phone_number').classList.remove('hidden');
      document.querySelector('.user_photo').classList.remove('hidden');
    }
  });
}

const userClientType = document.getElementById('user_client_type');

if (userType != undefined) {
  userClientType.addEventListener('change', (e) => {
    const selector = document.getElementById('user_client_type');
    const value = selector[selector.selectedIndex].value;
    if (value === 'particulier') {
      document.querySelector('.user_company').classList.add('hidden');
      document.querySelector('.user_address').classList.add('hidden');
      document.querySelector('.user_phone_number').classList.add('hidden');
      document.querySelector('.user_photo').classList.add('hidden');
      document.querySelector('.user_first_name').classList.remove('hidden');
      document.querySelector('.user_last_name').classList.remove('hidden');
      document.querySelector('.user_address').classList.remove('hidden');
      document.querySelector('.user_phone_number').classList.remove('hidden');
      document.querySelector('.user_photo').classList.remove('hidden');
    }
    else if (value === 'professionnel'){
      document.querySelector('.user_first_name').classList.add('hidden');
      document.querySelector('.user_last_name').classList.add('hidden');
          document.querySelector('.user_address').classList.add('hidden');
      document.querySelector('.user_phone_number').classList.add('hidden');
      document.querySelector('.user_photo').classList.add('hidden');
      document.querySelector('.user_company').classList.remove('hidden');
      document.querySelector('.user_address').classList.remove('hidden');
      document.querySelector('.user_phone_number').classList.remove('hidden');
      document.querySelector('.user_photo').classList.remove('hidden');
    }
  });
}

